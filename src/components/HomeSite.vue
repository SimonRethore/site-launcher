<template>
  <div class="site">
    <div v-if="site.lead" class="site-lead"><span>Lead Dev</span></div>
    <div :class="siteLeftFrontClass">
      <img class="site-image" :src="imageLink" />
      <div class="site-name">
        <b>{{ site.name }}</b>
      </div>
    </div>
    <div :class="siteLeftBackClass">
      <img class="site-image darker" :src="imageLink" />
      <div v-if="null !== environmentSelected" class="environment-name">
        <b>{{ environmentSelected.name }}</b>
      </div>
      <div class="links">
        <template v-for="environment in site.environments">
          <template v-for="link in environment.links">
            <SiteLink
              v-if="null !== environmentSelected && environment.name === environmentSelected.name"
              :key="link.name"
              :link="link"
            ></SiteLink>
          </template>
        </template>
      </div>
    </div>
    <div class="site-right">
      <SiteEnvironment
        v-for="environment in site.environments"
        :key="environment.name"
        :environment="environment"
        :selected="site === siteSelected && environment === environmentSelected"
        @on-select="onSelectEnvironment">
      </SiteEnvironment>
    </div>
  </div>
</template>

<script>
import SiteEnvironment from '@/components/subcomponents/SiteEnvironment.vue'
import SiteLink from '@/components/subcomponents/SiteLink.vue'
import { mapGetters } from 'vuex'

export default {
  name: 'HomeSite',
  components: {
    SiteEnvironment,
    SiteLink
  },
  props: {
    site: Object
  },
  computed: {
    ...mapGetters([
      'siteSelected',
      'environmentSelected'
    ]),
    siteLeftFrontClass: function () {
      return (this.site !== this.siteSelected) ? 'site-left-front' : 'site-left-front hide'
    },
    siteLeftBackClass: function () {
      return (this.site !== this.siteSelected) ? 'site-left-back hide' : 'site-left-back'
    }
  },
  data: function () {
    return {
      imageLink: require('@/assets/' + this.site.image)
    }
  },
  methods: {
    onSelectEnvironment: function (environment) {
      if (this.site !== this.siteSelected || environment !== this.environmentSelected) {
        this.$store.commit('siteSelected', this.site)
        this.$store.commit('environmentSelected', environment)
      } else {
        this.$store.commit('siteSelected', null)
        this.$store.commit('environmentSelected', null)
      }
    }
  }
}
</script>

<style scoped lang="scss">
.site{
  display: flex;
  position: relative;
  width: 300px;
  height: 200px;
  margin: 10px;
  border-radius: 20px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);

  .site-lead {
    width: 150px;
    height: 150px;
    top: -10px;
    left: -10px;
    overflow: hidden;
    position: absolute;
  }

  .site-lead::before,
  .site-lead::after {
    position: absolute;
    z-index: -1;
    content: '';
    display: block;
    border: 5px solid #892140;
    border-top-color: transparent;
    border-left-color: transparent;
  }

  .site-lead::before {
    top: 0;
    right: 0;
  }

  .site-lead::after {
    bottom: 0;
    left: 0;
  }

  .site-lead span {
    position: absolute;
    right: -25px;
    top: 30px;
    display: block;
    width: 225px;
    padding: 15px 0;
    background-color: #a9294f;
    box-shadow: 0 5px 10px rgba(0,0,0,.1);
    color: #fff;
    font: 700 18px/1 'Rubik', sans-serif;
    font-weight: bold;
    text-shadow: 0 1px 1px rgba(0,0,0,.2);
    text-transform: uppercase;
    text-align: center;
    transform: rotate(-45deg);
  }

  .site-left-front, .site-left-back {
    width: 400px;
    height: 100%;

    .site-image {
      height: 100%;
      width: 100%;
      object-fit: cover;
      border-top-left-radius: 20px;
      border-bottom-left-radius: 20px;
    }
  }

  .site-left-front.hide, .site-left-back.hide {
    display: none;
  }

  .site-left-front{
    .site-name {
      position: relative;
      top: -55px;
      margin: 0 15px;
      padding: 8px 0;
      text-align: center;
      background-color: white;
      border-radius: 25px;
      font-family: 'Rubik', serif;
      font-size: 15px;
      text-transform: uppercase;
      box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2);

      b{
        display: inline-block;
        position: relative;
        top: 2px;
        width: calc(240px - 50px);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    }
  }

  .site-left-back {
    .environment-name{
      position: relative;
      top: -300px;
      margin-top: 20px;
      text-align: center;
      font-family: 'Rubik', serif;
      font-size: 20px;
      color: white;
      text-transform: uppercase;
    }

    .links{
      position: relative;
      top: -300px;
      margin: 20px;
      display: flex;
      flex-wrap: wrap;
    }
  }

  .site-right {
    width: 100px;
    height: 100%;
    display: grid;
  }
}

.site:hover{
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.darker{
  filter: brightness(50%);
}

@media (min-width: 768px) {
  .site {
    width: 500px;
    height: 300px;
    margin: 15px;

    .site-left-front {
      width: 400px;
      height: 100%;

      .site-name {
        top: -65px;
        font-size: 22px;

        b{
          width: calc(400px - 60px);
        }
      }
    }
  }
}
</style>

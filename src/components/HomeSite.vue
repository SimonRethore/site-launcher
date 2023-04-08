<template>
  <div class="site">
    <div class="site-left">
      <img class="site-image" :src="imageLink" />
      <div class="site-name">
        <b>{{ site.name }}</b>
      </div>
    </div>
    <div class="site-right">
      <SiteEnvironment v-for="environment in site.environments" :key="environment.name" :environment="environment"></SiteEnvironment>
    </div>
  </div>
</template>

<script>
import SiteEnvironment from '@/components/subcomponents/SiteEnvironment.vue'

export default {
  name: 'HomeSite',
  components: {
    SiteEnvironment
  },
  props: {
    site: Object
  },
  data: function () {
    return {
      imageLink: require('@/assets/' + this.site.image)
    }
  }
}
</script>

<style scoped lang="scss">
.site{
  display: flex;
  width: 300px;
  height: 200px;
  margin: 10px;
  border-radius: 20px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);

  .site-left {
    width: 400px;
    height: 100%;

    .site-image {
      height: 100%;
      width: 100%;
      object-fit: cover;
      border-top-left-radius: 20px;
      border-bottom-left-radius: 20px;
    }

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

  .site-right {
    width: 100px;
    height: 100%;
    display: grid;
  }
}

@media (min-width: 768px) {
  .site {
    width: 500px;
    height: 300px;
    margin: 15px;

    .site-left {
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

<template>
  <div id="home-view">
    <div class="header">
      <img src="@/assets/images/logo.png">
      <h1>SITE LAUNCHER</h1>
    </div>
    <div class="grid">
      <HomeSite v-for="site in sites" :key="site.name" :site="site"></HomeSite>
    </div>
  </div>
</template>

<script>
import _ from 'lodash'
import HomeSite from '@/components/HomeSite.vue'
import data from '@/assets/data.json'

export default {
  name: 'HomeView',
  components: {
    HomeSite
  },
  data: function () {
    return {
      sites: {}
    }
  },
  created () {
    this.sites = _.orderBy(data, ['name'])
  }
}
</script>

<style scoped lang="scss">
.header{
  display: flex;
  justify-content: center;
  align-items: center;
  height: 112px;
  background-color: #FAF3E0;

  img{
    height: 70px;
    width: 70px;
  }

  h1{
    margin: 5px 0 0 10px;
    font-family: 'LuckiestGuy', serif;
    font-size: 28px;
    letter-spacing: 2px;
  }
}

.grid{
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 10px 0;
}

@media (min-width: 768px) {
  .header{
    height: 150px;

    img{
      height: 100px;
      width: 100px;
    }

    h1{
      font-size: 40px;
    }
  }

  .grid{
    margin: 15px 0;
  }
}
</style>

<template>
  <div id="home-view">
    <div class="header">
      <img src="@/assets/images/logo.png">
      <h1>SITE LAUNCHER</h1>
      <label class="switch">
        <input type="checkbox" v-model="showDisabled" aria-label="Show all sites, including disabled ones">
        <span class="switch-track">
          <span class="switch-inner">
            <span class="switch-on">All sites</span>
            <span class="switch-handle"></span>
            <span class="switch-off">Active sites</span>
          </span>
        </span>
      </label>
    </div>
    <div class="grid">
      <HomeSite v-for="site in sites" :key="site.name" :site="site"></HomeSite>
    </div>
    <div class="footer">
      <p>© 2023 Simon RÉTHORÉ</p>
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
      allSites: data,
      showDisabled: false
    }
  },
  computed: {
    sites: function () {
      const sites = this.showDisabled ? this.allSites : _.reject(this.allSites, 'disabled')
      return [...sites].sort((a, b) => a.name.localeCompare(b.name, undefined, { sensitivity: 'base' }))
    }
  }
}
</script>

<style scoped lang="scss">
.header{
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  position: relative;
  min-height: 112px;
  padding-bottom: 10px;
  box-sizing: border-box;
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

  .switch{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    cursor: pointer;
    font-family: 'Rubik', serif;
    font-size: 14px;
    user-select: none;

    input{
      position: absolute;
      opacity: 0;
      width: 0;
      height: 0;
    }

    .switch-track{
      display: block;
      width: 140px;
      height: 30px;
      overflow: hidden;
      border: 1px solid #ccc;
      border-radius: 4px;
      background-color: white;
    }

    .switch-inner{
      display: flex;
      width: 250px;
      height: 100%;
      transform: translateX(-110px);
      transition: transform .2s ease;
    }

    .switch-on,
    .switch-off,
    .switch-handle{
      display: flex;
      justify-content: center;
      align-items: center;
      flex-shrink: 0;
      width: 110px;
      height: 100%;
      white-space: nowrap;
    }

    .switch-on{
      color: white;
      background-color: #a9294f;
    }

    .switch-off{
      color: #333;
      background-color: #eee;
      box-shadow: inset 0 3px 5px rgba(0,0,0,.125);
    }

    .switch-handle{
      width: 30px;
      background-color: white;
    }

    input:checked + .switch-track .switch-inner{
      transform: translateX(0);
    }

    input:focus-visible + .switch-track{
      outline: 2px solid #892140;
      outline-offset: 2px;
    }
  }
}

.grid{
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 10px 0;
}

.footer {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 80px;
  font-family: 'Rubik', serif;
  font-size: 14px;
  background-color: #FAF3E0;
}

@media (min-width: 768px) {
  .header{
    height: 150px;
    padding-bottom: 0;

    .switch{
      position: absolute;
      right: 30px;
      top: 50%;
      transform: translateY(-50%);
      width: auto;
    }

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

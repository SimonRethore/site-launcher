<template>
  <div id="home-view">
    <div class="header">
      <img src="@/assets/images/logo.png">
      <h1>SITE LAUNCHER</h1>
    </div>
  </div>
</template>

<script>

export default {
  name: 'HomeView',
  components: {}
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
    font-family: 'LuckiestGuy';
    font-size: 28px;
    letter-spacing: 2px;
  }
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
}
</style>

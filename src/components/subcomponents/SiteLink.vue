<template>
  <div class="link">
    <a :href="link.value" target="_blank">
      <span :class="linkClass">{{ link.name }}</span>
    </a>
  </div>
</template>

<script>
export default {
  name: 'SiteLink',
  props: {
    link: Object
  },
  computed: {
    linkClass: function () {
      switch (this.link.tag) {
        case 'front':
          return 'badge bg-melon'
        case 'back':
          return 'badge bg-blue'
        case 'extranet':
          return 'badge bg-green'
        case 'api':
          return 'badge bg-yellow'
        case 'github':
          return 'badge bg-black'
        case 'gitlab':
          return 'badge bg-orange'
        case 'sentry':
          return 'badge bg-purple'
        default:
          return 'badge bg-grey'
      }
    }
  }
}
</script>

<style scoped lang="scss">
.link {
  margin: 10px;
  font-family: 'Rubik', serif;

  .badge{
    display: inline-block;
    padding: .35em .65em;
    font-size: .75em;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25rem;
  }
}

.link > a {
  color: black;
}

.bg-yellow{
  background-color: #ffe78f;
}

.bg-orange{
  background-color: #ffbb91;
}

.bg-melon{
  background-color: #eb8f8f;
}

.bg-pink{
  background-color: #f6bed6; // not use yet
}

.bg-purple{
  background-color: #c5a9e4;
}

.bg-blue{
  background-color: #a2d5f2;
}

.bg-grass{
  background-color: #8fc0a9; // not use yet
}

.bg-green{
  background-color: #bbd196;
}

.bg-grey{
  background-color: #ebe6e6;
}

.bg-black{
  background-color: #9b9b9b;
}

@media screen and (max-width: 767px) {
  .link {
    margin: 5px;

    .badge{
      font-size: .5em;
    }
  }
}
</style>

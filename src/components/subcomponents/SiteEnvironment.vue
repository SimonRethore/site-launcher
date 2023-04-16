<template>
  <div class="environment">
    <button
      :class="buttonClass"
      @click="$emit('onSelect', environment)">
    </button>
  </div>
</template>

<script>
export default {
  name: 'SiteEnvironment',
  props: {
    environment: Object,
    selected: Boolean
  },
  computed: {
    buttonClass: function () {
      if (!this.selected) {
        return this.lowerName + ' icon-' + this.lowerName
      }

      return this.lowerName + ' icon-' + this.lowerName + ' active'
    }
  },
  data: function () {
    return {
      lowerName: this.environment.name.toLowerCase()
    }
  }
}
</script>

<style scoped lang="scss">
.environment {
  width: 100%;
  height: 100%;

  button {
    width: 100%;
    height: 100%;
    border: none;
    transition-duration: 1s;
    cursor: pointer;
  }

  button:hover {
    filter: brightness(80%);
  }

  button.active {
    filter: brightness(80%);
  }

  .prod {
    background-color: #9DCBED;
  }

  .preprod {
    background-color: #F7CE73;
  }

  .dev {
    background-color: #83C682;
  }

  .icon-prod {
    font-size: 35px;
  }

  .icon-preprod {
    font-size: 35px;
  }

  .icon-dev {
    font-size: 35px;
  }
}

.environment:first-child > button {
  border-top-right-radius: 20px;
}

.environment:last-child > button {
  border-bottom-right-radius: 20px;
}

@media (min-width: 768px) {
  .environment {
    .icon-prod {
      font-size: 50px;
    }

    .icon-preprod {
      font-size: 50px;
    }

    .icon-dev {
      font-size: 50px;
    }
  }
}
</style>

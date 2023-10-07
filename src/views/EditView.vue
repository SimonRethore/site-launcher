<template>
  <div id="edit-view">
    <button id="save-button" class="icon-save" type="button" @click="saveJson"></button>
    <Vue3JsonEditor
      v-model="existingJson"
      :show-btns="false"
      :expandedOnStart="true"
      @json-change="onJsonChange"
    />
  </div>
</template>

<script>
import { Vue3JsonEditor } from 'vue3-json-editor'
export default {
  name: 'EditView',
  components: {
    Vue3JsonEditor
  },
  data: function () {
    return {
      existingJson: {},
      newJson: {}
    }
  },
  async created () {
    const response = await fetch('http://localhost:8081/items', {
      method: 'GET'
    })

    this.existingJson = await response.json()
  },
  methods: {
    onJsonChange (value) {
      this.newJson = value
    },
    saveJson () {
      this.compareJson(this.existingJson, this.newJson)
      this.existingJson = this.newJson
    },
    compareJson (existingJson, newJson) {
      for (let i = 0; i < existingJson.length; i++) {
        const newItem = newJson.find((item) => item.id === existingJson[i].id)
        if (undefined === newItem) {
          // REMOVED
          fetch('http://localhost:8081/items/' + existingJson[i].id, {
            method: 'DELETE'
          })
        }
      }

      for (let i = 0; i < newJson.length; i++) {
        const existingItem = existingJson.find((item) => item.id === newJson[i].id)
        if (existingItem) {
          if (JSON.stringify(existingItem) !== JSON.stringify(newJson[i])) {
            // MODIFIED
            fetch('http://localhost:8081/items/' + newJson[i].id, {
              method: 'PUT',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify(newJson[i])
            })
          }
        } else {
          // NEW
          fetch('http://localhost:8081/items', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(newJson[i])
          })
        }
      }
    }
  }
}
</script>

<style scoped lang="scss">
#save-button{
  position: absolute;
  left: 200px;
  top: 7px;
  z-index: 2;

  cursor: pointer;
  border: none;
  background-color: transparent;
}

#save-button:hover{
  color: white;
  opacity: 0.7;
}

.icon-save {
  font-size: 20px;
  color: white;
}
</style>

import { createStore } from 'vuex'

export default createStore({
  state: {
    siteSelected: null,
    environmentSelected: null
  },
  getters: {
    siteSelected: state => {
      return state.siteSelected
    },
    environmentSelected: state => {
      return state.environmentSelected
    }
  },
  mutations: {
    siteSelected (state, siteSelected) {
      state.siteSelected = siteSelected
    },
    environmentSelected (state, environmentSelected) {
      state.environmentSelected = environmentSelected
    }
  },
  actions: {
  },
  modules: {
  }
})

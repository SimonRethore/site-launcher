import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import EditView from '../views/EditView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/edit',
    name: 'edit',
    component: EditView
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router

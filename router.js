import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Text from "./components/Text.vue"
import Home from "./components/tabbar/Home.vue"
import Search from "./components/tabbar/Search.vue"
import Petslist from "./components/petsbaike/Petslist.vue"
import Petlist from "./components/petsbaike/Petlist.vue"
import Petinfo from "./components/petsbaike/Petinfo.vue"
import Login from "./components/login/Login.vue"
import Shoucang from "./components/shoucang/Shoucang.vue"
import Reg from "./components/reg/Reg.vue"

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',redirect:"/Home"},
    {path:'/Text',component:Text},
    {path:'/Home',component:Home},
    {path:'/Petslist',component:Petslist},
    {path:'/Search',component:Search},
    {path:'/Petlist',component:Petlist},
    {path:'/Petinfo',component:Petinfo},
    {path:'/Login',component:Login},
    {path:'/Shoucang',component:Shoucang},
    {path:'/Reg',component:Reg}
  ]
})

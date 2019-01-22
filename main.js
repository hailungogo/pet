import Vue from 'vue';
import App from './App.vue';
import router from './router';
import'mint-ui/lib/style.css';
Vue.config.productionTip = false;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css';
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css';

//0.1:引入Vuex
import Vuex from "vuex"
//0.2:注册Vuex组件
Vue.use(Vuex)
//0.3:创建Vuex实例对象
var store = new Vuex.Store({
  state:{
    islogin:false,
    shouCangCount:0 //收藏页中宠物的数量
  },
  mutations:{ //修改共享数据方法
    signin(state){state.islogin=true},
    signout(state){state.islogin=false},
    increment(state){state.shouCangCount++},
    substract(state){state.shouCangCount--},
    clear(state){state.shouCangCount=0}
  },
  getters:{ //获取共享数据方法
    optShouCangCount:function(state){
      return state.shouCangCount;
    }
  }
})

//1:引入mint-ui Header组件
import {Header,Swipe,SwipeItem,Button} from "mint-ui";
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);

//3.1:引入axios库(VueResource)
import axios from "axios";
//3.2:跨域保存session值
axios.defaults.withCredentials=true;
//3.3:注册组件
Vue.prototype.axios=axios;

//4:引入vue-resource 库
import VueResource from "vue-resource";
//5:注册vue-resource 库
Vue.use(VueResource)
//6:配置vue-resource常见属性
//6.1:设置请求服务器根目录
Vue.http.options.root = "http://127.0.0.1:3000/";
//6.2:全局设置post 时候表单 //application/x-www-form-urlencoded
//将提交数据进行转码操作 
Vue.http.options.emulateJSON = true
//6.3:跨域访问保存session值选项 
Vue.http.options.withCredentials = true

//7:创建日期类型过滤器
Vue.filter("datatimeFilter",function(val){
  //7.1:创建日期对象
  var data=new Date(val);
  //7.2:获取年月日时分秒
  var y=data.getFullYear();
  var m=data.getMonth();
  var d=data.getDate();
  var h=data.getHours();
  var mi=data.getMinutes();
  var s=data.getSeconds();
  //7.3:月日时分秒格式判断07 08 09 10
  m<10&&(m="0"+m);
  d<10&&(d="0"+d);
  //7.4:拼接字符串返回
  return `${y}-${m}-${d} ${h}:${mi}:${s}`;
})

new Vue({
  router,
  render: h => h(App),
  store     //将Vuex对象注册 Vue实例
}).$mount('#app')

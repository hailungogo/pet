<template>
    <div class="app-login">
    <!--顶部导航-->
        <mt-header title="用户登录" style="background:#00ffff;">
            <router-link to="/Home" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
      <div class="mui-card">
				<div class="mui-card-header">
          <h3>用户登录</h3>
        </div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<!--form action="#"-->
             用户名: <input type="text" value="" placeholder="请输入用户名" v-model="uname"/>
             密码: <input type="password" value="" placeholder="请输入密码" v-model="upwd"/>
             <mt-button size="large" @click="handleLogin">登录</mt-button>
            <!--/form-->
					</div>
				</div>
				<div class="mui-card-footer">
          <router-link to="/Reg">请注册账号</router-link>
        </div>
			</div>     
   </div>
</template>
<script>
import {Toast} from 'mint-ui'
export default {
    data() {
       return {
         uname:"",
         upwd:""
       }
     },
     methods:{
       handleLogin(){
         //1:获取参数
         var uname = this.uname;
         var upwd = this.upwd;
         //2:正则表达式验证
         //3:发送请求
        //  var url = "login?uname="+uname+"&upwd="+upwd;
        //  this.$http.get(url).then(result=>{
        //    var obj = result.body;
        //    if(obj.code==-1){
        //        Toast(obj.msg);//登录失败提示
        //    }else{
        //        this.$router.push("/Home");//登录成功跳转主页
        //    }
        //  });
          //换一种方式发送请求
          var url = "http://127.0.0.1:3000/"+"login?uname="+uname+"&upwd="+upwd;
          this.axios.get(url).then(result=>{
            //console.log(result);
             if(result.data.code == 1){
              this.$store.commit("signin");
               this.$router.push("/Home");
             }else if(result.data.code == 0){
               Toast(result.data.msg);
             }else if(result.data.code == -1){
               Toast(result.data.msg);
             }else if(result.data.code == -2){
               Toast(result.data.msg);
             }
          })
         }
       }
    }
</script>
<style>
    .app-login .mui-card-footer{
      text-align:right;
    }
</style>ss

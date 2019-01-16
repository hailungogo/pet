<template>
    <div class="app-reg">
        <!--顶部导航-->
        <mt-header title="注册用户" style="background:#00ffff;">
            <router-link to="/Home" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
        <div class="mui-card">
		    <div class="mui-card-header">
            <h3>注册用户</h3>
            </div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
				<!--form action="#"-->
             用户名: <input type="text" value="" placeholder="请输入用户名" v-model="uname" @blur="checkUname"/>
             密码: <input type="password" value="" placeholder="请输入密码" v-model="upwd1"/>
             确认密码: <input type="password" value="" placeholder="请再次输入密码" v-model="upwd2"/>
             <mt-button size="large" @click="handleReg">注册</mt-button>
            <!--/form-->
				</div>
			</div>
        </div>
    </div>
</template>
<script>
import {Toast} from 'mint-ui'
export default {
    data(){
        return{
            uname:"",
            upwd1:"",
            upwd2:"",
            check:0
        }
    },
    methods: {
        handleReg(){
            var uname = this.uname;
            var checkUname=uname.trim().length;
            if(checkUname==0){
                Toast("用户名不能为空");
                return;//停止函数执行
            }
            var upwd = this.upwd1;
            var checkUpwd1=upwd.trim().length;
            if(checkUpwd1==0){
                Toast("密码不能为空");
                return;//停止函数执行
            }
            var upwd2 =this.upwd2;
            var checkUpwd2=upwd2.trim().length;
            if(checkUpwd2==0){
                Toast("确认密码不能为空");
                return;//停止函数执行
            }
            var check=this.check;
            if(check==1){
                if(upwd==upwd2){
                    //var url = "http://127.0.0.1:3000/reg?uname="+uname+"&upwd="+upwd;
                    var url="http://127.0.0.1:3000/reg";
                    var param=`uname=${uname}&upwd=${upwd}`;
                    this.axios.post(url,param).then(result=>{
                    //console.log(result);
                    if(result.data.code == 1){
                    this.$router.push("/Login");
                    }
                    })
                }else{
                    Toast("注册失败,两次密码不同")
                }
          }else{
              Toast("用户名已存在,请修改用户名");
          }
        },
        checkUname(){
            var uname=this.uname;
            var url="http://127.0.0.1:3000/checkUname?uname="+uname;
            this.axios.get(url).then(result=>{
                if(result.data.code==0){
                    //用户名已存在
                    Toast(result.data.msg);
                    this.check=0;
                }else{
                    //用户名不存在,可以注册
                    Toast(result.data.msg);
                    this.check=1;
                }
            })
        }
    }
}
</script>
<style>
    
</style>
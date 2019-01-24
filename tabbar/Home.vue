<template>
    <div class="app-home">
        <!--顶部导航-->
        <mt-header title="宠物社区" style="background:#00ffff;">
            <mt-button icon="back"></mt-button>
        </mt-header>
        <!--轮播图-->
        <swiper-box :list="list"></swiper-box>
		<div class="mui-input-row mui-search">
			<input type="search" class="mui-input-clear"    placeholder="请输入要查询的宠物名" @focus="Search">
		</div>  
        <!--四宫格-->
        <ul class="mui-table-view mui-grid-view mui-grid-9">
		            <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-6"><router-link to="/Petslist">
		                   <span class="mui-icon mui-icon-home"></span>
		                    <div class="mui-media-body">宠物百科</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-6"><a @click="clearCount">
		            <span class="mui-icon mui-icon-eye">
                    <span class="mui-badge">{{$store.getters.optShouCangCount}}</span>
                    </span>
		            <div class="mui-media-body">收藏记录 
                    </div></a></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-6" v-if="!this.$store.state.islogin"><router-link to="/Login">
		                    <span class="mui-icon mui-icon-contact"></span>
		                    <div class="mui-media-body" >用户登录</div></router-link></li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-6" v-else><a @click="signout">
		                    <span class="mui-icon mui-icon-contact"></span>
		                    <div class="mui-media-body">注销登录</div></a></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-6"><a href="#" id="icon-gear">
		                    <span class="mui-icon mui-icon-gear"></span>
		                    <div class="mui-media-body">应用设置</div></a></li>
        </ul>
    </div>
</template>
<script>
    //2:引入轮播图子组件
    import swiper from "../sub/swiper.vue"
    export default{
        data(){
            return {
                list:[]
            }
        },
        methods:{
            signout(){
                var url="http://127.0.0.1:3000/signout";
                this.axios.get(url).then(result=>{
                  this.$router.push("/Login");
                  this.$store.commit("signout");
                  this.$store.commit("clear");
                })
            },
            Search(){
                this.$router.push("/Search");
            },
            getImages(){
                this.$http.get("imagelist").then(result=>{
                    this.list=result.body;
                    //console.log(result.body);
                })
            },
            clearCount(){
                this.$router.push("/Shoucang");
            },
            checkLogin(){
                var url="http://127.0.0.1:3000/checkLogin";
                this.axios.get(url).then(result=>{
               if(result.data.code==1){
                   this.$store.commit("signin");
               }
              })
            },
            getCounts(){
                var url="http://127.0.0.1:3000/getCount";
                this.axios.get(url).then(result=>{
                    var count=0;
                    console.log(result.data[0].count);
                    count=result.data[0].count;
                    this.$store.commit("getcount",count);
                })
            }
        },
        created(){
            this.getImages();
            this.checkLogin();
            this.getCounts();
        },
        components:{
            "swiper-box":swiper
        }
    }
</script>
<style >
    .app-container{
        padding:0;
    }
   .app-home .app-container{
       height:100%;
   }
   .app-home .mui-input-row.mui-search{
      margin:0px 10%; 
   }
   .app-home .mui-input-clear{
       border-radius:30px; 
   }
   .app-home .mui-grid-view.mui-grid-9{
       background-color:#fff;
       border:0;
   }
   .app-home .mui-grid-view.mui-grid-9 li{
       border:0;
   }
</style>
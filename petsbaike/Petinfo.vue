<template>
    <div class="app-petinfo">
        <mt-header :title="info.cname" style="background:#00ffff;">
            <router-link :to="'/Petlist?fid='+info.fid" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
            <img src="../../img/2.jpg" slot="right" v-if="!isShoucang" style="border-radius:50%;" @click="addShoucang">
            <img src="../../img/1.jpg" slot="right" v-else
            style="border-radius:50%;" @click="deleteShoucang">
        </mt-header>
        <!--轮播图-->
        <swiper-box :list="list"></swiper-box>
        <!--宠物详细信息-->
        <ul>
            <li><b>基本信息</b></li>
            <li>英文名：{{info.ename}}</li>
            <li>性格：{{info.xingge}}</li>
            <li>祖籍：{{info.zuji}}</li>
            <li>易患病：{{info.yihuan}}</li>
            <li>寿命：{{info.shouming}}</li>
            <li>价格：{{info.jiage}}</li>
            <li>体型：{{info.tixing}}</li>
            <li>毛长：{{info.maochang}}</li>
            <li>掉毛程度：{{info.diaomao}}</li>
            <li>友善程度：{{info.youshan}}</li>
            <li>饲养难度：{{info.siyang}}</li>
            <li>功能：{{info.gongneng}}</li>
        </ul>
        <!--宠物评论-->
        <comment-box :did="did"></comment-box>
    </div>
</template>
<script>
    //1:引入评论子组件
    import comment from "../sub/comment.vue";
    //2:引入轮播图子组件
    import swiper from "../sub/swiper.vue"
    
    import {Toast} from "mint-ui"
    export default{
        data(){
           return{
               did:this.$route.query.did,
               info:{},
               list:[],
               isShoucang:''
           }
        },
        methods:{
            getPetInfo(){
                var did=this.$route.query.did;
                this.$http.get("petinfo?did="+did).then(result=>{
                    // console.log(result.body[0]);
                    this.info=result.body[0];
                })
            },
            getImages(){
                var did=this.$route.query.did;
                var url="http://127.0.0.1:3000/image1list?did="+did;
                this.axios.get(url).then(result=>{
                    console.log(result);
                    this.list=result.data;  
                })
            },
            addShoucang(){
                //1:获取参数uid did
                var did=this.$route.query.did;
                var isShoucang=1;
                //2:发送请求
                var url="http://127.0.0.1:3000/addShoucang?did="+did+"&isShoucang="+isShoucang;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        //修改全局共享数据shouCangCount
                        this.$store.commit("increment");
                        this.isShoucang=1;
                        Toast("收藏添加成功");           
                    }else{
                        Toast(result.data.msg);
                        this.$router.push("/Login");
                    }
                })
            },
            deleteShoucang(){
                //1:获取参数uid did
                var did=this.$route.query.did;
                //2:发送请求
                var url="http://127.0.0.1:3000/deleteShoucang?did="+did;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        console.log(result);
                        //修改全局共享数据shouCangCount
                        this.$store.commit("substract");
                        this.isShoucang=0;
                        Toast("收藏取消成功");           
                    }
                })
            },
            //查询是否已收藏
            checkShoucang(){
                var did=this.$route.query.did;
                var url="http://127.0.0.1:3000/checkShoucang?did="+did;
                this.axios.get(url).then(result=>{
                    console.log(result);
                    this.isShoucang=result.data.data;
                })
            }
        },
        created(){
            this.getPetInfo();
            this.getImages();
            this.checkShoucang();
        },
        components:{
            "comment-box":comment,
            "swiper-box":swiper
        }
    }
</script>
<style>
    .app-petinfo ul{
        list-style:none;
        padding-right:40px;
    }
    .app-petinfo ul li:first-child{
        font-size:19px;
    }
    .app-petinfo ul li{
        margin:5px;
    }
</style>
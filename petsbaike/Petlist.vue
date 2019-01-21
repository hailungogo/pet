<template>
    <div class="app-petlist">
        <!--顶部导航-->
        <mt-header :title="list2.fname" style="background:#00ffff;">
            <router-link to="/Petslist" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
        <ul class="nav">
            <li>
                <span @click="getPetList">全部</span>
            </li>
            <li  v-for="item1 in list1" :key="item1.lid">    
                <span @click="getPetList0" :data-lid="item1.lid">{{item1.lname}}</span>
            </li>   
        </ul>
        <div style="clear:both;"></div>
        <!--宠物表-->
        <ul class="mui-table-view mui-table-view-chevron">
				<li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.did">
					<router-link class="mui-navigate-right" :to="'/Petinfo?did='+item.did">
						<img class="mui-media-object mui-pull-left" :src="item.img_url">
						<div class="mui-media-body">
							{{item.cname}}
						</div> 
					</router-link>
				</li>
        </ul>
    </div>
</template>
<script>
    export default{
        data(){
            return {
                list:[],
                list1:[],
                list2:[]
            }
        },
        methods:{
            getPetList(){
                var fid=this.$route.query.fid;
                this.$http.get("petlist?fid="+fid).then(result=>{ 
                    this.list=result.body;
                   // console.log(result.body);
                })
           },
           getPetFamily(){
               var fid=this.$route.query.fid;
               this.$http.get("petfamily?fid="+fid).then(result=>{
                   this.list1=result.body;
                   this.list2=result.body[0];
                   console.log(result.body);
               })
           },
           getPetList0(even){
               var lid=even.target.dataset.lid;
               //console.log(lid);
               this.$http.get("petlist0?lid="+lid).then(result=>{
                   this.list=result.body;
               })
           }
        },
        created(){
            //console.log(this.$route.query.fid);
            this.getPetList();
            this.getPetFamily();
        }
    }
</script>
<style>

    .app-petlist .nav{
        height:40px;
        background:#00ffff;
        margin:0;
        padding:0;
    }
    .app-petlist .nav li{
        width:25%;
        float:left;
        text-align:center;
        list-style:none;
        color:#fff;
        line-height:40px;
        margin-top:-2px;
    }
    .app-petlist .nav li:hover{
        border-bottom:2px black solid;
    }
    .app-petlist .mui-media-body{
        position:relative;
        top:10px;
    }
</style>
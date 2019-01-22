<template>
    <div class="app-shoucang">
        <!--顶部导航-->
        <mt-header title="我的收藏" style="background:#00ffff;">
            <router-link to="/Home" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
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
export default {
    data(){
        return{
            list:[]
        }
    },
    methods: {
        getShoucang(){
               this.$http.get("getShoucang").then(result=>{
                   this.list=result.body.data;
                   //console.log(result.body);
               })
           }
    },
    created(){
        this.getShoucang()
    }
}
</script>
<style>
    
</style>
<template>
    <div class="app-petslist">
     <!--顶部导航-->
        <mt-header title="宠物百科" style="background:#00ffff;">
            <router-link to="/Home" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
    <!--宠物列表-->
        <ul class="petslist">
				<li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.fid">
					<router-link :to="'/Petlist?fid='+item.fid">
						<img class="mui-media-object mui-pull-left" :src="item.img_url">
						<div class="mui-media-body">
							{{item.fname}}百科
						</div>
					</router-link>
				</li>
        </ul>
    </div>
</template>
<script>
    export default{
        data(){
            return{
              list:[]  
            }
        },
        methods:{
            getImages(){
                this.$http.get("petslist").then(result=>{
                    //console.log(result.body);
                    this.list=result.body;
                })
            }

        },
        created(){
            this.getImages();
        }
    }
</script>
<style> 
.app-petslist .petslist{
    padding-left:0px;
}
.app-petslist .petslist .mui-table-view-cell.mui-media{
    border-radius:20px;
    background:#00ffff;
    margin:20px 20px 0;
    
}
.app-petslist .mui-media-body{
    text-align:right;
    position:relative;
    top:10px;
}
.mui-media-object.mui-pull-left{
    border-radius:50%;
}
</style>
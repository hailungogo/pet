<template>
    <div class="app-search">
        <!--顶部导航-->
        <mt-header title="搜索宠物" style="background:#00ffff;">
            <router-link to="/Home" slot="left">
            <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
        <div class="sousu">
        <input type="text" name="keyword" value="" v-model="keyword" placeholder="请输入要搜索的宠物"/>
        <mt-button  @click="getSearch">搜索</mt-button>
        </div>
        <ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.id">
					<router-link  :to="'/PetInfo?did='+item.did">
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
    import {Toast} from "mint-ui"
    export default{
        data(){
            return {
                list:[],
                keyword:""
            }
        },
        methods:{
            getSearch(){
                var keyword=this.keyword;
                var url="http://127.0.0.1:3000/search?keyword="+keyword;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                    this.list=result.data.data;
                    }else{
                    Toast(result.data.msg);
                    }
                })
            }
        },
        created() {
            
        },
    }
</script>
<style >
   .app-search mt-button{
       margin:0 auto;
   }
</style>
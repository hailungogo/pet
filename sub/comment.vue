<template>
    <div class="app-comment">
        <!--发表评论区域-->
        <textarea placeholder="请发表评论最多120个字" maxlength="120" v-model="msg" @focus="checkLogin"></textarea>
        <mt-button size="large" @click="postComment">发表评论</mt-button>
        <!--显示评论区域-->
        <div class="cmt-list">
            <div class="cmt-item" v-for="(item,i) in list" :key="item.id">
                <div class="cmt-info">
                第 {{i+1}} 楼：用户名：{{item.uname}}</br>
                发表时间：{{item.ctime | datatimeFilter}}
                <div class="cmt-body">
                   {{item.content}}
                </div>
                </div>
            </div>
        </div>
        <mt-button size="large" @click="getMore">加载更多</mt-button>
    </div>
</template>
<script>
//单独引入mini-ui组件Toast 其他组件不用
import {Toast} from 'mint-ui'
export default {
    data(){
        return {
            list:[],
            pno:0,
            pageSize:7,
            pageCount:1,
            msg:""//评论内容双向绑定
        }
    },
    methods: {
       checkLogin(){
           var url="http://127.0.0.1:3000/checkLogin";
           this.axios.get(url).then(result=>{
               console.log(result.data)
               if(result.data.code==0){
                   Toast(result.data.msg);
                   this.$router.push("/Login");
               }
           })
       },
       getMore(){
           //1:发送请求获取评论列表 did
           var did=this.did;//宠物id
           this.pno++;      //页码自增 初始0
           var pno=this.pno; //当前页码
           var pageSize=this.pageSize; //页大小
           var url="getcomment?pno="+pno+"&did="+did+"&pageSize="+pageSize;
           this.$http.get(url).then(result=>{
               //console.log(result.body)
               var rows=this.list.concat(result.body.data);
               this.list=rows;
           });
           //2:追加list
           //3:在模板中创建循环显示当前评论列表
           //4:楼层1 2 3 4
           //5:在模板中添加"加载更多"按钮 
       },
       postComment(){
           //1:获取用户输入内容,宠物编号,用户名
            var msg=this.msg;//评论内容
            var did=this.did;//父元素传递的宠物编号
            //var uname="匿名";
           //2:判断如果评论内容为空
            var size=msg.trim().length;
            if(size==0){
                Toast("评论内容不能为空");
                return;//停止函数执行
            }
           //3:提示评论内容不能为空
           //4:发送post请求
        //    var url="addComment";
        //    var obj={did:did,uname:uname,content:msg};
        //     //5:成功提示评论发表成功
        //    this.$http.post(url,obj).then(result=>{
        //        //6:提示发表成功
        //        var obj=result.body;
        //        if(obj.code==1){
        //            Toast("评论发表成功");
        //            //7:显示最新一页的数据
        //            this.pno=0;
        //            this.list=[];
        //            this.getMore();
        //        }else{
        //            Toast("评论发表失败");
        //        }
               
        //        //8:显示最新一页数据
        //    })  
                var url="http://127.0.0.1:3000/addComment";
                var param=`did=${did}&content=${msg}`;
                this.axios.post(url,param).then(result=>{
                    if(result.data.code==1){
                    Toast("评论发表成功");
                    //7:显示最新一页的数据
                    this.pno=0;
                    this.list=[];
                    this.getMore();
                    }else{
                        Toast("评论发表失败");
                    }
                })
       }
    },
    created() {
        this.getMore();
    },
    props:["did"]
}
</script>
<style>
    .app-comment{
        padding:0 40px;
    }
   .app-comment textarea{/*评论组件多行文本框 */
       font-size:14px;  /*字体小一些*/
       height:68px;     /*高度*/
       margin:0;
   } 
   .app-comment .cmt-list{/*显示评论列表*/
       margin:5px 0;
   }
   .app-comment .cmt-list .cmt-item{
       border:1px solid #aaa;   /*评论项*/
       margin-top:15px;
   }
   .app-comment .cmt-list .cmt-info{
       line-height:20px;    /*评论内容*/
       background:#ccc;
       font-size:14px;
   }
   .app-comment .cmt-list .cmt-info .cmt-body{
       overflow:auto;
   }
</style>

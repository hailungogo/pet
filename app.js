//1:加载模块 express pool
const express=require('express');
const pool=require('./pool');
//2:创建express对象
var app=express();
//2.1:加载跨域访问组件
const cors = require("cors");
//2.2:配置允许脚手架访问程序
app.use(cors({
    origin:["http://127.0.0.1:3001",
    "http://localhost:3001"],
    credentials:true
}));

//5.1:加载第三方模块 express-session
const session=require("express-session");
//5.2:对模块配置
app.use(session({
    secret:"128位随机字符",  //安全字符串
    resave:false,           //请求保存
    saveUninitialized:true,  //初始化保存
    cookie:{
        maxAge:1000 * 60 * 60 * 24
    }
}))

//3:指定监听端口3000
app.listen(3000);
//4:指定静态目录 public
// __dirname 当前程序所属目录绝对路径 
//pet.js pet_server
app.use(express.static(__dirname+'/public'));
//.GET /imagelist
//功能一：首页轮播图
app.get("/imagelist",(req,res)=>{
    var obj=[
        {id:1,image_url:"http://127.0.0.1:3000/img/index/lunbo1.jpg"},
        {id:2,image_url:"http://127.0.0.1:3000/img/index/lunbo2.jpg"},
        {id:3,image_url:"http://127.0.0.1:3000/img/index/lunbo3.jpg"},
        {id:4,image_url:"http://127.0.0.1:3000/img/index/lunbo4.jpg"},
        {id:5,image_url:"http://127.0.0.1:3000/img/index/lunbo5.jpg"}
    ];
    res.send(obj);
})
//功能二：petslist列表
app.get("/petslist",(req,res)=>{ 
   var sql="SELECT * FROM pets_family";
   pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
   })
})


//功能三:3.1查询宠物百科大物种结果
app.get("/petlist",(req,res)=>{
    var fid=req.query.fid;
    var sql="SELECT did,cname,img_url FROM pet_baike WHERE fid = ?";
    pool.query(sql,[fid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})

//3.2查询宠物百科小物种结果
app.get("/petlist0",(req,res)=>{
    var lid=req.query.lid;
    var sql="SELECT did,cname,img_url FROM pet_baike WHERE lid = ?";
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})
//3.3查询宠物百科大物种名称
app.get("/petfamily",(req,res)=>{
    var fid=req.query.fid;
    var sql="SELECT lid,fname,lname FROM pet_family WHERE fid = ?";
    pool.query(sql,[fid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})

//功能四：查询一个品种的详细信息
app.get("/petinfo",(req,res)=>{
    var did=req.query.did;                                                                                               
    var sql="SELECT did,fid,cname,ename,xingge,zuji,yihuan,shouming,jiage,tixing,maochang,diaomao,youshan,siyang,gongneng FROM pet_baike WHERE did = ?";
    pool.query(sql,[did],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})

//4.1:查询一个品种的详细轮播图
app.get("/image1list",(req,res)=>{
    var did=req.query.did;
    var sql="SELECT id,image_url FROM pet_baike_image WHERE did=?";
    pool.query(sql,[did],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})

//6.1:加载第三方模块:bodyParser 处理post请求
const bodyParser=require("body-parser");
app.use(bodyParser.urlencoded({
    //true键值对id:10任意数据类型
    //false   string/array
    extended:false
}))
//功能五:用户注册/登录
//5.1用户名查重
app.get("/checkUname",(req,res)=>{
    var uname=req.query.uname;
    var sql="SELECT uid FROM pet_login WHERE uname=?";
    pool.query(sql,uname,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:0,msg:"用户名已存在,请修改"});
        }else{
            res.send({code:1,msg:"用户名不存在,可以注册"});
        }
    })
})
//5.2:用户注册
app.post("/reg",(req,res)=>{
    //1:获取参数 uname,upwd
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    //2:创建正则表达式验证
    //3:创建sql
    var sql="INSERT INTO pet_login VALUEs (null,?,md5(?))";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"});
        }
    })
})

//5.2:用户登录
app.get("/login",(req,res)=>{
    //1:获取参数 uname,upwd
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    if(!uname){
        res.send({code:-1,msg:"用户名不能为空"});
        return;
    }
    if(!upwd){
        res.send({code:-2,msg:"密码不能为空"});
        return;
    }
    //2:创建正则表达式验证
    //3:创建sql
    var sql="SELECT * FROM pet_login WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            //7.3:将用户名保存session对象中
            var obj=result[0].uid;
            req.session.uname=uname;
            req.session.obj=obj;
            res.send({code:1,msg:"登录成功"});
        }else{
            res.send({code:0,msg:"用户名或密码有误"});
        }
    })
})
//5.3用户注销
app.get("/signout",(req,res)=>{
    req.session.obj=undefined;
    req.session.uname=undefined;
    res.end();
})

//功能六:
//6.1判断是否登录
app.get("/checkLogin",(req,res)=>{
    var uname=req.session.uname;
    if(!uname){
        res.send({code:0,msg:"请先登录,登录之后才能评论"})
    }
})

//6.2发表评论
app.post("/addComment",(req,res)=>{
    //1:获取3个参数
    var uname=req.session.uname;
    var content=req.body.content;
    var did=req.body.did;
    //2:创建sql语句
    var sql="INSERT INTO pet_comment VALUES(null,?,?,now(),?)";
    did=parseInt(did);
    pool.query(sql,[did,uname,content],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"评论发表成功"});
    })
})
//功能七:分页查找指定宠物下评论列表
app.get("/getcomment",(req,res)=>{
    //1:获取参数
    var pno=req.query.pno;//页码
    var pageSize=req.query.pageSize;//页大小
    var did=req.query.did;//宠物id
    //2:设置默认值 1  7
    if(!pno){pno=1}
    if(!pageSize){pageSize=7}
    //3:创建正则表达式验证用户输入
    var reg=/^[0-9]{1,3}$/;
    //4:如果错误停止函数运行
    if(!reg.test(pno)){
        res.send({code:-1,msg:"页编码格式不正确"});
        return;
    }
    if(!reg.test(pageSize)){
        res.send({code:-2,msg:"页大小格式不正确"});
        return;
    }
    var progress=0;
    var obj={code:1};
    //5:创建sql1 查询总记录数 
    var sql="SELECT count(id) AS c FROM pet_comment WHERE did=?";
    did=parseInt(did);
    pool.query(sql,[did],(err,result)=>{
        if(err) throw err;
        var pageCount=Math.ceil(result[0].c/pageSize);
        progress+=50;
        obj.pageCount=pageCount;
        if(progress==100){
            res.send(obj);
        }
    });
    //6:创建sql2 查询当前页内容
    var sql="SELECT id,uname,ctime,content FROM pet_comment WHERE did=? ORDER BY id DESC LIMIT ?,?";
    var offset=parseInt((pno-1)*pageSize);
        pageSize=parseInt(pageSize);
    pool.query(sql,[did,offset,pageSize],(err,result)=>{
        if(err) throw err;
        progress+=50;
        obj.data=result;
        if(progress==100){
            res.send(obj);
        }
    })
})
//功能八:
//8.1加入收藏记录
app.get("/addShoucang",(req,res)=>{
    var did=req.query.did;
    var uid=req.session.obj;
    if(!uid){
        res.send({code:-1,msg:"请先登录,登录之后才能收藏"});
        return;
    }

    var sql="INSERT INTO pet_shoucang VALUES (null,?,?) ";
    pool.query(sql,[uid,did],(err,result)=>{
        if(err) throw err;
        console.log(result);
        if(result.affectedRows>0){
        res.send({code:1,msg:"收藏添加成功"});
         }else{
             res.send({code:0,msg:"收藏添加失败"});
         }
    })
})
//8.2取消收藏记录
app.get("/deleteShoucang",(req,res)=>{
    var did=req.query.did;
    var uid=req.session.obj;
    var sql="DELETE FROM pet_shoucang WHERE did=? AND uid=?";
    pool.query(sql,[did,uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"收藏取消成功"});
    })
})
//8.3查询收藏记录
 app.get("/getShoucang",(req,res)=>{
     var uid=req.session.obj;
     var sql="SELECT c.sid,c.uid,p.cname,p.did,p.img_url FROM pet_baike p,pet_shoucang c WHERE p.did =c.did AND c.uid=?";
     pool.query(sql,[uid],(err,result)=>{
         if(err) throw err;
         if(result.length>0){
         res.send({code:1,data:result});
         }
     })
 })
//功能九:搜索宠物
app.get("/search",(req,res)=>{
    //宠物关键字
    var keyword=req.query.keyword;
    console.log(keyword);
    var sql="SELECT did,cname,img_url FROM pet_baike WHERE cname LIKE ?";
    pool.query(sql,[`%${keyword}%`],(err,result)=>{
        if(err) throw err;
        //console.log(result);
        if(result.length == 0){
            res.send({code:-1,msg:"您搜索宠物不存在噢!"});
        }else{
          res.send({code:1,data:result})
        }
    })
})

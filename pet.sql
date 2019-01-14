SET NAMES UTF8;
DROP DATABASE IF EXISTS pet;
CREATE DATABASE pet CHARSET=UTF8;
USE pet;

CREATE TABLE pets_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(16),		#宠物类别
  img_url VARCHAR(255)		
);
INSERT INTO pets_family VALUES
(1,'狗狗','http://127.0.0.1:3000/img/petslist/petslist1.jpg'),
(2,'猫咪','http://127.0.0.1:3000/img/petslist/petslist2.jpg'),
(3,'小宠','http://127.0.0.1:3000/img/petslist/petslist3.jpg'),
(4,'水族','http://127.0.0.1:3000/img/petslist/petslist4.jpg'),
(5,'爬虫','http://127.0.0.1:3000/img/petslist/petslist5.jpg');

CREATE TABLE pet_family(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,				#宠物类别编号
  fname VARCHAR(16),			#宠物类别
  lname VARCHAR(50)			#犬类别
);
INSERT INTO pet_family VALUES
(1,1,'狗狗','小型犬'),
(2,1,'狗狗','中型犬'),
(3,1,'狗狗','大型犬'),
(4,2,'猫咪','小型猫'),
(5,2,'猫咪','中型猫'),
(6,2,'猫咪','大型猫'),
(7,3,'小宠','仓鼠/龙猫'),
(8,3,'小宠','兔子'),
(9,3,'小宠','狐狸'),
(10,4,'水族','金鱼'),
(11,4,'水族','锦鲤'),
(12,4,'水族','热带鱼'),
(13,5,'爬虫','陆龟'),
(14,5,'爬虫','双栖龟'),
(15,5,'爬虫','水龟');

CREATE TABLE pet_baike(
  did INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,			#大类别编号
  lid INT,			#小类别编号
  cname VARCHAR(50),		#中文名
  ename VARCHAR(50),		#英文名
  xingge VARCHAR(50),		#性格
  zuji VARCHAR(50),		#祖籍
  yihuan VARCHAR(50),		#易患病
  shouming VARCHAR(50),		#寿命
  jiage VARCHAR(50),		#价格
  tixing VARCHAR(50),		#体型
  maochang VARCHAR(50),		#毛长
  diaomao VARCHAR(50),		#掉毛程度
  youshan VARCHAR(50),		#友善程度
  siyang  VARCHAR(50),		#饲养难度
  gongneng VARCHAR(50),		#功能
  img_url  VARCHAR(255)		#小图路径
);
INSERT INTO pet_baike VALUES
(1,1,3,'金毛犬','Golden Retriever','活泼、忠诚、憨厚、友善','苏格兰','髋关节发育不良','10-15年','800-3000元','大型犬','短毛犬','掉毛少','非常友善','难饲养','伴侣犬、枪猎犬、工作犬、导盲犬','http://127.0.0.1:3000/img/petlist/gou1.jpg'),
(2,1,3,'罗威纳犬','Rottweiler','聪明懂事、个性沉稳，对主人绝对忠诚','德国','肠胃疾病','9-11年','3500元左右','大型犬','短毛犬','掉毛少','一般友善','一般饲养','伴侣犬、枪猎犬','http://127.0.0.1:3000/img/petlist/gou2.jpg'),
(3,1,3,'哈士奇','Siberian Huskiy','聪明机灵、极度热情、神经质','俄罗斯','肠胃疾病','9-15年','2000-4000元','大型犬','短毛犬','不掉毛','非常友善','一般饲养','伴侣犬、工作犬、雪橇犬、玩赏犬','http://127.0.0.1:3000/img/petlist/gou3.jpg'),
(4,1,1,'博美犬','Pomeranian','友善亲切、活泼好动、聪明可训、好管闲事','德国','气管塌陷、心脏病','10-16年','1000-3000元','小型犬','长毛犬','不掉毛','一般友善','一般饲养','伴侣犬、看家犬、玩赏犬','http://127.0.0.1:3000/img/petlist/gou4.jpg'),
(5,1,3,'阿拉斯加雪橇犬','Alaskan Malamute','非常聪明友好、喜欢吠叫','美国','肠胃疾病','12-15年','3000元起','大型犬','长毛犬','掉毛少','非常友善','一般饲养','伴侣犬、守卫犬、工作犬、雪橇犬','http://127.0.0.1:3000/img/petlist/gou5.jpg'),
(6,1,3,'拉布拉多猎犬','Labrador','对人非常友善、脾气好','加拿大','髋关节坏死症','12-15年','1000-3000元','大型犬','短毛犬','掉毛少','非常友善','难饲养','伴侣犬、枪猎犬、导盲犬','http://127.0.0.1:3000/img/petlist/gou6.jpg'),
(7,1,1,'比熊犬','Bichon Frise','聪明伶俐、活泼好动、温和友善','法国','眼病、耳病','12-15年','1000-3000元','小型犬','长毛犬','掉毛多','非常友善','难饲养','伴侣犬、玩赏犬','http://127.0.0.1:3000/img/petlist/gou7.jpg'),
(8,1,3,'法老王猎犬','Pharaoh Hound','感情丰富且顽皮、警惕而活泼','马耳他','肥胖症','12-14年','','大型犬','短毛犬','掉毛少','一般友善','一般饲养','伴侣犬、工作犬','http://127.0.0.1:3000/img/petlist/gou8.jpg'),
(9,1,1,'贵宾犬','Poodle','聪明、负责、易训练、安静、可靠','法国','多泪症、外耳炎','13-19年','1000-7000元','小型犬','长毛犬','掉毛多','非常友善','难饲养','伴侣犬、枪猎犬、玩赏犬','http://127.0.0.1:3000/img/petlist/gou9.jpg'),
(10,1,2,'柴犬','Shiba inu','聪明独立、温顺忠实','日本','肠道疾病','12年左右','','中型犬','短毛犬','掉毛多','一般友善','一般饲养','伴侣犬、枪猎犬','http://127.0.0.1:3000/img/petlist/gou10.jpg'),
(11,1,3,'边境牧羊犬','Border Colie','顽强、温顺、敏锐、机警、聪明、容易训练','英国','肠胃疾病','12-14年','2000-4000元','大型犬','长毛犬','不掉毛','一般友善','一般饲养','伴侣犬、工作犬','http://127.0.0.1:3000/img/petlist/gou11.jpg'),
(12,1,2,'泰迪犬','Poodle','活泼、性情优良、极易近人','德国、法国','白内障、骨肉瘤、尿道结石','13-19年','','中型犬','长毛犬','掉毛多','一般友善','容易饲养','伴侣犬','http://127.0.0.1:3000/img/petlist/gou12.jpg'),
(13,1,1,'巴哥犬','pug','开朗活泼、热情憨厚','中国','肥胖症','12-15年','1500元起','小型犬','短毛犬','掉毛多','非常友善','一般饲养','伴侣犬','http://127.0.0.1:3000/img/petlist/gou13.jpg'),
(14,1,3,'杜宾犬','Doberman Pinscher','生性凶猛、忠实好动、勇敢机警','德国','心肌扩张、胃扭转','10-14年','2800元起','大型犬','短毛犬','掉毛少','一般友善','一般饲养','伴侣犬、守卫犬、工作犬','http://127.0.0.1:3000/img/petlist/gou14.jpg'),
(15,1,1,'法国斗牛犬','French Bulldog','活泼开朗、忠实、安静','法国','尾周疾病','11-12年','3000元起','大型犬','短毛犬','掉毛多','一般友善','一般饲养','伴侣犬、工作犬','http://127.0.0.1:3000/img/petlist/gou15.jpg'),
(16,1,2,'松狮犬','Chow Chow','文静、高雅','中国','螨、丝虫病、细小病毒性肠炎、角膜炎、蚤、湿疹、犬脓皮病、过敏性皮炎','11-12年','','中型犬','长毛犬','不掉毛','一般友善','容易饲养','伴侣犬、守卫犬','http://127.0.0.1:3000/img/petlist/gou16.jpg'),
(17,1,2,'萨摩耶犬','Samoyed','聪明、机警、活泼','北俄罗斯和西伯利亚','脱毛症、糖尿病、过敏性皮炎、白内障','12-15年','','中型犬','长毛犬','不掉毛','非常友善','容易饲养','伴侣犬、工作犬、雪橇犬','http://127.0.0.1:3000/img/petlist/gou17.jpg'),
(18,1,1,'京巴犬','Pekingese','友善亲切、勇敢聪明','中国','肥胖症','12-15年','1000元起','小型犬','长毛犬','掉毛少','非常友善','一般饲养','伴侣犬','http://127.0.0.1:3000/img/petlist/gou18.jpg'),
(19,1,2,'威尔士柯基犬','Welsh Corgi','充满活力、友好、勇敢大胆','英国','肥胖症、渐进性视网膜萎缩、癫痫、椎间盘疾病','12-15年','','中型犬','短毛犬','掉毛少','非常友善','容易饲养','伴侣犬、守卫犬、看家犬','http://127.0.0.1:3000/img/petlist/gou19.jpg'),
(20,1,3,'纽芬兰犬','Newfoundland','开朗、温驯','加拿大','肠胃疾病','10-11年','','大型犬','长毛犬','掉毛少','非常友善','容易饲养','伴侣犬、守卫犬、工作犬','http://127.0.0.1:3000/img/petlist/gou20.jpg'),
(21,1,3,'秋田犬','Japanese Akita','沉着、温顺、勇敢','日本','过敏性皮炎、皮脂腺炎、犬疱疹病毒病','11-12年','','大型犬','短毛犬','掉毛少','一般友善','容易饲养','伴侣犬','http://127.0.0.1:3000/img/petlist/gou21.jpg'),
(22,1,2,'惠比特犬','Whippet','富有感情、高贵、聪明、易于训练、对主人很忠实','英国','肠胃疾病','13-14年','3000元左右','中型犬','短毛犬','掉毛少','一般友善','一般饲养','伴侣犬、工作犬','http://127.0.0.1:3000/img/petlist/gou22.jpg'),
(23,1,2,'英国斗牛犬','Bulldog','善良、忠实、亲切','英国','过敏性皮肤病、干眼病、结膜炎、角膜溃疡、耳廓疾病','7-9年','','中型犬','短毛犬','掉毛多','非常友善','容易饲养','伴侣犬、守卫犬、看家犬','http://127.0.0.1:3000/img/petlist/gou23.jpg'),
(null,2,6,'布偶猫','Ragdoll','温顺好静、对人友善','美国','HCM心肌肥大症','12-15年','宠物级:8000-18000 赛级:18000-25000','大型猫','长毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao1.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao2.jpg'),
(null,2,6,'中国狸花猫','Dragon Li','性格沉稳、感情丰富','中国','消化系统与眼部的疾病','10-15年','2000-5000','大型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao3.jpg'),
(null,2,3,'异国短毛猫','Exotic Shorthair','性格好静、可爱、温纯、甜美、和平、不拘小节及忠诚。','美国','猫鼻支','10-15年','3500-12000','小型猫','无毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao4.jpg'),
(null,2,5,'美国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao5.jpg'),
(null,2,5,'波斯猫','Persian','温文尔雅、反应灵敏、善解人意、少动多静、气质高贵华丽','阿富汗','泪腺重、易流眼泪。','12-15年','4000-20000','中型猫','长毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao6.jpg'),
(null,2,5,'暹罗猫','Siamese','性格刚烈好动、机智灵活、好奇心特强、善解人意','泰国','后退虚弱','10-18年','500-1500','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao7.jpg'),
(null,2,5,'加拿大无毛猫','Sphynx','性格温顺、容易训练','加拿大','皮肤病','12年','','中型猫','无毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao8.jpg'),
(null,2,5,'苏格兰折耳猫','Scottish Fold','糖果般甜美的性格','苏格兰','遗传性骨骼疾病','15年','8000-20000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao9.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao10.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao11.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao12.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao13.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao14.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao15.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao16.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao17.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao18.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao19.jpg'),
(null,2,5,'英国短毛猫','British Shorthair','甜美可人、亲近人类','英国','肠胃疾病','10-15年','5000-10000','中型猫','短毛猫','','','','','http://127.0.0.1:3000/img/petlist/mao20.jpg');





CREATE TABLE pet_login(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25) NOT NULL UNIQUE,
  upwd  VARCHAR(32) NOT NULL 
);


CREATE TABLE pet_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  did INT,
  uname VARCHAR(25),
  ctime DATETIME,
  content VARCHAR(120)
);


CREATE TABLE pet_baike_image(
  id INT PRIMARY KEY AUTO_INCREMENT,
  did INT,
  image_url VARCHAR(255)
);
INSERT INTO pet_baike_image VALUES
(null,1,'http://127.0.0.1:3000/img/petinfo/1_1.jpg'),
(null,1,'http://127.0.0.1:3000/img/petinfo/1_2.jpg'),
(null,1,'http://127.0.0.1:3000/img/petinfo/1_3.jpg'),
(null,1,'http://127.0.0.1:3000/img/petinfo/1_4.jpg'),
(null,1,'http://127.0.0.1:3000/img/petinfo/1_5.jpg'),
(null,1,'http://127.0.0.1:3000/img/petinfo/1_6.jpg'),
(null,2,'http://127.0.0.1:3000/img/petinfo/2_1.jpg'),
(null,2,'http://127.0.0.1:3000/img/petinfo/2_2.jpg'),
(null,2,'http://127.0.0.1:3000/img/petinfo/2_3.jpg'),
(null,2,'http://127.0.0.1:3000/img/petinfo/2_4.jpg'),
(null,2,'http://127.0.0.1:3000/img/petinfo/2_5.jpg'),
(null,2,'http://127.0.0.1:3000/img/petinfo/2_6.jpg'),
(null,3,'http://127.0.0.1:3000/img/petinfo/3_1.jpg'),
(null,3,'http://127.0.0.1:3000/img/petinfo/3_2.jpg'),
(null,3,'http://127.0.0.1:3000/img/petinfo/3_3.jpg'),
(null,3,'http://127.0.0.1:3000/img/petinfo/3_4.jpg'),
(null,3,'http://127.0.0.1:3000/img/petinfo/3_5.jpg'),
(null,3,'http://127.0.0.1:3000/img/petinfo/3_6.jpg'),
(null,4,'http://127.0.0.1:3000/img/petinfo/4_1.jpg'),
(null,4,'http://127.0.0.1:3000/img/petinfo/4_2.jpg'),
(null,4,'http://127.0.0.1:3000/img/petinfo/4_3.jpg'),
(null,4,'http://127.0.0.1:3000/img/petinfo/4_4.jpg'),
(null,4,'http://127.0.0.1:3000/img/petinfo/4_5.jpg'),
(null,4,'http://127.0.0.1:3000/img/petinfo/4_6.jpg'),
(null,5,'http://127.0.0.1:3000/img/petinfo/5_1.jpg'),
(null,5,'http://127.0.0.1:3000/img/petinfo/5_2.jpg'),
(null,5,'http://127.0.0.1:3000/img/petinfo/5_3.jpg'),
(null,5,'http://127.0.0.1:3000/img/petinfo/5_4.jpg'),
(null,5,'http://127.0.0.1:3000/img/petinfo/5_5.jpg'),
(null,5,'http://127.0.0.1:3000/img/petinfo/5_6.jpg');

CREATE TABLE pet_shoucang(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  did INT
);







size(600,300);
background(255);
colorMode(RGB,255);


rectMode(CENTER);

  noStroke();
//------変動-------
fill(299,152,197,70);
rect(450,150,300,300);



fill(299,0,118,60);//円①
ellipse(350,160,50,50);
ellipse(500,250,150,150);
ellipse(550,150,100,100);
ellipse(560,50,100,100);
ellipse(590,10,50,50);

fill(158,40,163,60);//円②
ellipse(350,250,100,100);
ellipse(400,150,90,90);
ellipse(520,180,50,50);
ellipse(400,0,150,150);

fill(219,36,91,70);//円③
ellipse(400,270,90,90);
ellipse(450,100,100,100);
ellipse(550,170,50,50);
ellipse(390,50,150,150);

fill(137,15,101,60);//円④
ellipse(420,200,100,100);
ellipse(340,100,50,50);
ellipse(560,260,80,80);
ellipse(450,150,100,100);
ellipse(470,220,50,50);

fill(200,28,89,80);//円⑤
ellipse(500,0,100,100);
ellipse(350,200,100,100);
ellipse(400,100,50,50);
ellipse(500,290,60,60);
ellipse(600,150,80,80);

fill(168,0,47,50);//円⑥
ellipse(580,220,100,100);
ellipse(490,90,100,100);
ellipse(360,150,120,120);
ellipse(560,100,80,80);


int eSize =5;//上から下のライン(1~15)
for(int y = 0; y<=120; y+=6){
  fill(255,0,119);
  ellipse(310,y,eSize,eSize);
}
int eSize2 =5;
for(int y = 0; y<=150; y+=6){
  fill(255-y,0,119-y);
  ellipse(330,y,eSize2,eSize2);
}

int eSize3 =5;
for(int y = 0; y<=90; y+=6){
  fill(255,0,119);
  ellipse(350,y,eSize3,eSize3);
}
int eSize4 =5;
for(int y = 0; y<=125; y+=6){
  fill(255+y,0,119+y);
  ellipse(370,y,eSize4,eSize4);
}
int eSize5 =5;
for(int y = 0; y<=160; y+=6){
  fill(255,0,119);
  ellipse(390,y,eSize5,eSize5);
}
int eSize6 =5;
for(int y = 0; y<=100; y+=6){
  fill(255-y,0,119-y);
  ellipse(410,y,eSize6,eSize6);
}
int eSize7 =5;
for(int y = 0; y<=140; y+=6){
  fill(255,0,119);
  ellipse(430,y,eSize7,eSize7);
}
int eSize8 =5;
for(int y = 0; y<=90; y+=6){
  fill(255+y,0,119-y);
  ellipse(450,y,eSize8,eSize8);
}
int eSize9 =5;
for(int y = 0; y<=70; y+=6){
  fill(255,0,119);
  ellipse(470,y,eSize9,eSize9);
}
int eSize10 =5;
for(int y = 0; y<=140; y+=6){
  fill(255-y,0,119-y);
  ellipse(490,y,eSize10,eSize10);
}
int eSize11 =5;
for(int y = 0; y<=170; y+=6){
  fill(255,0,119);
  ellipse(510,y,eSize11,eSize11);
}
int eSize12 =5;
for(int y = 0; y<=120; y+=6){
  fill(255+y,0,119+y);
  ellipse(530,y,eSize12,eSize12);
}
int eSize13 =5;
for(int y = 0; y<=140; y+=6){
  fill(255,0,119);
  ellipse(550,y,eSize13,eSize13);
}
int eSize14 =5;
for(int y = 0; y<=90; y+=6){
  fill(255-y,0,119+y);
  ellipse(570,y,eSize14,eSize14);
}
int eSize15 =5;
for(int y = 0; y<=120; y+=6){
  fill(255,0,119);
  ellipse(590,y,eSize15,eSize15);
}


int eSize16 =5;//下から上のライン(16~30)
for(int y = 210; y<=300; y+=6){
  fill(255,0,119);
  ellipse(310,y,eSize16,eSize16);
}
int eSize17 =5;
for(int y = 250; y<=300; y+=6){
  fill(255,0,119);
  ellipse(330,y,eSize17,eSize17);
}

int eSize18 =5;
for(int y = 190; y<=300; y+=6){
  fill(255,0,119);
  ellipse(350,y,eSize18,eSize18);
}
int eSize19 =5;
for(int y = 220; y<=300; y+=6){
  fill(255,0,119);
  ellipse(370,y,eSize19,eSize19);
}
int eSize20 =5;
for(int y = 250; y<=300; y+=6){
  fill(255,0,119);
  ellipse(390,y,eSize20,eSize20);
}
int eSize21 =5;
for(int y = 260; y<=300; y+=6){
  fill(255,0,119);
  ellipse(410,y,eSize21,eSize21);
}
int eSize22 =5;
for(int y = 220; y<=300; y+=6){
  fill(255,0,119);
  ellipse(430,y,eSize22,eSize22);
}
int eSize23 =5;
for(int y = 190; y<=300; y+=6){
  fill(255,0,119);
  ellipse(450,y,eSize23,eSize23);
}
int eSize24 =5;
for(int y = 230; y<=300; y+=6){
  fill(255,0,119);
  ellipse(470,y,eSize24,eSize24);
}
int eSize25 =5;
for(int y = 270; y<=300; y+=6){
  fill(255,0,119);
  ellipse(490,y,eSize25,eSize25);
}
int eSize26 =5;
for(int y = 240; y<=300; y+=6){
  fill(255,0,119);
  ellipse(510,y,eSize26,eSize26);
}
int eSize27 =5;
for(int y = 260; y<=300; y+=6){
  fill(255,0,119);
  ellipse(530,y,eSize27,eSize27);
}
int eSize28 =5;
for(int y = 230; y<=300; y+=6){
  fill(255,0,119);
  ellipse(550,y,eSize28,eSize28);
}
int eSize29 =5;
for(int y = 190; y<=300; y+=6){
  fill(255,0,119);
  ellipse(570,y,eSize29,eSize29);
}
int eSize30 =5;
for(int y = 220; y<=300; y+=6){
  fill(255,0,119);
  ellipse(590,y,eSize30,eSize30);}
  
  
//--------安定--------
fill(255);
rect(150,150,300,300);

fill(82,162,197,60);//四角①
rect(225,25,50,50);
rect(275,75,50,50);
rect(25,125,50,50);
rect(75,175,50,50);
rect(125,225,50,50);
rect(175,275,50,50);

fill(25,135,22,50);//四角②
rect(75,25,50,50);
rect(125,75,50,50);
rect(175,125,50,50);
rect(225,175,50,50);
rect(275,225,50,50);
rect(25,275,50,50);

fill(172,22,206,60);//四角③
rect(125,25,50,50);
rect(175,75,50,50);
rect(225,125,50,50);
rect(275,175,50,50);
rect(25,225,50,50);
rect(75,275,50,50);

fill(49,0,178,60);//四角④
rect(275,25,50,50);
rect(25,75,50,50);
rect(275,125,50,50);
rect(125,175,50,50);
rect(75,225,50,50);
rect(125,275,50,50);

fill(64,0,178,60);//四角⑤
rect(175,25,50,50);
rect(225,75,50,50);
rect(75,125,50,50);
rect(25,175,50,50);
rect(175,225,50,50);
rect(225,275,50,50);

fill(15,82,188,70);//四角⑥
rect(25,25,50,50);
rect(75,75,50,50);
rect(125,125,50,50);
rect(175,175,50,50);
rect(225,225,50,50);
rect(275,275,50,50);



int eSize32 =5;//全体にかかるグラデーション
for(int y = 0; y<=300; y+=6){
for(int x = 0; x<=295; x+=6){
  
   fill(-x+y, 200+y-x, 510-x-y,130);
 
  rect(x,y,eSize32,eSize32);}}
  


fill(40,175,148,115);//メインになりそうな感じの四角①
rect(90,160,100,100);

fill(25,135,22,90);//メインになりそうな感じの四角②
rect(50,245,50,50);

fill(102,153,174,90);//メインになりそうな感じの四角③
rect(100,280,30,30);


  



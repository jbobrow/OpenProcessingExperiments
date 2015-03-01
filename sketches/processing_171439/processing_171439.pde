
int eSize =20;

size(600,300);
colorMode(RGB,255);
background(220);

//L=anntei,R=hendou

strokeWeight(20);
stroke(36,0,0);
line(300,0,300,300);//中心
line(0,0,600,0);//横↑
line(0,300,600,300);//よこした
line(0,0,0,300);//左
line(600,0,600,300);//右

strokeWeight(1);
stroke(230,230,230);
line(300,0,300,300);




//変動
noStroke();

for(int y = 10; y <=48; y +=20) {//上のにこ
for(int x = 310; x <= 589; x += 20) {//赤の方x-330,0,24
  fill(x-300,192,255,240);
 rect(x, y, eSize+1, eSize+1);
 }
}

for(int y = 52; y <=79; y +=20) {//その次
for(int x = 311; x <= 590; x += 20) {
  fill(x-300,192,255,220);
 rect(x, y, eSize-2, eSize-2);
 }
}

for(int y = 93; y <=109; y +=20) {//その次
for(int x = 312; x <= 590; x += 20) {
  fill(x-300,192,255,200);
 rect(x, y, eSize-4, eSize-4);
 }
}

for(int y = 113; y <=129; y +=20) {//更に次
for(int x = 313; x <= 590; x += 20) {
  fill(x-300,192,255,180);
 rect(x, y, eSize-6, eSize-6);
 }
}

for(int y = 133; y <=149; y +=20) {//次
for(int x = 314; x <= 590; x += 20) {
  fill(x-300,192,255,160);
 rect(x, y, eSize-8, eSize-8);
 }
}

for(int y = 153; y <=169; y +=20) {//次
for(int x = 316; x <= 590; x += 20) {
  fill(x-300,192,255,135);
 rect(x, y, eSize-12, eSize-12);
 }
}

for(int y = 168; y <=179; y +=20) {//最下層
for(int x = 317; x <= 590; x += 20) {
  fill(x-300,192,255,100);
 rect(x, y, eSize-14, eSize-14);
 }
}

noStroke();//右側
fill(24,196,255,70);//3　下から
rect(310,185,180,30);
fill(24,196,255,80);//2
rect(310,225,70,20);
fill(24,196,255,105);//1
rect(310,255,130,30);


noStroke();//左側
fill(255,196,255,150);//1 下から
rect(500,185,91,30);
fill(255,196,255,180);//3
rect(390,225,201,20);
fill(255,196,255,250);//2
rect(450,255,141,30);

noStroke();//pink三角
fill(252,172,176,160);
triangle(460,240,480,220,495,260);
triangle(315,275,350,220,355,250);
triangle(510,289,540,220,580,260);
triangle(360,180,380,200,390,180);

noStroke();//blue_三角
fill(85,210,242,180);
triangle(540,170,570,160,550,180);
triangle(385,250,370,280,430,250);
triangle(470,220,460,170,510,200);
triangle(320,220,325,200,340,200);

noStroke();//green_三角
fill(165,256,97,130);
triangle(560,225,580,200,590,235);
triangle(390,200,410,230,430,200);
triangle(490,291,430,260,510,230);
triangle(520,220,525,200,540,200);
triangle(315,155,320,185,345,185);

//安定
noStroke();
fill(131,205,255,200);
rect(10,10,280,280);//背景

stroke(255,255,255,170);
for(int y = 11; y <=280; y +=20) {
for(int x = 11; x <= 280; x += 20) {
  fill(60,194,255,220);
  rect(x, y, eSize-4, eSize-4);
 }
}

stroke(249,247,197,120);
fill(249,247,197,70);
ellipse(150,150,80,80);
ellipse(150,150,180,180);
ellipse(150,150,280,280);





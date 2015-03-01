
size(600,300);

int eSize = 10;
colorMode(RGB,255);
background(255);
noStroke();

//安定↓
for(int y=0; y<=300; y +=10){
for(int x=0; x<=300; x +=10){ 
 
  stroke(y,x,0,0);
  fill(y,x,255-x,120);
  rect(x, y, eSize, eSize);//背景色のグラデーション

}}
stroke(215,253, 205, 225); 
strokeWeight(4);
noFill();

ellipse(0, 0, 450,450);
ellipse(0, 300, 450,450);
ellipse(300, 0, 450,450);
ellipse(300, 300, 450,450);//黄緑の円

//変動↓
for(int y=0; y<=300; y +=10){
for(int x=300; x<=600; x +=10){ 
 
  noStroke();
  fill(255-x,y,y,250);
rect(x, y, eSize, eSize);//背景色のグラデーション
}}

fill(255);
rect(420, 40, 30, 30);
rect(520, 140, 20, 20);
rect(360, 90, 34, 34);//白い四角


fill(60, 100, 100,178);
rect(400, 50, 30, 30);
rect(370, 100, 32, 32);//灰色の四角

fill(40, 100, 100,78);
rect(370, 150, 50, 90);//灰色の四角

fill(40, 100, 100,88);
rect(400, 120, 50, 50);
rect(512, 200, 16, 16);
rect(555, 240, 6, 6);//灰色の四角

stroke(158, 198, 251,78);     
strokeWeight(4);
noFill();
ellipse(600, 50, 450,450);//青い円

line(300, 80, 600, 40); 
line(570, 0, 400, 300); //青い線




/*@pjs preload="apple_mouse.gif,apple_red.gif,apple_black.gif,apple_gray.gif,apple_green.gif,apple_green2.gif";*/


PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
int b = 0;
int c = 0;
int a = 30;
int d = 0;
int e = 0;
int f = 0;
int g = 255;
int h = 255;
int z = 255;
int j = 255;
int k = 255;
int m = 0;
int b2 = 0;
float objX, objY;
float disX, disY;
float delay = 10.0;
float speed1 = 1;
float speed2 = 1.5;
float speed3 = 2;
float speed4 = 2.5;
float speed5 = 3;
float speed6 = 3.5;
float eSize1;
float eSize2;
float eSize3;
float eSize4;
float eSize5;
float maxSize1 = 0;
float maxSize2 = 0;
float maxSize3 = 0;
float maxSize4 = 0;
float maxSize5 = 0;
float eSize6;
float eSize7;
float eSize8;
float eSize9;
float eSize10;
float maxSize6 = 0;
float maxSize7 = 0;
float maxSize8 = 0;
float maxSize9 = 0;
float maxSize10 = 0;
float[] eSize = new float[5];    
float[] speed = {0.3, 0.5, 0.7, 0.6, 0.4}; 
float[] y = {0.5, 1, 0.4, 0.6, 0.4};
 
void setup() {
  size(450,450);
  img = loadImage("apple_mouse.gif");
  img2 = loadImage("apple_red.gif");
  img3 = loadImage("apple_black.gif");
  img4 = loadImage("apple_gray.gif");
  img5 = loadImage("apple_green.gif");
  img6 = loadImage("apple_green2.gif");
  noStroke();
  smooth();
  fill(0);
  objX = mouseX;
  objY = mouseY;
  
}
 
void draw() {
  background(255);
  eSize1 += speed1;
  eSize2 += speed1;
  eSize3 += speed1;
  eSize4 += speed1;
  eSize5 += speed1;
  eSize6 += speed1;
  eSize7 += speed3;
  eSize8 += speed2;
  eSize9 += speed4;
  eSize10 += speed5;
  
  disX = mouseX -470 - objX;
  disY = mouseY - 470 - objY;
  
  objX = objX + disX/delay;
  objY = objY + disY/delay;
  
  stroke(102,51,0);
  strokeWeight(15);
  line(0,242,280,242);
  
  line(20,242,20,450);
  
  line(250,242,250,450);
  
  fill(102,51,0);
  rect(130,393,100,100);
  
  stroke(0);
  line(170,410,190,410);
  
  stroke(102,102,102);
  fill(102,102,102);
  quad(103,228,143,228,133,213,113,213);
  
  line(123,215,123,175);
  
  strokeWeight(4);
  stroke(100);
  fill(0);
  quad(50,75,200,75,200,170,50,170);
  
  stroke(102,51,0);
  fill(102,51,0);
  quad(380,287,450,287,450,450,380,450);
  
  
  fill(100,100,255);
  quad(250,88,400,88,400,190,250,190);
  
  
  stroke(255);
  fill(255);
  
  //snow
  for(int i = 0; i < 5; i ++) {
     y[i] += speed[i];
    eSize[i] += speed[i];
    if(eSize[i] >= 5){
  eSize[i] = 0;
    }  
    
    if(y[i] >= 190){ 
      y[i] = 88;
    }
    ellipse(280+20*i, y[i], eSize[i], eSize[i]);    
  }
  
  //window
  stroke(102,51,0);
  line(250,139,400,139);
  line(325,88,325,190);
   noFill();
  quad(250,88,400,88,400,190,250,190);
  
  
  
  
  //apple
  tint(255,0,0,g);
  image(img2,260,50,45,45);
  
  tint(100,100,255,h);
  image(img4,190,200,45,45);
  
  tint(120,100,120,z);
  image(img4,400,250,45,45);
  
  tint(0,200,0,j);
  image(img5,150,350,45,45);
  
  tint(0,200,0,k);
  image(img6,100,100,45,45);
  
  tint(0,0,0,a);
  image(img,objX,objY,950,950);
  
  //start
  fill(255,0,0,b);
  textSize(50);
  text("A",100,310);
  
  fill(100,255,100,c);
  textSize(50);
  text("p",129,310);
  
  fill(100,255,100,d);
  textSize(50);
  text("p",155,310);
  
  fill(100,100,255,e);
  textSize(50);
  text("l",180,310);
  
  fill(102,102,102,f);
  textSize(50);
  text("e",190,310);
  
  //last apple
  tint(255,255,255,m);
  image(img4,220,260,70,70);
  
  //finish
  fill(255,0,0,b2);
  textSize(30);
  text("A",70,133);
  
  fill(100,255,100,b2);
  textSize(30);
  text("p",90,133);
  
  fill(100,255,100,b2);
  textSize(30);
  text("p",110,133);
  
  fill(100,100,255,b2);
  textSize(30);
  text("l",130,133);
  
  fill(102,102,102,b2);
  textSize(30);
  text("e",140,133);
  
  //last apple
  tint(255,255,255,b2);
  image(img4,153,110,30,30);
  
  
  //wave
  if(eSize1 > maxSize1){
    eSize1 = 0;
  }
  noFill();
  stroke(255,0,0);
  ellipse(282, 72, eSize1, eSize1);

if(eSize2 > maxSize2){
    eSize2 = 0;
  }
  noFill();
  stroke(100,100,255);
  ellipse(212, 222, eSize2, eSize2);

 if(eSize3 > maxSize3){
    eSize3 = 0;
  }
  noFill();
  stroke(120,120,120);
  ellipse(422, 277, eSize3, eSize3);

if(eSize4 > maxSize4){
    eSize4 = 0;
  }
  noFill();
  stroke(0,200,0);
  ellipse(172, 372, eSize4, eSize4);  
 
 if(eSize5 > maxSize5){
    eSize5 = 0;
  }
  noFill();
  stroke(0,200,0);
  ellipse(122, 122, eSize5, eSize5); 
  
  
  //finish wave
  if(eSize6 > maxSize6){
    eSize6 = 0;
  }
  noFill();
  stroke(255,0,0,110);
  ellipse(167, 124, eSize6, eSize6); 
  
  if(eSize7 > maxSize7){
    eSize7 = 0;
  }
  noFill();
  stroke(0,200,0,110);
  ellipse(167, 124, eSize7, eSize7);
  
  if(eSize8 > maxSize8){
    eSize8 = 0;
  }
  noFill();
  stroke(100,100,255,110);
  ellipse(167, 124, eSize8, eSize8);
  
  if(eSize9 > maxSize9){
    eSize9 = 0;
  }
  noFill();
  stroke(0,200,0,110);
  ellipse(167, 124, eSize9, eSize9);
  
  if(eSize10 > maxSize10){
    eSize10 = 0;
  }
  noFill();
  stroke(102,102,102,110);
  ellipse(167, 124, eSize10, eSize10);







}


void mousePressed(){
  //red
  if(260<=mouseX && mouseX<305 && 50<=mouseY && mouseY<95)  {
   maxSize1 = 200;
   a += 50;
   b += 120;
   g = 0;
   m += 20;
 }
 //blue
 if(190<=mouseX && mouseX<235 && 200<=mouseY && mouseY<245)  {
   maxSize2 = 200;
   a += 50;
   e += 120;
   h = 0;
   m += 20;
 }
  //gray
   if(400<=mouseX && mouseX<445 && 250<=mouseY && mouseY<295)  {
   maxSize3 = 200;
   a += 50;
   f += 120;
   z = 0;
   m += 20;
 }
 //green
 if(150<=mouseX && mouseX<195 && 350<=mouseY && mouseY<395)  {
   maxSize4 = 200;
   a += 50;
   d += 120;
   j = 0;
   m += 20;
 }
 //green2
 if(100<=mouseX && mouseX<145 && 100<=mouseY && mouseY<145)  {
   maxSize5 = 200;
   a += 50;
   c += 120;
   k = 0;
   m += 20;
 }
 
 //last
 if(220<=mouseX && mouseX<290 && 260<=mouseY && mouseY<350)  {
   maxSize1 = 0;
   maxSize2 = 0;
   maxSize3 = 0;
   maxSize4 = 0;
   maxSize5 = 0;
   maxSize6 = 200;
   maxSize7 = 200;
   maxSize8 = 200;
   maxSize9 = 200;
   maxSize10 = 200;
   a = 0;
   b2 = 255;
   b = 0;
   c = 0;
   d = 0;
   e = 0;
   f = 0;
   m = 0;
 }
 if(153<=mouseX && mouseX<183 && 110<=mouseY && mouseY<140)  {
   maxSize1 = 0;
   maxSize2 = 0;
   maxSize3 = 0;
   maxSize4 = 0;
   maxSize5 = 0;
   maxSize6 = 0;
   maxSize7 = 0;
   maxSize8 = 0;
   maxSize9 = 0;
   maxSize10 = 0;
   a = 30;
   b2 = 0;
   g = 255;
   h = 255;
   z = 255;
   j = 255;
   k = 255;
 }
}
  



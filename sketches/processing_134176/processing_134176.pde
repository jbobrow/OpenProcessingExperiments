
float a=0;
float as=1.64;
float t=0;
float ts=0.002;
float tshape=10;
float shapesize=200;
float move=15;
void setup(){
  size(500,500);
}
void draw(){
  colorMode(HSB);
  noStroke();
//  background(200);
  t+=ts;
  a+=as;
  fill(255);
  rect(10,10,40,10);
  fill(0);
  text(t,10,20);
  fill(a,240,240);
  pushMatrix();
  translate(shapesize*sin(tshape*t)+250,shapesize*cos(tshape*t)+250);
  rotate(t*move);
  ellipse(0,0,/*sin(30*t)*/150,/*sin(30*t)*/20);
  popMatrix();
  if(a>256){
    a=0;
  }
  if(mousePressed){
  background(a,240,240);
  }
  colorMode(RGB);
}
void keyPressed(){
  if(key=='4'){
    background(60,60,0);
    tshape=10;
    shapesize=100;
  }
  if(key=='3'){
    background(200,0,0);
    tshape=20;
    shapesize=80;
  }
  if(key=='5'){
    background(0,100,0);
    tshape=6.66;
    shapesize=120;
  }
  if(key=='6'){
    background(0,100,100);
    tshape=5;
    shapesize=140;
  }
  if(key=='7'){
    background(150,50,0);
    tshape=4;
    shapesize=160;
  }
  if(key=='8'){
    background(0,0,100);
    tshape=3.33;
    shapesize=180;
  }
  if(key=='9'){
    background(100,0,100);
    tshape=2.8571428;
    shapesize=200;
  }
  if(key=='2'){
    background(0,100,60);
    tshape=40;
    shapesize=100;
  }
  if(key=='1'){
    background(60,0,100);
    tshape=13.333;
    shapesize=100;
  }
  if(key=='0'){
    background(100);
    move=0;
    shapesize=100;
  }else{move=10;}
}
//void mousePressed(){
//background(0);
//}


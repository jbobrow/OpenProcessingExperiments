
PFont font;
PImage bg;
PImage a;
PImage b;
PImage c;
PImage d;
float x;
float y;
float speedx;
float speedy;
float gravity;
int time = 30;
int timeLast = 0;
int score = 0;
boolean startJump=false;  
boolean moveLeft=true;
boolean moveRight=true;
boolean moveUp=true;  
color[] cU=new color[3];
color[] cD=new color[3];
color[] cL=new color[3];
color[] cR=new color[3];  
color C;
  
void setup() {
  size(600, 600);
  timeLast=second();
   
  bg=loadImage("maps2.png");
  a=loadImage("gameover.jpg");
  b=loadImage("hurry.png");
  c=loadImage("10.png");
  d=loadImage("5.png");
  
  x=30;
  y=550;
  speedx=1;
  speedy=4;
  gravity=3;
  
  C=bg.pixels[(bg.width*5)+(5)];
}
  
  
void draw() {
  image(a, 0, 0);
  if (time>0){
    car();
  //image(a, 600, 600);
  }
  if (time>0){
   image(bg, 0, 0);
  } 
  if (time==20){
    image(b, 20, 20);
  }
  if (time==10){
    image(c, 20, 20);
  }
  if (time==5){
    image(d, 20, 20);
  }
  noStroke();
  fill(255, 255, 0);
  ellipse(x, y, 30, 30);
  y+=gravity;
   
  fill(0); // black
  arc(x, y, 30, 30,
  abs(sin(x/width * 24 * PI)) * (-PI/5),
  abs(sin(x/width * 24 * PI)) * (PI/5) ); 
  
  if (keyPressed) {
    if (keyCode==LEFT && moveLeft==true) {
      x-=speedx;
    }
    if (keyCode==RIGHT && moveRight==true) {
      x+=speedx;
    }
    if (keyCode==UP && moveUp==true) {
      startJump=true;
    }
  }
  if (startJump==true) {
    y-=speedy;
  }
  
  for (int lop=0;lop<3;lop++) {
    ////selecting the color that box touches
    cU[lop]=bg.pixels[((int)bg.width*(int)y-5)+((int)x+(6*lop))];
    cD[lop]=bg.pixels[((int)bg.width*((int)y+22))+((int)x+(6*lop))];
  
    cL[lop]=bg.pixels[((int)bg.width*((int)y+(6*lop)))+((int)x-5)];
    cR[lop]=bg.pixels[((int)bg.width*((int)y+(6*lop)))+((int)x+25)];
  
    if (cD[lop]==C) {
      gravity=0;
    }
    else {
      gravity=2;
    }
    if (cU[lop]==C) {
      startJump=false;
      moveUp=false;
    }else
    {
      moveUp=true;
    }
    if (cL[lop]==C) {
      moveLeft=false;
    }
    else {
      moveLeft=true;
    }
    if (cR[lop]==C) {
      moveRight=false;
    }
    else {
      moveRight=true;
    }
  }
  println(moveUp);
  fill(255);
  text("TIMER: "+time, 420, 20);  
}
 
 void car (){
    //ellipse(enemyX, enemyY, give, give);
    //ellipse(enemyX2, enemyY2, give, give);
    //ellipse(enemyX3, enemyY3, give, give);   
    if (second()!=timeLast){
    timeLast=second();
    time-=1;
    }
    fill(255);
    text("TIMER: "+time, 420, 20);
 
}



//homework 7 classes
//Denali Schmidt
//What is you favorite color?
PImage test1;
int tick = 0;
int checked = 0;
int numBalls = 22;
float spring = 0.05;
float gravity = 0.05;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

CheckBox r = new CheckBox(38,137,51);
CheckBox r2 = new CheckBox(38,222,51);
CheckBox r3 = new CheckBox(38,300,51);
Bubbles a = new Bubbles(200,200,random(5-40),0);


void setup(){
  size(600,600);
  test1 = loadImage("checkboxes.jpg");
  image(test1,0,0);
  noStroke();
   for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(20, 40), i, balls);
   }
}


void draw(){
   //what happens when each box is checked
  if(checked == 1){
    image(test1,0,0);
    for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display1();  
    }
  }
  if(checked == 2){
    image(test1,0,0);
    for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display2();  
    }
  }
    if(checked == 3){
    image(test1,0,0);
    for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display3();  
    }
  }
  
  r.update(mouseX,mouseY);
 // r.display(1);
  r2.update(mouseX,mouseY);
 // r2.display(2);
  r3.update(mouseX,mouseY);
 // r3.display(3);
  r.ticked1(mouseX,mouseY); 
  r.ticked2(mouseX,mouseY);
  r.ticked3(mouseX,mouseY); 
}


class CheckBox{
  int x,y;
  int rectSize;
  int blueBox;
  
  //constructor //when varieble will be different when called
  CheckBox(int _x,int _y,int _rectSize){
   x = _x;
   y = _y;
    rectSize = _rectSize;
  }
  
  //methods
  void update(int mx, int my){
    if((mx>x) && (mx < x + rectSize) && (my>y) &&(my<y + rectSize)){
            
    }else{
      if(blueBox > 0){
      blueBox  -= 5;
      } 
    }
      if(blueBox > 300){
      blueBox -= 50;
      //println(blueBox);
    }
  } 
 
  void display(float fillRect){
    if(fillRect == 1){
    fill(300,0,200,blueBox);
    rect(x,y,rectSize,rectSize);   
    }
    if(fillRect == 2){
    fill(0,200,0,blueBox);
    rect(x,y,rectSize,rectSize);   
    }
    if(fillRect == 3){
    fill(0,0,200,blueBox);
    rect(x,y,rectSize,rectSize);   
    }
  }
  
  //says that if the mouse is within the box then when it is clicked draw an X
  //does this for all boxes
  //fist box
  void ticked1(int mx, int my){
  if((mx>38) && (mx < 38 + rectSize) && (my>137) &&(my<137 + rectSize) && tick == 1 && mousePressed == true){
      fill(255);
      noStroke();
      rect(38,137,51,51);
      rect(38,222,51,51);
      rect(38,300,51,51);
      stroke(300,0,0);
      X(38,187);
      checked = 1;
    }
  }
  //second box
  void ticked2(int mx, int my){
  if((mx>38) && (mx < 38 + rectSize) && (my>222) &&(my<222 + rectSize) && tick == 1 && mousePressed == true){
      fill(255);
      noStroke();
      rect(38,137,51,51);
      rect(38,222,51,51);
      rect(38,300,51,51);
      X(38,273);
      checked = 2;
    }
  }
  //third box
  void ticked3(int mx, int my){
  if((mx>38) && (mx < 38 + rectSize) && (my>300) &&(my<300 + rectSize) && tick == 1 && mousePressed == true){
      fill(255);
      noStroke();
      rect(38,137,51,51);
      rect(38,222,51,51);
      rect(38,300,51,51);
      X(38,351);
      checked = 3;
     // println(checked);
      } 
    }
      
  void X(int xpos,int ypos){
     if(tick == 1){
       stroke(300,0,0);
       strokeWeight(3);
       line(xpos,ypos,(xpos+51),(ypos-51));
       line(xpos,(ypos-51),(xpos+51),ypos);
     }
   }
}

class Bubbles{
  int x;
  int y;
  float bubSize;
  int speed;
  
  Bubbles(int _x, int _y, float _bubSize, int _speed){
    x = _x;
    y = _y;
    bubSize = _bubSize;
    speed = _speed;
  }
  
  void updateEll (){
    for(int i = 0; i < width; i++){
      for(int j = 0; j < height; j++){
      noStroke();
     // circles[i] = new Bubbles(random(width), random(height),random(5,40));
      ellipse((x+speed),(y+speed),bubSize,bubSize);
      
      speed ++;
      x = i;
      y = j;
      }
    }
  }
}
  
  //this class is all taken from http://processing.org/learning/topics/bouncybubbles.html, based on code from Keith Peters (www.bit-101.com)
  class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display1() {
    fill(255,3,36);
    noStroke();
    gravity = .001;
    spring = .9;
    ellipse(x, y, diameter, diameter);
  }
  void display2() {
    fill(6,157,83);
    noStroke();


    ellipse(x, y, diameter, diameter);
}
 void display3() {
    fill(0,170,252);
    noStroke();
    gravity = .1;
    spring = .01;
    ellipse(x, y, diameter, diameter);
 }
  }
  

    void mouseReleased(){
      tick = 1;
    }
  
  
  




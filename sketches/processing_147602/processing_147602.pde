
float gravity=0.1;
float speed=0;

Rectangle[] rectangles=new Rectangle[1000];
Ellipsey[] ellipseys=new Ellipsey[1000];

void setup(){ 
  size(1000,700);
  smooth();


for (int i=0; i<width; i++){
  rectangles[i]=new Rectangle(color(i*2), i, i*2,i*2);
}

for (int n=0; n<width; n++){
  ellipseys[n]=new Ellipsey(color(n*2),n*100, n*2, n*2);
}
}

void draw(){
 background(255); 
for (int i=0; i<width; i++){
  rectangles[i].move();
  rectangles[i].display();}

for (int n=0; n<width; n++){
  ellipseys[n].move();
  ellipseys[n].display();}
  
  stroke(0);
  fill(mouseX,127, mouseY,150);
  rect(62,350,125,700);
  
  stroke(0);
  fill(mouseY,150,mouseX,150);
  rect(187,350,125,700);
  
  stroke(0);
  fill(178,mouseX,mouseY,150);
  rect(312,350,125,700);
  
  stroke(0);
  fill(200,199,mouseX,150);
  rect(437,350,125,700);
  
  stroke(0);
  fill(mouseX,200,mouseY,150);
  rect(750,62.5,500,175);
  
  stroke(0);
  fill(mouseY,250,mouseX,150);
  rect(750,238,500,175);
  
  stroke(0);
  fill(255,mouseX,mouseY,150);
  rect(750,413,500,175);
  
  stroke(0);
  fill(139,178,mouseX,150);
  rect(750,587,500,175);
}

class Rectangle {
  float c;
  float xpos;
  float ypos;
  float rspeed;
  
  Rectangle(color c_, float xpos_, float ypos_, float rspeed_){
    c=c_;
    xpos=xpos_;
    ypos=ypos_;
    rspeed=rspeed_;
  }
  
  void display(){
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(xpos, ypos, 20, 20);
  }
  
  void move(){
    xpos+=2;
    ypos+=rspeed;
    if (ypos>height || ypos<0){
      rspeed*=-0.95;
    }
    if (xpos<0 || xpos>=width){
      xpos*=-0.95;
    }
  }
}

class Ellipsey{
  color b;
  float rpos;
  float dpos;
  float espeed;
  
  Ellipsey(color b_, float rpos_, float dpos_, float espeed_){
    b=b_;
    rpos=rpos_;
    dpos=dpos_;
    espeed=espeed_;
  }
  
  void display(){
    ellipseMode(CENTER);
    stroke(0);
    fill(b);
    ellipse(rpos, dpos, 30, 30);
  }
  
  void move(){
    rpos+=2;
    rpos+=espeed;
    if (dpos>height || dpos<0){
      espeed*=-0.95;
    }
    if (rpos>width || rpos<0){
      rpos*=-0.95;
    }
  }
}
    


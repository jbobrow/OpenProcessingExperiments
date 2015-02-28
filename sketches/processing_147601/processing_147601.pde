
float gravity=0.1;
float speed=0;

Rectangle[] rectangles=new Rectangle[1000];

void setup(){
  size(1000,700);
  smooth();


for (int i=0; i<width; i++){
  rectangles[i]=new Rectangle(color(i*2), i+1, i+2,0);
}
}

void draw(){
background(255);  
for (int i=0; i<width; i++){
  rectangles[i].move();
  rectangles[i].display();}
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
    


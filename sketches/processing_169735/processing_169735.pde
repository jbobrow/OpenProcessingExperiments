
//"Snow Simulation"
//James Quinlan, 2014

Ball[] ballsFront = new Ball[5];
Ball[] ballsMid = new Ball[70];
Ball[] ballsBack = new Ball[1500];

boolean sketchFullScreen(){
  return true;
}

float z;
float angle = 0;
color back;
float cx, yx;

void setup(){
  size(displayWidth,displayHeight,P3D);
  smooth();
  noCursor();
  
  cx = mouseX/10;
  back = int(cx);
  
  for(int i=0;i<ballsFront.length;i++){
    ballsFront[i] = new Ball(random(width),random(height),random(30,50),i*10);
  }
  for(int i=0;i<ballsMid.length;i++){
    ballsMid[i] = new Ball(random(width),random(height),random(20,30),i*10);
}
  for(int i=0;i<ballsBack.length;i++){
    ballsBack[i] = new Ball(random(width),random(height),random(5,20),i*10);
}
}

void draw(){
  translate(0,0,z);
  
  background(mouseX/80);
  
  fill(26);
  //rect(0,height/2.5,width,height-height/2.5);
  
  for(int i=0;i<ballsFront.length;i++){
  ballsFront[i].display();
  ballsFront[i].move();
  }
  for(int i=0;i<ballsMid.length;i++){
  ballsMid[i].display();
  ballsMid[i].move();
  }
  for(int i=0;i<ballsBack.length;i++){
  ballsBack[i].display();
  ballsBack[i].move();
}
//z = sin(angle/500) * 100 + 90;
//angle += .005;
//z = mouseX/5;
}

class Ball{
  float x, y, size, opacity;
  Ball(float x_, float y_, float size_, float opacity_){
    x = x_;
    y = y_;
    size = size_;
    opacity = opacity_;
  }
  
  void move(){
    float drift = y/250;
    float speed = (size/20);
    float xspeed = mouseX/200;
    float yspeed = mouseY/200;
    x = (x+xspeed+speed+drift);
    y = (y+yspeed+speed);
    
    if(x > width+size/2){
      x = 0 -size/2+ random(1,15);
    }
    if(y > height+size/2){
      y = 0 - size/2 + random(1,15);
    }
  }
  
  void display(){
    float opacity;
    if(size < 10){
      opacity = 70;
      //opacity = 100;
    } else{
      opacity = size*2.7;
      //opacity = 100;
    }

    
    fill(100,opacity);
    noStroke();
    ellipse(x,y,size,size);
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  z = z + e*-3;
  
  if(z > 200){
    z = 200;
  }
  
  if(z < 0){
    z = 0;
  }
}


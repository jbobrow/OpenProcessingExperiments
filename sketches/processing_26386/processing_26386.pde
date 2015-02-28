
Line[] lines;
float vx =1;
float wind =1;
float x = 10;
PImage u;

void setup(){
  size(500,500);
  smooth();
  u = loadImage("universe.jpg");
  image(u,0,0);
  lines = new Line[4];
  for(int i = 0; i < lines.length; i++){
    lines[i] = new Line(random(500),random(500));
  }
  
}

void draw(){
  
  vx += wind;
  if(x>width){
    x=width;
    vx=-vx;
  }
  
  for (int i = 0; i < lines.length; i ++){
    lines[i].display();
    lines[i].move();
  }
}
    void mouseDragged(){
  
    fill(random(500),random(500),random(500));
}


class Line{
  float x,y, vy,vx, friction,frictionX,gravity,wind,radius,angle;
 float acceleration = 0.5;
 // float diameter;

  
  //constructor
  Line(float xpos, float ypos){
    x=xpos;
    y=ypos;
   vy=0;
   vx=2;
   
   friction = -.6;
   frictionX = -.998;
   gravity = .04;
   wind = .01;
  }
  
  void display(){
    line(x,y,5,5);
  }
  
  void move(){
  x+= acceleration;
    
vy += gravity;
vx *= frictionX;
x  += vx;
y  += vy;


if (y > height){
y= height;
vy *=friction;

}

if( x > width){
  x = width;
  vx *=friction;
}
float distance = dist(x,y,mouseX,mouseY);
vy -= map (distance,0,height,0,.05);
if (distance < 1){
  vy -=.1;
  vx +=.1;
  
//if(dist(x,y,mouseX,mouseY)<5){
  //vy -= .5;
  //vx += .5;
  
}

}
}








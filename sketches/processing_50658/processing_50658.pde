
int x;
int y;
int directionx;
int directiony;
int state;
float mx;
float my;
int numCircles = 100;
Circle[] circles = new Circle[numCircles];


void setup(){
  size(800,800);
  state = 0;
  x = 10;
  y = 10;
  directionx = 3;
  directiony = 3;
  smooth();
  noCursor();
  mouseX=width/2; mouseY=height/2;
  for(int i = 0; i < numCircles; i++){
    circles[i] = new Circle();
  }
}


void mouseClicked(){
  state = 1;
  
}


void draw(){
  background(0);
  if (state == 0) {
  draw0();
}
  else {
  draw1();
  }
  
  for(int i = 0; i < circles.length; i++){
  circles[i].run();
  circles[i].spawn();
  }
}

void draw0(){
  ellipse(mouseX,mouseY,10,10);
}

class Circle {
  float xpos, ypos, rad, xspeed, yspeed;
  
  Circle(){
    rad = random(80);
    xpos = random(0,width);
    ypos = random(0,height);
    xspeed = random(-3,3);
    yspeed = random(-3,3);
  }
  
void spawn(){
  stroke(0);
  fill(255);
  ellipse (xpos,ypos,rad,rad);
 }
  
void run(){
  xpos += xspeed;
  ypos += yspeed;
 }
}


void draw1(){
  
  
 x += directionx;
 y += directiony;
 
 if (x < 0){
   directionx = 1;
 }
 
 if (y < 0){
   directiony = 1;
 }
 
 if ((x > 3000) && (y > 3000)){
   directionx = 0;
   directiony = 0;
   state = 2;
   
 }
 
 if (x < 3500){
   mx = mouseX;
 }

if (y < 3500){
   my = mouseY;
 }
 
 
  ellipse(mx,my,x,y);
}




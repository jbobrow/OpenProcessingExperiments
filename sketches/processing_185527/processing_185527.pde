


float speed=100;
float x;
float y;
float d=500;

void setup(){
  size(700, 700);
  smooth();
 stroke(#F7E998);
  x=width/5;
  y=width/3;
  background(#F7E998);
  
}

void draw(){
  x+= random(-speed, speed);
  y+= random(-speed, speed);
 // fill(random(144), random(250), random(175), 80);
  
  
  float mx=mouseX;
  float my=mouseY;
  float ix=width-mouseX; //inverse x
  float iy=height-mouseY; //inverse y
  ellipse(mx, my, my, my);
  fill(random(144), random(250), random(175), 80);
  ellipse(ix, iy, iy, iy);
  
  //(200, 500, x-10, y-50, d+random(50), random(20));
}

void keyPressed() {
  if ((key=='s') || (key=='S')){
    saveFrame("inverse-####.png");
    
  }
if ((key=='c')||(key=='C')){
    background(255);
  }}



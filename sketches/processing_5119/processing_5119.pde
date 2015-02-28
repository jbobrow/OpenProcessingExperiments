
float x;
float y;
float xa;
float ya;
float xz = 100;
float yz = 100;
float angle1 = 0.0;
float segLength = 10;
PImage bg;
void setup(){
  size(400,400);
  strokeWeight(20.0);
  stroke(0, 255);
  smooth();
  bg = loadImage("Sand0150_4_Sa.jpg");
}
void draw(){
  // drawing shapes
  
  float dx = x - xz;
  float dy = y - yz;
  angle1 = atan2(dy, dx);  
  xz = x - (cos(angle1) * segLength);
  yz = y - (sin(angle1) * segLength);
  background(bg);
  translate(width/2,height/2);
  segment(xz, yz, angle1);
  
  
  // movement
  xa=xa+random(-0.1,0.1);
  ya=ya+random(-0.1,0.1);
  x=x+xa;
  y=y+ya;
  // walls
  if(x>=width/2-2){
    x=x-0.1;
    xa=-xa*0.5;
  }if(x<=-width/2+2){
    x=x+0.1;
    xa=-xa*0.5;
  }if(y>=height/2-2){
    y=y-0.1;
    ya=-ya*0.5;
  }if(y<=-height/2+2){
    y=y+0.1;
    ya=-ya*0.5;
  }
  // speed limiter
  if(xa>=2){
    xa=xa-1;
  }if(xa<=-2){
    xa=xa+1;
  }if(ya>=2){
    ya=ya-1;
  }if(ya<=-2){
    ya=ya+1;
  }
}
  void segment(float xz, float yz, float a) {
  pushMatrix();
  translate(xz, yz);
  rotate(a);
  
  strokeWeight(20.0);
  stroke(50, 255);
  line(0, 0, segLength, 0);
  strokeWeight(1.0);
  stroke(255);
  fill(255);
  ellipse(15,3,1,1);
  ellipse(15,-3,1,1);
  fill(255,0,0);
  stroke(255,0,0);
  ellipse(0,-2,2,2);
  ellipse(0,2,2,2);
  ellipse(-5,-4,2,2);
  ellipse(-5,4,2,2);
  ellipse(5,-4,2,2);
  ellipse(5,4,2,2);
  popMatrix();
}


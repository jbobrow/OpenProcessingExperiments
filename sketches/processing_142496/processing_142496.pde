
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float x,y,px,py,xl,yl,sW,a,b;

void setup(){
  size(800,800);
  background(0);
  smooth();
  frameRate(57); // set the speed of the frameRate
}

void draw(){
  fill(0,55);
  noStroke();
  rect(0,0,width,height);
  
  // coordinate generator for x and y
  x=random(width);
  y=random(height);
  sW=random(100);
  
  stroke(255);
  strokeWeight(sW);
  line(x,y,xl,yl);
  
  // memory of the previous coordinate
  xl=x;
  yl=y;
  
}


float r = 0.0;

void setup(){
  size(960,500);
  smooth();
  rectMode(CENTER);
  noStroke();
}

void draw(){
  background(#6787DE);
  
  //TRANSLATE ORIGIN TO CENTER OF SKETCH
  translate(width/2, height/2);
  
  pushMatrix();
  fill(40);
  rotate(r * 0.75);
  rect(0, 0, 200, 200);
  popMatrix();
  
  pushMatrix();
  fill(255);
  rotate(r * -0.5);
  rect(0, 0, 140, 140);
  popMatrix();
  
  //ROTATION CONSTANT
  r += .05;
}

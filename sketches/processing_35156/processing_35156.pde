
void setup(){
  size(600,600);
  smooth();
  background(151,250,71);
  frameRate(30);
}

void draw(){
  stroke(mouseX,0,mouseY);
  float distance =dist(pmouseX,pmouseY,mouseX,mouseY);
  float maxStroke=50;
  strokeWeight(maxStroke-constrain(distance,0,maxStroke));
  line(pmouseX,pmouseY,mouseX,mouseY);
}
void mouseClicked(){
  rectMode(CENTER);
  fill(mouseY,10,mouseX);
  noStroke();
}
void keyPressed(){
  background(0);
}
  


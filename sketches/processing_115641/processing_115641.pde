
void setup() {
  size(displayWidth, displayHeight);
  background(20);
  rectMode(CENTER);
}

void draw(){
  ellipse(width/2, height/2, pmouseX, pmouseY);
  color(140);
  fill(20,20,20,20);
  stroke(180,180,180);
  smooth();
}
void mousePressed(){
  fill(20);
  noStroke();
  rect(width/2,height/2,width,height);
}


float x;
float y;
float easing=.04;

void setup() {
  size(displayWidth, displayHeight);
  background(20);
  rectMode(CENTER);
}

void draw(){
  float targetX=mouseX;
  float targetY=mouseY;
  x +=(targetX-x)*easing;
  y +=(targetY-y)*easing;
  ellipse(width/2, height/2, x, y);
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


//boolean mouseDown = false;

void setup() {
  size(400,400);
  background(149,20,20,200);
  smooth();
}
void draw() {
  if (mousePressed==true){
  strokeWeight(map(pmouseX,0,400,3,12));
  stroke(map(pmouseY,0,400,0,256));
  line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
void mousePressed() {
  noStroke();
  fill(0,80);
  rectMode(CENTER);
  rect(mouseX,mouseY,40,40);
}
void mouseReleased() {
  noStroke();
  fill(0,80);
  rect(mouseX,mouseY,40,40);
}
void keyPressed() {
  background(149,20,20,200);
}



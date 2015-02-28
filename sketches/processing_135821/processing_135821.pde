
void setup() {
  size(400,400);
  background(255);
  smooth();
}
void draw() {
  float a=random(50);
  noFill();
  if (mousePressed==true) {
    fill(255,255,255,30);
    stroke(0,0,0,30);
    ellipse(mouseX,mouseY,a,a);
    stroke(0,0,0,10);
    line(mouseX,mouseY,400,400);
  }
  else {
    stroke(mouseX-pmouseY,mouseY-pmouseX,255,10);
    line(mouseX,mouseY,a/2,a/2);
    stroke(mouseX-pmouseY,mouseY-pmouseX,255,40);
    ellipse(mouseX,mouseY,a,a);
  }
}

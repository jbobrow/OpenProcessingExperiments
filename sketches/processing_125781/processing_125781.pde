
void setup () {
  size(500,500);
  background(200);
}
void draw () {
  if (mousePressed) {
    fill(50,0,0);
  } else {
    fill(255,255,255);
  }
  ellipseMode(CENTER);
  ellipse(250,250,mouseX,mouseY);
}

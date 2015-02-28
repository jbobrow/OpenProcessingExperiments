
void setup() {
  size(600, 400);
  background(250,250,20);
  smooth();
}
void draw() {
  if (mousePressed) {
    fill(255,100,50);
  } else {
    stroke(255,89,255);
    fill(50,250,60);
  }   
triangle(mouseX,mouseY,220,mouseX,mouseY,200);
}


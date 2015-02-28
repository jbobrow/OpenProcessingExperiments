
void setup(){
  size (600,600);
  background(250);
}
void draw() {
  if (mousePressed) {
    stroke (255);
    fill (50,200,100);
  } else {
    stroke(0);
    fill(255);
  }
  ellipse(mouseY,mouseX,15,15);
}


void setup () {
  background(255);
  size(300,300);
}

void draw () {
  //background(255);
  strokeWeight(2);
  smooth();
  fill(mouseX,255,mouseY);
  triangle(mouseX,mouseY,20,20,80,90);
  println(mouseX);
}


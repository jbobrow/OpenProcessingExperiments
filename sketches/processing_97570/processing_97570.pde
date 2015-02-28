
void setup() {
  size(200, 200);
  background(255);
}
void draw() {
  int x= mouseX;
  int y= mouseY;
  background(255, 99, 71);
  rect(80, 80, 40, 40);
  fill(0);

  if (x>=80 && x<=120 && y>=80 && y<=120)
    background(255);
}




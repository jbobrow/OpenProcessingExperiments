
boolean button = false;
float a = 0;
float b = 5;
float angle = 0;
void setup () {
  size(800, 600);
  background(255);
  frameRate(15);
}
void draw() {
  stroke(mouseX-100, mouseY-100, mouseX, mouseY);
  translate(width/2, height/2);
  rotate (radians(angle));
  if (keyPressed) {
    line(-75, 10, a, b);
    line(75, -10, a, b);
  } else line(75, -10, a, b);
  if (mousePressed) {
    button = !button;
  }
  if (button) {
    background(255);
    a = 0;
    b = 5;
    angle = 0;
    line(75, -10, a, b);
  }
  angle += (50);
  a += 0.1;
  b += 0.5;
 }


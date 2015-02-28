
boolean button = false;
float a = 0;
float b = 5;
float angle = 0;

void setup()
{
  size(400, 300);
  background(#8eb0b0);
  frameRate(29);
}

void draw() {
  float r = random(50);
  stroke(mouseX-50, mouseY-100, mouseX, 50);
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
    background(#8eb0b0);
    a = 0;
    b = 5;
    angle = 0;
    line(67, -10, a, b);
  }
  angle += (50);
  a += 0.1;
  b += 0.5;
 }



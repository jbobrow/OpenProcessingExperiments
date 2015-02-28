
int value = 0;
void setup() {
background(0);
size(255, 255);
smooth();
}
void draw() {
fill(mouseX, mouseY, value);
noStroke();
ellipse(mouseX, mouseY, 40, 40);
}
void mouseMoved() 
{
  value = value + 5;
  if (value > 255) {
    value = value - 5;
  }
}



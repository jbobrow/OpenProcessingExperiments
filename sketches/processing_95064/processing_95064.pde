
//Five objects equal distance around the mouse
//in class April, 2, 2013
float degrees = 360/5;
float distance = 50;

void setup() {
  size (350, 600);
} 
void draw() {
  background(200);
  fill(0, 0, 255);
  float xOffset = cos(radians(degrees)) * distance;
  float yOffset = sin(radians(degrees)) * distance;
  ellipse(mouseX + xOffset, mouseY + yOffset, 20, 20);
  fill(255, 0, 0);
  xOffset = cos(radians(degrees * 2)) * distance;
  yOffset = sin(radians(degrees * 2)) * distance;
  ellipse(mouseX + xOffset, mouseY + yOffset, 20, 20);
  fill(0,255,0);
  xOffset = cos(radians(degrees * 3)) * distance;
  yOffset = sin(radians(degrees * 3)) * distance;
  ellipse(mouseX + xOffset, mouseY + yOffset, 20, 20);
  fill(0,0,0);
  xOffset = cos(radians(degrees * 4)) * distance;
  yOffset = sin(radians(degrees * 4)) * distance;
  ellipse(mouseX + xOffset, mouseY + yOffset, 20, 20);
  fill(100,0,0);
  xOffset = cos(radians(degrees * 5)) * distance;
  yOffset = sin(radians(degrees * 5)) * distance;
  ellipse(mouseX + xOffset, mouseY + yOffset, 20, 20);
}


//five objects equal distance around the mouse
int objNum = 20;
float degrees = 360/5;
float distance = 50;
float angleOffset = 0;
void setup () {
  size (350, 600);
}
void draw () {
  background (255);
  distance = 30;
  noStroke ();
  fill (34,35, 97, 80);
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  angleOffset+=2;
}
  
  
 /* xOffset = cos(radians(degrees*2)) * distance;
  yOffset = sin(radians(degrees*2)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  xOffset = cos(radians(degrees*3)) * distance;
  yOffset = sin(radians(degrees*3)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  xOffset = cos(radians(degrees*4)) * distance;
  yOffset = sin(radians(degrees*4)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  xOffset = cos(radians(degrees*5)) * distance;
  yOffset = sin(radians(degrees*5)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);*/


//Gabriela Nisenbaum
//April 6, 2013
//sin-based motion
int objNum = 50;
float degrees = 360/20;
float distance = 50;
float angleOffset = 0;
void setup () {
  size (350, 600);
}
void draw () {
  background (255);
  //purple
  distance = 30;
  noStroke ();
  fill (34,35, 97, 80);
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  angleOffset+=1;
  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  distance = 90;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  distance = 120;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
   distance = 150;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
   distance = 180;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  
  //orange
   distance = 30;
  noStroke ();
  fill (250, 131, 40, 80);
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) + 500 * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) + 500 * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  //angleOffset+=1;
  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
 /* distance = 90;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }*/
  distance = 120;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  /* distance = 150;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }*/
   distance = 180;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
 
}

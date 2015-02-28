
//five objects equal distance around the mouse
int objNum = 20;
float degrees = 360/objNum;
float distance = 50;
float angleOffset =0;

void setup () {
  size(350, 600);
}

void draw() {
  background(255, 0, 164);
  distance = 10;

  for (int i = 0; i < objNum; i++) {
fill(random( 255),255,166);
    float xOffset = cos(radians (degrees * i +angleOffset)) * distance;
    float yOffset = sin(radians (degrees *  i +angleOffset)) * distance;
    ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
    xOffset = cos(radians (degrees * i +angleOffset + 180)) * distance;
    yOffset = sin(radians (degrees *  i +angleOffset + 180)) * distance;
    ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
    distance+=15;
    angleOffset -=1;

  //angleOffset ++ =2

}
}

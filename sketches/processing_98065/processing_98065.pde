
int objNum = 20;
float degrees = 220/objNum;
float distance = 50;
float angleOffset =0;
void setup () {
  size(650, 600);
}

void draw() {
  background(55, 0, 160);
  distance = 5;
  for (int i = 0; i < objNum; i++) {
fill(random( 255),255,166);
    float xOffset = cos(radians (degrees * i +angleOffset)) * distance;
    float yOffset = sin(radians (degrees *  i +angleOffset)) * distance;
    ellipse (mouseX + xOffset, mouseY + yOffset, 40, 40);
    xOffset = cos(radians (degrees * i +angleOffset + 200)) * distance;
    yOffset = sin(radians (degrees *  i +angleOffset + 200)) * distance;
    ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
    distance+=15;
    angleOffset -=1;
 }
}



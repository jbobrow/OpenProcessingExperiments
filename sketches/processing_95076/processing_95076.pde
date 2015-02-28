
//Objects in a circle
//Creative Computing Example
//Ben Norskov April 2, 2013
int objNum = 30;
float degrees = 360/objNum;
float angleOffset = 0;
float distance = 10;
void setup() {
  size(350, 350);
}
void draw() {
  background(30, 200, 50);
  distance = 10;//start close to the mouse
  fill(0, 0, 255);
  for ( int i =0; i<objNum; i++) {
    float xOffset = cos( radians(degrees * i + angleOffset)) * distance;
    float yOffset = sin( radians(degrees * i + angleOffset)) * distance;
    ellipse(mouseX + xOffset, mouseY + yOffset, 20, 20);
    distance+=5;//move out a bit for every object
  }
  angleOffset -= 2;//this is what rotates the spiral
}

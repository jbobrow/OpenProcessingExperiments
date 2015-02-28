
//five objects equal dist around the mouse
int objNum = 50;
float degrees = 360/objNum;
float distance = 15;
float angleOffset = 0;
float yOffset;
void setup() {
  size(600,600);
  noStroke ();
}
void draw() {
  background(200);
  distance = 5;
 
  for(int i =0; i < 500; i ++) {
   fill(0,0,i/2,50);
   float xOffset = cos(radians(degrees * i + angleOffset)) * distance;
   float yOffset = sin(radians(degrees * i + angleOffset)) * distance;
   ellipse(mouseX + xOffset, mouseY + yOffset, i/10, i/10);
  
   distance+=.5;
 }
 angleOffset += 10;
}




float xPos = 0.0;

void setup() {  // setup() runs once
  size(200, 200);
  frameRate(30);
}
 
void draw() {  // draw() loops forever, until stopped
  
  xPos++;
  if (xPos == width) {
    xPos = 0;
  }
 stroke(random(255), random(255), random(255));  
  line(xPos, 0, xPos, height);
  
  }
  

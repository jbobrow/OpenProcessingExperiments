
float yPos = 0.0;
float xPos = 0.0;


void setup() {  // setup() runs once

  size(200, 200);
  frameRate(1);
  
}
 
void draw() {  // draw() loops forever, until stopped
  yPos = random(height);
  xPos = random(width);
fill(random(255), random(255), random(255));
    // rect(xPos, yPos, height, width);
  rect(0,0, xPos, yPos);
 
}

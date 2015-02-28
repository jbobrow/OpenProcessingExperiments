
float yPos = 0.0;
float xPos = 0.0;


void setup() {  // setup() runs once

  size(200, 200);
  frameRate(1);
  int n = 1 << 8;   // In binary: 1 to 100000000
println(n);  // Prints "256"

}
 
void draw() {  // draw() loops forever, until stopped
  yPos = random(height);
  xPos = random(width);

  fillColor = random(255);
 // rect(xPos, yPos, height, width);
  rect(0,0, xPos, yPos);
 
}

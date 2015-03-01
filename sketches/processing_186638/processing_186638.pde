
float yPos = 0.0;

void setup() {  // setup() runs once
  size(900, 500);
  frameRate(30);
  colorMode(HSB);
  noFill();
}
 
void draw() {  // draw() loops forever, until stopped
 background(0);
  yPos = yPos - 1.0;
  if (yPos < 0) {
    yPos = height;
  }
  for (int i=500; i>0; i=i-15) {
  stroke((i*0.1)+(mouseX/4),255,250);
  ellipse(450, yPos, i, i-yPos);
}
  //ellipse(0, yPos, width, i-yPos);
}

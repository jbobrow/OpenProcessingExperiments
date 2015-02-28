
float yPos = 0.0;
int xSize = 0;
int ySize = 0;

void setup() {  // setup() runs once
  size(400, 400);
  frameRate(30);
  background(255);
}
 
void draw() {  // draw() loops forever, until stopped
  xSize = int(random(0, 100));
  stroke(xSize);
  fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  ellipse(mouseX, mouseY, xSize, xSize);
  
  yPos = yPos - 1.0;
  if (yPos < 0) {
    yPos = height;
  }
  stroke(255, 255, 255, 155);
  line(0, yPos,width, yPos);
}

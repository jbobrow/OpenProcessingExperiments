
int xPos = 0;
int yPos = 0;
int speeda = 5;
int speedb = 10;

void setup() {
  size(900,600);
  smooth();
}

void draw() {
  background(0);

  // + speed to the xPos,yPos
  xPos = xPos + speeda;
  yPos = yPos + speedb;

  if ((xPos > width) || (xPos < 0)) {
    
    speeda = speeda * -1;
  }
  
if ((yPos > height) || (yPos < 0)) {
  
  speedb = speedb* -1;
}
  
  stroke(0);
  fill(200,20,17);
  ellipse(xPos,yPos,50,50);
}






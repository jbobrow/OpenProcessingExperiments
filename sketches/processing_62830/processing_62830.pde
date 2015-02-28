
float  xPos = 0 ;
float xDir = 3;
float yPos = 0;
float yDir = 2;


void setup() {

  size(400, 300);
  smooth();
}
//ellipse fängt bei null an
void draw() {
  background(200);
  rect(mouseX,mouseY,10,10);
  ellipse(xPos, yPos, 20, 20);

  if (xPos>mouseX) {
    xDir = -2;
  }
  if (xPos < 0) {
    xDir = 1;
  }
  if (yPos>height) {
    yDir = -2;
  }
  if (yPos< 0) {
    yDir = 2;
  }

  yPos = yPos + yDir;
  xPos = xPos + xDir;
}

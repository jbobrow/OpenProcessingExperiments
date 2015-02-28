
int xPos = 0;
int yPos = 100;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  noStroke();
  background(mouseX,mouseY,xPos);
  fill (xPos,xPos,xPos);
  rect(pmouseX,pmouseY,xPos,xPos);
  
}
void keyPressed() {
  xPos = 0;
    saveFrame("test.png");

}
void mousePressed() {
  xPos = xPos + 20;
}




//Carlyn Maw, January 2014
//Week 3 Boundries, Example 5
//Set the size of the ball with the slider?

int handlePos = width/2;

void setup() {
  size(480, 320);
  smooth();
}

void draw() {
  drawBackground();
  
  drawSliderFrame((width-200)/2, (7*height/8), 200);
  handlePos = mouseX;
  drawHandle(handlePos);

  ellipseMode(CENTER);
  fill(255);
  ellipse(width/2, height/3, handlePos, handlePos);
}

void drawBackground() {
  background(204);
}

void drawSliderFrame(int myX, int myY, int myWidth) {
  fill(51);
  rect(myX, myY, myWidth, 16);
  line (myX+5, myY+8, (myX+myWidth)-5, myY+8);
}

void drawHandle(int myPos) {
  fill(255);
  int xPos = myPos;
  rect(xPos, (7*height/8)-5, 16, 26);
}







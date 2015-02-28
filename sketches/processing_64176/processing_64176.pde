
float xPos;
float yPos;
float increx = 2; 
float increy = 3;
float gravity = 0.5;
void setup() {
  smooth();
  fill(148, 65, 222);
  size(500, 500);
  frameRate(30);
  yPos = height/2;
  xPos = width/3;
}
void draw() {
  background(255);
  ellipse(xPos, yPos, 20, 20);
  xPos+=increx;
  yPos+=increy;
  if (xPos>width-10) {
    xPos = width-10;
    increx = -increx;
  }
  else if (xPos<10) {
    xPos = 10;
    increx = - increx;
  }  
  if ( yPos>height-10) {
    yPos=height-10;
    increy = -increy*0.9;
  }
  else if (yPos<10) {
    yPos = 10;
    increy = -increy*0.9;
  }
  increy += gravity;
}



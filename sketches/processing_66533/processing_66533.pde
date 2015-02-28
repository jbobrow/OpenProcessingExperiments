
//The ball will move up and down pressing on the font and making  it disapear + I added a mouse over to make the ball move with the mouce
// For the position of the ellipse we need 2 variables, one for the x and one for the y
PFont myfirstFont;
PFont mySecondFont;

float xPosition;
float yPosition;
float vol;

float xSize;
float ySize;
float yBounceSize;
float yBounceSizeTop;
float yBounceSizeBottom;

float xMouseStart;
float xMouseMove;
 
void setup() {
  size(400,400);
  frameRate(60);  // the speed of the ball is a combination of vol and frameRate
  smooth();
   vol = 3;
  
  myfirstFont = loadFont("SinhalaMN-48.vlw");
  mySecondFont = loadFont("STIXGeneral-Bold-48.vlw");
 
  // the ellipse in the middle of the screen
  xPosition = width/2;
  yPosition = height/2;
  

  
  xSize = 100;
  ySize = 100;
  yBounceSize = ySize;
  yBounceSizeTop = yBounceSize;
  yBounceSizeBottom = yBounceSize;
}
 
void draw() {
  // the background
  background(0);
  rectMode(CENTER);
  
  // the ellipse
  noStroke();
  float percentage = (yPosition/(height/100));
  float firstFont = (percentage/100)*255;
  float secondFont = 255-((percentage/100)*255);
  fill(255);
  ellipse(xPosition, yPosition, xSize, yBounceSize);

  // the bottom ltext
  fill(111,216,20);
  textFont(mySecondFont);
  text("Coding is hard",150, height-(yBounceSizeBottom-85));
  
  
  // the top text
  fill(72,202,244);
  textFont(myfirstFont);
  text("coding is hard",150,(yBounceSizeTop-70));
   
  yPosition = yPosition + vol;
  
  if (yPosition >= height || yPosition <= 0) {
    vol =vol*(-1);
  }

  if (yPosition > height-ySize) {
    yBounceSize = height-yPosition;
    yBounceSizeBottom = yBounceSize;
  } else if (yPosition < ySize) {
    yBounceSize = yPosition;
    yBounceSizeTop = yBounceSize;
  }
}
 
void mousePressed() {
  xMouseStart = mouseX;
}

void mouseDragged() {
  xMouseMove = mouseX-xMouseStart;
  xMouseStart = mouseX;
  xPosition = constrain(xPosition + xMouseMove,width*0.25,width*0.75);
}

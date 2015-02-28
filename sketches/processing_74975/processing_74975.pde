
PFont font;
String txt = "A MAP OF 8,000 U.S. STARBUCKS LOCATIONS USES SPATIAL ANALYTICS TO PLOT THE CHAIN’S STAGGERING REACH.";
int xPos = 20;
int yPos = 20;
int directionX = 1;
int directionY = 1;

void setup() {
  size(500, 500);

  font = loadFont("FranklinGothic-Demi-40.vlw");
  textFont(font);
}
void draw() {
  background(200);

  textSize(30);
  fill(234, 0, 0);
  //text(String, x, y)
  text("The United States Of Starbucks", 20, 20, 450, 100);
  
  textSize(15);
  //text(String, x, y, width, height)
  fill(0);
  textLeading(20);
  //textLeading(mouseY/10);
  text(txt, xPos + 25, yPos + 70, 250, 100);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
  //right border
  if(xPos > 220) {
    directionX = - 1;
  }
  
  //left border
  if(xPos < 0) {
    directionX = + 1;
  }
  
  //top border
  if(yPos > 330) {
    directionY = - 1;
  }
  
  //bottom border
  if(yPos < 0) {
    directionY = + 1;
  }
}



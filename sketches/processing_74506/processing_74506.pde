
int d = 30;
int l = 25;
int m = 22;
int n = 8;
int a = 15;

int xPos = 50;
int yPos = 50;
int directionX = 2;
int directionY = 2;


void setup() {
  size(400, 400);
  
  smooth();
}




void draw() {
  background(255);
  
  noCursor();
  
  //ape
  noStroke();
  fill(167, 241, 248, 80);
  ellipse(xPos+2, yPos-22, a, m);
  ellipse(xPos-4, yPos-20, a-2, a+2);
  fill(0);
  ellipse(xPos, yPos, d, l);
  ellipse(xPos+20, yPos, a+3, a+3);
  fill(255, 255, 0);
  ellipse(xPos, yPos, m, l);
  fill(0);
  ellipse(xPos, yPos, n, l);
 
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
  
  //right border or left border
   if (xPos > mouseX || xPos <d/2) {
    directionX = -directionX;
  }
  
  //top border or bottom border
  if(yPos < d/2 || yPos > mouseY){
    directionY = -directionY;
  }
  
  //paletta
  noStroke();
  fill(255,0,0);
  rect(mouseX, mouseY-240, 80, 90, 20);
  rect(mouseX+30, mouseY-240, 20, 240, 20);
  
  if(mousePressed){
    fill(255);
  rect(mouseX-5, mouseY-240, 100, 120, 20);
  rect(mouseX+30, mouseY-240, 30, 250, 20);
    
    fill(255, 0, 0);
  rect(mouseX-240, mouseY-30, 90, 80, 20);
  rect(mouseX-240, mouseY, 240, 20, 20);
  
  }
  
}

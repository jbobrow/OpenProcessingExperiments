
int xPos = 0;
int yPos = 0;
int directionX = 1;
int directionY = 1;

void setup(){
  size(400,400, P2D);
  
 
}
 
void draw(){
  background(255);
  
  noCursor();
  
  //face
  fill(0);
  ellipse(xPos + 200, yPos + 200, 300, 300);
  ellipse (xPos + 150, yPos + 150, 10, 10);
  ellipse (xPos + 250, yPos + 150, 10, 10);
  fill(255);
  rect (xPos + 100, yPos+200, 200, 80, 20);
  ellipse (xPos+150, yPos+150, 40, 40);
  ellipse (xPos+250, yPos+150, 40, 40);
  fill(0);
  ellipse (xPos+150, yPos+150, 10, 10);
  ellipse (xPos+250, yPos+150, 10, 10);
  
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
if (xPos > mouseX || xPos <100/2) {
    directionX = -directionX;
  }
   

  if(yPos < 100/2 || yPos > mouseY){
    directionY = -directionY;
  }

   
  noStroke ();
  fill(255);
  rect(0, 0, mouseX, 400);
  
 
  
}

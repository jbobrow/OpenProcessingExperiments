
int d = 10;

int xPos = 100;
int yPos = 100;
int directionX = 2;
int directionY = 2;

void setup() {
  size(300, 300);

  smooth();
}

void draw() {
  background(255);
  


  

noStroke();
fill(0);
ellipse(xPos, yPos, 20, 20);
fill(255);
text("+", xPos, yPos);

  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
   if (xPos > mouseX || xPos <d/2) {
    directionX = -directionX;
   }
   
   
    if(yPos < d/2 || yPos > mouseY){
    directionY = -directionY;
  }
  
  


 


if(mousePressed){
  fill(0);
ellipse(mouseX, mouseY, 20, 20);
fill(255);
text("-", mouseX, mouseY);


}
}

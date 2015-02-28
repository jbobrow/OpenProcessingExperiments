
float squareHeight = 3;
float initSpacing = 1;
float currentX;
float currentY;
float d;
float d2;



void setup() 
{
  size(500, 400);
  strokeWeight(0);
  background(#C9C9C9);

}


void draw() {
currentX = initSpacing;
currentY = initSpacing;
  stroke(#FFFFFF);
  fill(0);
  for (int i = 0; i < ((height/(squareHeight + initSpacing)) * 1.3 *(width/(squareHeight + initSpacing))); i++) 
  { 
    d = dist(currentX, currentY, mouseX, mouseY);
    initSpacing = d/100;
    fill(#000000);    
      rect (currentX, currentY, squareHeight, squareHeight);
    currentX = currentX + initSpacing + squareHeight;
    if (currentX > (width - squareHeight)) 
    {
      currentX = initSpacing;
      currentY = currentY + squareHeight + initSpacing;
    }
    
  }
}

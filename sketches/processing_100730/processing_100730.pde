
float squareHeight = 10;
float initSpacing = 0;
float currentX;
float currentY;
float d;
float d2;
float randomHundred;



void setup() 
{
  size(300,300);
  strokeWeight(0);
  background(#C9C9C9);

}


void draw() {
currentX = initSpacing + random(100);
currentY = initSpacing + random(100);
  stroke(#FFFFFF);
  strokeWeight(3);
  fill(0);
  for (int i = 0; i < ((height/(squareHeight + initSpacing)) * 1.3 *(width/(squareHeight + initSpacing))); i++) 
  { 
    randomHundred = random(100);
    d = dist(currentX, currentY, mouseX, mouseY);
    initSpacing = d/400;
    fill(mouseX+mouseY%5, mouseX%0, mouseY%0);
    rotate(PI/(d%2));    
      rect (currentX-20, currentY-20, squareHeight, squareHeight);
    currentX = currentX + initSpacing + squareHeight;
    if (currentX > (width - squareHeight)) 
    {
      currentX = initSpacing;
      currentY = currentY + squareHeight + initSpacing;
    }
    
  }
}

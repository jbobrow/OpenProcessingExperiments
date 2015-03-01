
float squareHeight = 10;
float initSpacing = 20;
float currentX;
float currentY;
float d;
float d2;
float randomHundred;



void setup() 
{
  size(300,300);
  strokeWeight(0);
  background(#FFFFFF);

}


void draw() {
currentX = initSpacing + random(100);
currentY = initSpacing + random(100);
  stroke(#FFFFFF);
  strokeWeight(0);
  fill(0,100,255,random(100));
  //tint(random(100),10);
  //for (int i = 0; i < ((height/(squareHeight + initSpacing)) * 1.3 *(width/(squareHeight + initSpacing))); i++) 
  //{ 
    randomHundred = random(100);
    d = dist(currentX, currentY, random(300), random(300));
    initSpacing = d/200;
    //fill(mouseX+mouseY%5, mouseX%0, mouseY%0);
    rotate(PI/(d%2)); 
    //rect(currentX, currentY, mouseX, mouseY);   
    rect (random(300),random(300), squareHeight, squareHeight);
    currentX = currentX + initSpacing + squareHeight;
    if (currentX > (width - squareHeight)) 
    {
      currentX = initSpacing;
      currentY = currentY + squareHeight + initSpacing;
    }
    
  //}
}

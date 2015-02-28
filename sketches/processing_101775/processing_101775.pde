
float squareHeight = 10;
float initSpacing = 10;
float currentX;
float currentY;
float d;




void setup() 
{
  size(3000,1400);
  strokeWeight(0);
  frameRate(3);
  background(#FFFFFF);

}


void draw() {

currentX = initSpacing + random(100);
  stroke(150, 150, 150, 50);
  strokeWeight(.25);
  fill(0);
  for (int i = 0; i < (width*2); i++) 
  { 
    translate(width/2, height/2);
       rotate(PI/(d%2));
    d = dist(currentX, currentY, mouseX, mouseY);
    initSpacing = d/80000;
    fill(255,255,255,random(30)); 

      rect (mouseX, mouseY, squareHeight, 2* height);
  }
}

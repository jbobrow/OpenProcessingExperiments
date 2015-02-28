
float squareHeight = 10;
float initSpacing = 10;
float currentX;
float currentY;
float d;
float randomHundred;
float R;
float G;
float B;



void setup() 
{
  size(1200,400);
  strokeWeight(0);
  frameRate(3);
  background(#000000);

}


void draw() {

currentX = initSpacing + random(100);
  stroke(#a4a4a4);
  strokeWeight(.25);
  fill(0);
  for (int i = 0; i < (width*2); i++) 
  { 
    translate(width/2, height/2);
       rotate(PI/(d%2));
    d = dist(currentX, currentY, mouseX, mouseY);
    initSpacing = d/80000;
    fill(R%5, G%5, B%5); 

      rect (mouseX, mouseY, squareHeight, 2* height);
    R = R + 200;
    G = G + 400;
    B = B + 600;
  }
}


float squareHeight = 10;
float initSpacing = 10;
float currentX;
float currentY;
float d;




void setup() 
{
  size(1500,1000);
  strokeWeight(0);
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
    fill(random(255), random(255), random(255));

      rect (mouseX, mouseY, squareHeight, 2* height);
  }
}

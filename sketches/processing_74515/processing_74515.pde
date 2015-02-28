
int d = 50;
int xPos = 2;
int yPos = 2;
int a = 0;
int directionX = 1;
int directionY = 1;
 
void setup(){
  size(500, 500);
  smooth();
   background(255);
   frameRate(150);
}
 
void draw(){
  background(255);
  fill(0);
  ellipse(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
   strokeWeight(1);
  if(xPos > mouseX+a- d/2){
    directionX = -1;
    ellipse(mouseX, mouseY,a, a);
  }
  if(yPos > mouseY+a - d/2){
    directionY = -1;
  }
   
  if(xPos < d/2){
    directionX = 1;
  }
  if(yPos < d/2){
    directionY = 1;
  }
   
  fill(0,60,250);
  if (mousePressed){
    ellipse(mouseX, mouseY, a, a);
    a = a + 1;
  }
  if (a < width){
    a = 0;
  }
   fill(0,0,0,2);

  ellipse(mouseX, mouseY, 10, 10);

}

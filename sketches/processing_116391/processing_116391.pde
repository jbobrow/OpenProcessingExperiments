
boolean mouseIsDown = false;
boolean canIDraw = false;

void setup() {
   size (1200, 640);
  fill(250, 250, 250);
  smooth();
  noStroke();
  
  
  int value = 0;
  
 
  
}
  
void draw() {

   background(134, 41, 246);
  fill(75, 97, 217);
  float xPos;
  float yPos;
  int circleSize = 70;
  int circleDistance = 90;
  
  for (int x = 3; x<= width; x = x+circleDistance) {
  for (int y=50; y<=height; y=y+circleDistance) {
  
     
      xPos = x + random(mouseX/30);
      yPos = y + random(mouseX/10);
      
      
      fill(75, 97, 217);
 triangle(24, 24, xPos, yPos, 24, 24);
 
 
  fill (53, 205, 190);
      ellipse (xPos, yPos, 100, 90, 50);
     
    translate (300, 0);
    scale (-1,1);
     
     
   fill(189, 183, 159);
    rect ( xPos, yPos, 50, 20, 100, 50);
     
fill (189, 183, 159);
   ellipse( xPos, yPos, 20, 2, 20, 20);
     
 
  }
  }
  
}

//added
void mousePressed()
{
  canIDraw = true;
  mouseIsDown = true;
  line(mouseX, mouseY, pmouseX,pmouseY);
}
  
void mouseReleased() {
  mouseIsDown = false;
  line(pmouseX+20,pmouseY+10, mouseX, mouseY);
   
}
//done added

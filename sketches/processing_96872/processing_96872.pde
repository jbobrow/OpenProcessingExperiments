

// Triangle Ribbon
//
// This sketch is just a fun ribbon for use as interactive website-background
// see: sabrinaverhage.com
//
// MOUSE
// move           : draw ribbon
// click          : reset


PImage img;

int top, left;
color cp1, cp2, cp3; 
float ppmouseX, ppmouseY; //previous-previous mouseX


void setup() {
  
  size(800, 600, P2D);
  background(240);
  
  img = loadImage("image.jpg");
    
  /*
  // to center the image in the window
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;
  */
  
}

void draw() {
  
  // mouseX mouseY
  stroke(0);
  // distance between mouseX and pmouseX
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);
  // distance between pmouseX and ppmouseX
  float pd = dist(pmouseX, pmouseY, ppmouseX, ppmouseY);
   
  // deltaX and deltaY
  float deltaX = mouseX-pmouseX;
  float deltaY = mouseY-pmouseY;
  float pdeltaX = pmouseX-ppmouseX;
  float pdeltaY = pmouseY-ppmouseY;

  // daltaX/2
  float midPointx = mouseX-deltaX/2;
  float midPointy = mouseY-deltaY/2;
  float pmidPointx = pmouseX-pdeltaX/2;
  float pmidPointy = pmouseY-pdeltaY/2;
    
  // angle between mouseX mouseY
  // atan2(deltaY, deltaX) 
  float directionAngle = atan2(deltaY, deltaX);
  float pdirectionAngle = atan2(pdeltaY, pdeltaX);
    
  float x = d * cos(radians(90) + directionAngle);
  float y = d * sin(radians(90) + directionAngle);
  float px = pd * cos(radians(90) + pdirectionAngle);
  float py = pd * sin(radians(90) + pdirectionAngle);
  
  // Fill colors
  cp1 = img.get(int(mouseX)-left, int(mouseY)-top);
  cp2 = img.get(int(pmouseX)-left, int(pmouseY)-top);
  cp3 = img.get(int(ppmouseX)-left, int(ppmouseY)-top);
  

  // Drawing the Triangles:
  strokeWeight(2);
  // inside left
  beginShape();
  fill(cp1);
  vertex(pmouseX, pmouseY);
  vertex(midPointx+x, midPointy+y);
  vertex(mouseX, mouseY);  
  endShape(CLOSE);
  
  // inside right
  beginShape();
  fill(cp2);
  vertex(pmouseX, pmouseY); 
  vertex(midPointx-x, midPointy-y);
  vertex(mouseX, mouseY);  
  endShape(CLOSE);
  
  // outside left
  beginShape();
  fill(cp3);
  vertex(pmouseX, pmouseY);  
  vertex(midPointx+x, midPointy+y);
  vertex(pmidPointx+px, pmidPointy+py);  
  endShape(CLOSE);
  
  // outside right
  beginShape();
  fill(cp3);
  vertex(pmouseX, pmouseY);  
  vertex(midPointx-x, midPointy-y);
  vertex(pmidPointx-px, pmidPointy-py); 
  endShape(CLOSE);
  
  //create a previous-previous mouseX
  ppmouseX = pmouseX;
  ppmouseY = pmouseY;
 
}


void mousePressed() {
  background(240);
}






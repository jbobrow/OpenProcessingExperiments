
float rx, ry;     //rectangle x- and y-coordinates
float rd = 100;   //rectangle width
 
float ex, ey;     //ellipse x- and y-coordinate
float ed = 106;   //ellipse diameter
 
float radius = ed/2;

float easing = .55;
 

void setup(){
  size(640, 360); 
  smooth(); 
  
  //Set the x- and y-coordinates for rectangle
  rx = width * 0.33 - rd/2;  
  ry = height * 0.5 - rd/2; 
  
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
void draw(){
  background(#ffffff); 
  
  if((mouseX >= rx) && (mouseX <= rx + 100) &&
     (mouseY >= ry) && (mouseY <= ry + 100)){
    fill(#C9C299);
    rect(0, 0, 320, 360);
  } else {
       rect(rx, ry, rd, rd);
  }
  
  float d = dist(mouseX, mouseY, ex, ey);
  if( d < radius) {
     float targetX = mouseX;
     ex += (targetX-ex) * easing;
     float targetY = mouseY;
     ey += (targetY-ey) * easing;
    ellipse(ex, ey, ed, ed);
  } else {
    fill(#F76541);
    ellipse(ex, ey, ed, ed);
  }
  
  //resets ellipse
  if (mousePressed) {
    ex = width * 0.66;
    ey = height * 0.5;
  } 
}


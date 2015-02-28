
void setup() {
  
  size(600, 400);
  noStroke();
  frameRate(2);
}


void draw() {
// clear();
 background(255, 255, 0);
 translate(mouseX, mouseY);
 rotate(radians(45));
 fill(0);
 rect(-10, -10, 200, 20, 7);
 int randomColor = int(random(2));
 switch(randomColor) {
  case 0: 
  fill(255, 0, 0);
    break;
  case 1: 
   fill(0,255,0);
    break;
  case 2: 
   fill(0,0,255);
    break;
}
 
 
  int randomShape = int(random(3));
   switch(randomShape) {
  case 0: 
  rotate(radians(-45));
  rect(-65, -65, 55, 55);
  break;
  case 1: 
  ellipse(-40, -5, 55, 55);
    break;
  case 2: 
  triangle(-15, 0, -75, -30, -78, 20);
  //triangle(0, 0, 20, -55, 56, 0);
    break;
}
  
}

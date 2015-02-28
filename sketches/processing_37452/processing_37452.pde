
//HW_4_1_1
void setup() {
  size (400, 400);
  background (200);
  colorMode (RGB, width);
}


void draw() {
  smooth();
  noFill();
  for (int PJ=50; PJ < width; PJ+=10) { // 
    //line color change along with mouseX
    stroke (mouseX, PJ, width);
    strokeWeight (1);
    //looped rectangles forming gird
    rect (0, 0, PJ, PJ); 
    rect (width, height, -PJ, -PJ);
    // looped circles having 200,200 as the center. 
    ellipse (width/2, height/2, PJ, PJ);
  }
}



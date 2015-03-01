
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Based on:
// http://thedotisblack.tumblr.com/image/101413231209/
//
// Controls:
// LeftMouseClick   - redraw with new xPos and yPos
//
/////////////////////////////////////////////////

color clr [] = {#19414D, #B2323D};

void setup() {
  size(700, 700);
  noStroke();
  noLoop();
}

void draw() {  
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  fill(clr[0]);
  drawRectWheel(220, 650, 3.3, 95, 95, 95);  
  rotate(PI);
  fill(clr[1]);
  drawRectWheel(220, 650, 3.3, 95, 95, 95);
  popMatrix();
  
  paper(20);
}

void drawRectWheel(float inDiam, float outDiam, float rectWidth, int countOfRect, float inDiamRndmz, float outDiamRndmz) {
  inDiam /= 2;
  outDiam /= 2;
  float angle = 0;
  float xx, yy;
  float wdthBuf = outDiam - inDiam;
  float step = radians(360./countOfRect);
 
  while (angle < TWO_PI) {      
    xx = cos(angle) * inDiam;
    yy = sin(angle) * inDiam;
    pushMatrix();
    translate(xx, yy);
    rotate(angle);
    angle+=step;
    float inDiamRndm  = random(0, inDiamRndmz);
    float outDiamRndm = random(-outDiamRndmz, 0);

    if (outDiamRndmz == 0) {
      rect(inDiamRndm, -rectWidth/2., wdthBuf - inDiamRndm, rectWidth);
    } else {
      rect(inDiamRndm, -rectWidth/2., wdthBuf + outDiamRndm - inDiamRndm, rectWidth);
    }
    popMatrix();
  }
}

void mousePressed() {
  redraw();
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i < width-1; i+=2) {
    for (int j = 0; j < height-1; j+=2) {
      fill(random(85-35, 85+35), in_val);
      rect(i, j, 2, 2);
    }
  }
  for (int i = 0; i < 20; i++) {
    fill(random(40, 60), random(in_val*2, in_val*2.5));
    rect(random(0, width), random(0, height), random(1, 3), random(1, 3));
  }
}

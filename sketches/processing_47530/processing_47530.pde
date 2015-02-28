
EllipseConnectDraw ellip1, ellip2, ellip3, ellip4;
boolean toggleLoop = true;

void setup() {
  size(500, 500);
  smooth();
  frameRate(10);

  ellip1 = new EllipseConnectDraw();
  ellip2 = new EllipseConnectDraw();
  ellip3 = new EllipseConnectDraw();
  ellip4 = new EllipseConnectDraw();
}

void draw() {
  ellip1.run();
  ellip2.run();
  ellip3.run();
  ellip4.run();
}


void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
}



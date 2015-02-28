
class DrawRect {

  int xloc, yloc;
  int mxpos, mypos;
  float angle;
  color rectFill,ellipseFill;
  DrawRect (int x, int y, int mX, int mY){
    rectFill = #ffffff;
    ellipseFill = #000000;
    xloc = x;
    yloc = y;
//    angle = a;
    mxpos = mX;
    mypos = mY;
  }
  void update(int mX, int mY) {
    mxpos = mX;
    mypos = mY;
    float h = dist(xloc, yloc, mxpos, mypos);
    float b = (xloc - mxpos);
    if (mousePressed){
    angle = acos(b/h);
    rectFill = #ffffff;
    ellipseFill = #000000;
    } else{
      angle = asin(b/h);
      rectFill = #000000;
    ellipseFill = #ffffff;
    }
    
  }
  void draw() {
    pushMatrix();
    translate(xloc,yloc);
    rotate(angle);
    rectMode (CENTER);
    noStroke();
    fill(rectFill);
    rect(0, 0, 50, 10);
    // ellipseMode(CENTER);
    fill(ellipseFill);
    ellipse(-17, 0, 8, 8);
    popMatrix();
  }
}



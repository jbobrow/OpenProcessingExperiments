
class notrect { //background decoration using transformations and matrices.
  float x1 = 45;
  float y1 = 100;
  float x2 = 100;
  float y2 = 100;
  float x3 = 136;
  float y3 = 278;
  float x4 = 68;
  float y4 = 175;
 
  void drawNotrect() {
    pushMatrix(); //prepare to reorient coordinate system.
    translate(width/2-300, height/2-400);
    fill(#5BB470);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    pushMatrix(); //nested reorientations.
    rotate(radians(-45));
    fill(#5BB470);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    popMatrix(); //restore coordinate system to previous state.
    pushMatrix();
    rotate(radians(45));
    fill(#5BB470);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    popMatrix();
    popMatrix();
  }
}



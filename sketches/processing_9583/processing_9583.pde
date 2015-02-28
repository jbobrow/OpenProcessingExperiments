
class foo {

  float x1, y1, z1, x2, y2, z2;
  foo(){  // constructor
    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
    z1 = 0;
    z2 = 0;
  }
  foo(float tempx1, float tempy1,  float tempz1, float tempx2, float tempy2, 
  float tempz2)
  {
    x1 = tempx1;
    y1 = tempy1;
    z1 = tempz1;
    x2 = tempx2;
    y2 = tempy2;
    z2 = tempz2;    
  }
  // methods pou epistrefoun ta stoixeia ths class


  float getX1() {
    return x1;
  }
  float getY1() {
    return y1;
  }
  float getZ1() {
    return z1;
  }
  float getX2() {
    return x2;
  }
  float getY2() {
    return y2;
  }
  
  float getZ2() {
    return z2;
  }


  public void drawFoo() {
    beginShape();

     vertex(x1, y1, z1);
     vertex(x2, y2, z2);
     bezierVertex(x1, y1, z1, x2, y2, z2);
     bezierVertex(x1, x2, y1, y2, z1, z2);
     bezierVertex(x2, y2, z2, x1, y1, z1);
     endShape();
 
  }


}


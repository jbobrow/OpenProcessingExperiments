
class Circle {
  int i, circleSize, y;
  float radiusOfCircle; 
  int strokeRed;
  int strokeGreen; 
  int strokeBlue; 
  int translatePosX; 
  float translatePosY; 
  int translatePosZ;
  float calm=0;
  Circle(float r, int r1, int g1, int b1, int tPosX, float tPosY, int tPosZ) {  

    this.radiusOfCircle=r; 
    this.strokeRed=r1; 
    this.strokeGreen=g1; 
    this.strokeBlue=b1; 
    this.translatePosX=tPosX; 
    this.translatePosY=tPosY; 
    this.translatePosZ=tPosZ;
  }
  void draw() {
//    println("radius of circle: "+radiusOfCircle);
    pushMatrix();
    translate(translatePosX, translatePosY, translatePosZ);
    rotateX(radians(90));

    noFill();
    stroke(strokeRed, strokeGreen, strokeBlue);
    ellipse(0, 0, radiusOfCircle, radiusOfCircle);
    popMatrix();
  }

//  void color(int updateR, int updateG, int updateB) {
//    stroke(updateR, updateG, updateB);
//  }
}  






class Ring { 

  Shape[] shapes;
  int shapesNumb, cen;
  float rad;
  float degree;


  Ring (int rectWidth, int rectHeight, int center, float radius, int numberOfShapes) {

    shapesNumb = numberOfShapes;
    cen = center;
    rad = radius;



    shapes = new Shape[shapesNumb];
    float x, y;
    float degAdd = 360/shapesNumb;
    float deg = 0; 

    for  ( int i = 0 ; i < shapesNumb ; i++) {

      float angle = radians(deg);
      x =  cen + (cos(angle) * rad);
      y =  cen + (sin(angle) * rad);

      shapes[i] = new Shape (x, y, rectWidth, rectHeight, deg);     

      deg += degAdd;
    }
  }

  void drawRing () {

    for  ( int i = 0 ; i < shapesNumb ; i++) {
      shapes[i].drawShape();
    }
  }

  void rotateRing ( float degreeOffset) {

    degree += degreeOffset;
    
    float x, y;
    float degAdd = 360/shapesNumb;
    float deg = degree; 

    for  ( int i = 0 ; i < shapesNumb ; i++) {

      float angle = radians(deg);
      x =  cen + (cos(angle) * rad);
      y =  cen + (sin(angle) * rad);

      shapes[i].moveShape(x, y);
      shapes[i].rotateShape(degreeOffset);

      deg += degAdd;
    }
  }

  void rotateShapes ( float degreeOffset) {  

    for  ( int i = 0 ; i < shapesNumb ; i++) {

      shapes[i].rotateShape(degreeOffset);
    }
  }


  class Shape {

    float rectW, rectH, deg;
    float x, y;

    Shape (float x, float y, int rectWidth, int rectHeight, float deg) {

      this.x = x;
      this.y = y;
      rectW = rectWidth;
      rectH = rectHeight;
      this.deg = deg;
    }

    void drawShape () {
      pushMatrix();
      translate(x, y);
      rotate (radians(deg));
      rect (0, 0, rectW, rectH);
      popMatrix();
    }

    void rotateShape (float degOffset) {
      deg += degOffset;
    }

    void changeDegree (float newDeg) {
      deg = newDeg;
    }

    void moveShape (float newX, float newY) {
      x = newX;
      y = newY;
    }
  }
}



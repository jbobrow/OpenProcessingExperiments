
void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  Shape s = new Shape();
  fill(0);
  for(int i = 0; i < width; i+=20) {
    for(int j = 0; j < height; j+=20) {
      int randomShape = round(random(5));
      s.drawShape(randomShape);
      translate(20, 0);
    }
    translate(-width, 20);
  }
}

class Shape {
  Shape() {}
  
  void drawShape(int randomShape) {
    switch(randomShape) {
      case 0:
        drawtl();
        break;
      case 1:
        drawtr();
        break;
      case 2: 
        drawbl();
        break;
      case 3:
        drawbr();
        break;
      case 4:
        drawBlackBox();
        break;
      case 5:
        break;
    }
  }
    void drawtl() {
      triangle(0, 0, 0, 20, 20, 0);
    }
    
    void drawtr() {
      triangle(0, 0, 20, 0, 20, 20);
    }
    
    void drawbl() {
      triangle(0, 0, 0, 20, 20, 20);
    }
    
    void drawbr() {
      triangle(20, 0, 0, 20, 20, 20); //bottom, right
    }
    
    void drawBlackBox() {
      rect(0, 0, 20, 20);
    }
  }



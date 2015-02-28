
void setup() {
  size(350, 550);
  background(255);
  stroke(255, 0, 0);
  smooth();
  frameRate(15);
}

void draw() {
  background(255);
  
  //top pt of triangle is defined by mouse position
  Triangle initiator = new Triangle(
    mouseX, mouseY, 
    50, .5*height, width-50, 
    .5*height, 3
  );
    
  initiator.draw();
}

public class Triangle {
  float x1, y1, x2, y2, x3, y3;
  int count;  //controls recursion depth

  public Triangle() {} //included b/c Processing complains

  public Triangle(float x1, float y1, float x2, float y2, float x3, float y3, int c) {
    this.x1 = x1; this.y1 = y1;
    this.x2 = x2; this.y2 = y2;
    this.x3 = x3; this.y3 = y3;
    count = c;
  }  

  public InvertedTriangle getInnerTriangle() {
    return new InvertedTriangle(
      (x1+x2)/2.0, (y1+y2)/2.0, 
      (x1+x3)/2.0, (y1+y3)/2.0, 
      (x2+x3)/2.0, (y2+y3)/2.0
    );
  }

  public void draw() {
    line(x1, y1, x2, y2); 
    line(x3, y3, x2, y2); 
    line(x1, y1, x3, y3);
    getInnerTriangle().draw();

    //stop recursive creation of additional, smaller triangles:
    if ( count == 0 ) return;
    
    Triangle t1 = new Triangle(x1, y1, (x1+x2)/2.0, (y1+y2)/2.0, (x1+x3)/2.0, (y1+y3)/2.0, count - 1);
    Triangle t2 = new Triangle(x2, y2, (x1+x2)/2.0, (y1+y2)/2.0, (x2+x3)/2.0, (y2+y3)/2.0, count - 1);
    Triangle t3 = new Triangle(x3, y3, (x1+x3)/2.0, (y1+y3)/2.0, (x2+x3)/2.0, (y2+y3)/2.0, count - 1);
    t1.draw();
    t2.draw();
    t3.draw();
  }
}

public class InvertedTriangle extends Triangle {

  public InvertedTriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
    this.x1 = x1; this.y1 = y1;
    this.x2 = x2; this.y2 = y2;
    this.x3 = x3; this.y3 = y3;
  }  

  public void draw() {
    fill(255, 0, 0);
    beginShape();
    vertex(x1, y1); 
    vertex(x2, y2); 
    vertex(x3, y3);
    endShape();
  }
}




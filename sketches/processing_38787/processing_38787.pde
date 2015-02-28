
import java.awt.geom.Point2D;

class Line {

  float x1;
  float y1;
  float x2;
  float y2;

  public Line(float _x1, float _y1, float _x2, float _y2) {
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
  }

  public Point2D.Float intersects(Line otherLine) {
    float x3 = otherLine.x1;
    float y3 = otherLine.y1;
    float x4 = otherLine.x2;
    float y4 = otherLine.y2;

    float d = (x1-x2)*(y3-y4) - (y1-y2)*(x3-x4);
    if (d == 0) return null;

    float xi = ((x3-x4)*(x1*y2-y1*x2)-(x1-x2)*(x3*y4-y3*x4))/d;
    float yi = ((y3-y4)*(x1*y2-y1*x2)-(y1-y2)*(x3*y4-y3*x4))/d;

    Point2D.Float p = new Point2D.Float(xi, yi);
    if (xi < Math.min(x1, x2) || xi > Math.max(x1, x2)) return null;
    if (xi < Math.min(x3, x4) || xi > Math.max(x3, x4)) return null;
    return p;
    /*    float resX = ((x1*y2 - y1*x2)*(x3-x4) - (x1-x2)*(x3*y4 - y3*x4)) / 
     ( (x1-x2)*(y3 -y4) - (y1-y2)*(x3-x4));
     
     float resY = ((x1*y2 - y1*x2)*(y3-y4) - (y1-y2)*(x3*y4 - y3*x4)) / 
     ( (x1-x2)*(y3 -y4) - (y1-y2)*(x3-x4));
     
     return new Point2D.Float(resX, resY);
     */
  }

  public void draw() {
    line(x1, y1, x2, y2);
  }
}


Line lineA = new Line(0, 0, 400, 300);
Line lineB = new Line(500, 100, 100, 500);

void setup() {  //setup function called initially, only once
  size(800, 600);
  frameRate(30);
  smooth();

  background(255);  //set background white
}



private int lineSelected = 1;

void keyPressed() {
  if (key=='1') {
    print("1 pressed ");
    lineSelected = 1;
  }
  if (key=='2') {
    print("2 pressed ");
    lineSelected = 2;
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    if (lineSelected==1) {
      lineA.x1 = mouseX;
      lineA.y1 = mouseY;
    }
    else {
      lineB.x1 = mouseX;
      lineB.y1 = mouseY;
    }
  }
  else {
    if (lineSelected==1) {
      lineA.x2 = mouseX;
      lineA.y2 = mouseY;
    }
    else {
      lineB.x2 = mouseX;
      lineB.y2 = mouseY;
    }
  }
}

void draw() {  //draw function loops

  background(255);

  stroke(100, 150, 250);
  lineA.draw();

  stroke(250, 150, 100);
  lineB.draw();

  Point2D.Float pointIntersection = lineA.intersects(lineB);
  if ( pointIntersection != null ) {
    stroke(20, 20, 20);
    ellipse( (float)pointIntersection.getX(), (float)pointIntersection.getY(), 5, 5);
  }

  //line(s1.x,s1.y,s2.x, s2.y);
}



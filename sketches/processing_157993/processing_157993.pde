
Spline[] s = new Spline[40];

void setup() {
  size(800, 400);
  float div = height/s.length;
  int yPos=0;
  for (int i=0;i<s.length;i++) {
    s[i]= new Spline(80, yPos+=div);
  }
}

void draw() {
  background(255);
  for (int i=0;i<s.length;i++) {
    s[i].render();
  }
}

class Spline {
  int yPos;
  PointBuffer points;

  public Spline(int size, int yPos) {
    this.yPos = yPos;
    points = new PointBuffer(size);

    float div = width/size;
    for (int i=0;i<width;i+=div) {
      points.add(i, yPos);
    }
  }

  public void render() {
    beginShape(); 
    for (int i=0;i<points.getSize();i++) {
      if (dist( mouseX, mouseY, points.point[i].x, points.point[i].y) < 100 && mousePressed ) {
        float yDist = mouseY - points.point[i].y;
        float yMove = map(yDist, 0, 50, 0, 5);
        points.point[i].y -= yMove;
      }
      else {
        float yDist = yPos - points.point[i].y;
        float yMove = map(yDist, 0, 50, 0, 1);
        points.point[i].y += yMove;
      }
      stroke(0);
      strokeWeight(0.1);
      noFill();
      
      curveVertex( points.point[i].x, points.point[i].y);

    }
    endShape();
  }
}

class PointBuffer {
  int ptr;
  Point[] point;

  public PointBuffer(int size) {

    this.point = new Point[size];

    for (int i=0;i<point.length;i++) {
      point[i] = new Point(0, 0);
    }
    ptr=0;
  }
  public void add(float x, float y) {
    if (ptr >point.length-1) {
      ptr=0;
    }

    point[ptr] = new Point(x, y); 

    ptr++;
  }
  public int getSize() {
    return point.length;
  }
}

class Point {
  public float x=0;
  public float y=0;
  public Point(float x, float y) {
    this.x=x;
    this.y=y;
  }
}


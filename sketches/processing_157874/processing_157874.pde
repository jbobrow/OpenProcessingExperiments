
PointBuffer pointBuffer = new PointBuffer(50);
float x=0, y=0;
void setup() {
  size(800, 400);
  y=height/2;
}
float a=0;
float amp=0;
float ampInc=0.1;

void draw() {
  //rotate( radians(a++) );
  background(255);
  int bufferSize = pointBuffer.getSize();
  noStroke();
  fill(200, 30, 0, 80);
  for (int i=0;i<pointBuffer.getSize();i++) {
    ellipse(pointBuffer.point[i].x, pointBuffer.point[i].y, 10, 10);
  }

  if (amp > 100 || amp < 0) {
    ampInc*=(-1);
  }
    amp+=ampInc;
  if (x>width) {
    x=0;
  }

  pointBuffer.add(x+=amp, y+sin(x/10)*amp);
}

void mouseMoved() {
  //pointBuffer.add(mouseX, mouseY);
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


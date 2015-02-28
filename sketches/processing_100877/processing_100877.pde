

Point[] p = new Point[30];
Link link;

void setup() {
  size(680, 680);
  stroke(255, 100);

  for (int i = 0; i < p.length; i++) {
    p[i] = new Point();
  }
  link = new Link(p);
}

void draw() {
  background(255);

  link.display();
}

class Point {
  float x;
  float y;
  float lastX;
  float lastY;
  float nextX;
  float nextY;
  float velX;
  float velY;

  Point() {
  }
  
  void move(boolean pinToMouse) {
    if (pinToMouse == false) {
      velX = x - lastX;
      velY = y - lastY;

      velX *= .97;
      velY *= .97;

      nextX = x + velX;
      nextY = y + velY + .1;

      lastX = x;
      lastY = y;

      x = nextX;
      y = nextY;
    }  
    else {
      x = mouseX;
      y = mouseY;
    }
  }
}

class Link {
  float restingDistance = 2;
  float[] diffX;
  float[] diffY;
  float[] distance;
  float[] difference;
  float[] translateX;
  float[] translateY;
  Point[] p;

  Link(Point[] point) {
    p = point;
    diffX = new float[p.length];
    diffY = new float[p.length];
    distance = new float[p.length];
    difference = new float[p.length];
    translateX = new float[p.length];
    translateY = new float[p.length];
  }
  void solve() {
    for (int i = 0; i < p.length-1; i++) {
      // calculate the distance
      diffX[i] = p[i].x - p[i+1].x;
      diffY[i] = p[i].y - p[i+1].y;
      distance[i] = sqrt(diffX[i] * diffX[i] + diffY[i] * diffY[i]) ;

      // difference scalar
      difference[i] = (restingDistance - distance[i]) / distance[i];
      
      // translation for each Point. They'll be pushed 1/2 the required distance to match their resting distances.
      translateX[i] = diffX[i] * 0.5 * difference[i];
      translateY[i] = diffY[i] * 0.5 * difference[i];

      p[i].x += translateX[i];
      p[i].y += translateY[i];

      p[i+1].x -= translateX[i];
      p[i+1].y -= translateY[i];
    }
  }

  void display() {
    p[0].move(true);  //  pinToMouse = true for the first point
    for (int i = 1; i < p.length; i++) {
        p[i].move(false);
    }
    solve();
    for (int i = 0; i < p.length-1; i++) {
      stroke(0);
      line(p[i].x, p[i].y, p[i+1].x, p[i+1].y);
      noStroke();
      fill(0);
      ellipse(p[i].x, p[i].y, 2, 2);
      ellipse(p[i+1].x, p[i+1].y, 2, 2);
    }
    ellipse(p[p.length-1].x, p[p.length-1].y, 20, 20);
  }
}





Point[] p = new Point[20];
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
  
  void move(boolean isDynamic, boolean isFixed) {
    if (isDynamic == true) {
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
    } else if (isFixed == true) {
      x = 340;
      y = 340;
    } else {
      x = mouseX;
      y = mouseY;
    }
  }
}

class Link {
  float restingDistance = 20;
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
    p[0].move(false, true);// isDynamic = false for the first point  because it is fixed
    for (int i = 1; i < p.length-1; i++) {
        p[i].move(true, false);
    }
    p[p.length - 1].move(false, false);  //  isDynamic = false for the last point
    solve();
    for (int i = 0; i < p.length-1; i++) {
      if (i % 2 == 1) {
        stroke(color(255,255,255));
      } else {
        stroke(color(0,0,255));
      }
      strokeCap(SQUARE);
      strokeWeight(3);
      line(p[i].x, p[i].y, p[i+1].x, p[i+1].y);
      // if points have a dimension, the chain comes to rest stretched by this dimension for each link
      //noStroke();
      //fill(color(255,255,255));
      //ellipse(p[i].x, p[i].y, 0, 0);
      //ellipse(p[i+1].x, p[i+1].y, 0, 0);
    }
    // no need for the ball on the end of the chain
    //ellipse(p[p.length-1].x, p[p.length-1].y, 3, 3);
  }
}

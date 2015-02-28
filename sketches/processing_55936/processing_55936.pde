
int n = 10;
float t = 0;
float dt = 0.01;

class Point {
  public float ix, iy, imr, imt;
  public float x, y;
  public float mr, mt;
  public float fx, fy, fmr, fmt;
  public float rx, ry, rmr, rmt;
  
  public Point() {
    x = ix = random(-width/3, width/3);
    y = iy = random(-height/3, height/3);
    
    mr = imr = random(0, 50);
    mt = imt = random(0, 2 * PI);
    
    fx = random(0.2, 3);
    fy = random(0.1, 2);
    fmr = random(0.5, 5);
    fmt = random(0.7, 4);
    
    rx = random(50, 80);
    ry = random(50, 200);
    rmr = random(20, 50);
    rmt = random(0, 2 * PI);
  }
  
  public void calc(float t) {
    x = ix + rx * sin(fx * t);
    y = iy + rx * cos(fx * t + 1.1 * cos(t + rmt));
    mr = imr + rmr * sin(fmr * t);
    mt = imt + rmt * sin(fmt * t + cos(fmt * t + rmt));
  }
}

class Bezier {
  Point[] points;
  
  public Bezier(int n) {
    points = new Point[n];
    
    int i;
    for (i = 0; i < points.length; i++) {
      points[i] = new Point();
    }
  }
  
  public void draw(float t) {
    int i;
    float ax, ay, bx, by, mat, mar, mbt, mbr;
    
    for (i = 0; i < points.length; i++) {
      points[i].calc(t);
    }
    
    for (i = 0; i < points.length; i++) {
      stroke(i * 360 / points.length, 40, 95, 150);
        
      int next = (i + 1) % points.length;
    
      ax = points[i].x;
      ay = points[i].y;
      bx = points[next].x;
      by = points[next].y;
    
      mar = points[i].mr;
      mat = points[i].mt;
      mbr = points[next].mr;
      mbt = points[next].mt + PI;
      
      float x2, y2, x3, y3, xx, yy;
      
      //noStroke();
      bezier(
        ax,
        ay,
        x2 = ax + mar * cos(mat),
        y2 = ay + mar * sin(mat),
        x3 = bx + mbr * cos(mbt),
        y3 = by + mbr * sin(mbt),
        bx,
        by
      );
      
      fill(i * 360 / points.length - 130, 30, 95, 180);
      noStroke();
      
      xx = bezierPoint(ax, x2, x3, bx, t % 1);
      yy = bezierPoint(ay, y2, y3, by, t % 1);
      float tx = bezierTangent(ax, x2, x3, bx, t % 1);
      float ty = bezierTangent(ay, y2, y3, by, t % 1);
      float ta = atan2(ty, tx);
      float ta1 = ta + 0.5 * (cos(mbr * t / 2) + 1);
      float ta2 = ta - 0.5 * (cos(mbr * t / 2) + 1) + 2 * PI;
      float rr;
      arc(xx, yy, rr = 15 + 10 * sin(t / 24), rr, ta1, ta2);
      
      fill(0, 0, 100, 40);
      ellipse(points[i].ix, points[i].iy, 10, 10);
      stroke(0, 0, 100, 40);
      line(points[i].ix, points[i].iy, points[i].x, points[i].y);
      line(ax, ay, x2, y2);
      line(bx, by, x3, y3);
      
      noFill();
    }
  }
}

Bezier be; 

void setup() {
  size(450, 450);
  
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  
  stroke(120, 100, 100, 150);
  strokeWeight(1);  
  
  be = new Bezier(40);
  
  //noLoop();
}

void draw() {
  fill(0, 0, 0, 250);
  rect(0, 0, width, height);
  
  noFill();

  randomSeed(117);
  
  translate(width / 2, height / 2);
  rotate(PI/ 10 * t);

  be.draw(t);  
  
  t += dt;
}



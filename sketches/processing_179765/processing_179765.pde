
/* Polygonal rings
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */

float tension;
ArrayList<PVector> points;
PVector[] p;
ArrayList<Polygon> poly_list;
boolean display_control;

void setup() {
  size(700, 500);
  background(40);
  noFill();
  noLoop();
  stroke(255);
  tension = 30;
  points = new ArrayList<PVector>();
  poly_list = new ArrayList<Polygon>();
  display_control = true;
}

PVector[] get_rand_points(int num) {
  PVector[] ret = new PVector[num];
  for (int i = 0; i < num; i++) {
    ret[i] = new PVector(random(width), random(height));
  }
  return ret; 
}

class Polygon {
  PVector[] pts;
  
  Polygon(PVector[] pts) {
    this.pts = pts;
  }
  
  PVector midpoint(PVector p1, PVector p2) {
    return new PVector((p2.x + p1.x) / 2, (p2.y + p1.y) / 2);
  }
  
  PVector scale_distance(PVector p1, PVector p2, float scalar) {
    float d = PVector.dist(p1, p2);
    float cos_angle = acos((p2.x - p1.x) / d);
    float sin_angle = asin((p2.y - p1.y) / d);
    return new PVector(p1.x + scalar * cos(cos_angle), 
                       p1.y + scalar * sin(sin_angle));
  }
  
  float smallest_dim(PVector[] p) {
    float best = -1;
    for (int i = 0; i < p.length - 1; i++) {
      for (int j = i + 1; j < p.length; j++) {
        if (best < 0 || PVector.dist(p[i], p[j]) < best) {
          best = PVector.dist(p[i], p[j]);
        }
      }
    } 
    return best;
  }
  
  void rounded_draw() {
    PVector[] p = this.pts;
    while (smallest_dim(p) > 20) {
      p = _rounded_draw(p); 
    }
  }
  
  PVector[] _rounded_draw(PVector[] p) {
    PVector[] res = new PVector[p.length];
    
    if (display_control) {
      stroke(100);
      beginShape();
      for (PVector vec : p) {
        vertex(vec.x, vec.y); 
      }
      endShape(CLOSE);
    }
    
    stroke(255);
    beginShape();
    PVector first_pt = midpoint(p[p.length - 1], p[0]);
    vertex(midpoint(p[p.length - 1], p[0]).x, midpoint(p[p.length - 1], p[0]).y);
    for (int i = 0; i < p.length; i++) {
      float k = min(PVector.dist(p[i], p[(i + 1) % p.length]),
                    PVector.dist(p[i], p[(i + p.length - 1) % p.length]))/100 * tension;
      PVector pt = midpoint(p[i], p[(i + 1) % p.length]);
      PVector c1 = scale_distance(midpoint(p[i], p[(i + p.length - 1) % p.length]),
                                  p[i], k);
      PVector c2 = scale_distance(pt, p[i], k);
      res[i] = midpoint(c1, c2);
      bezierVertex(c1.x, c1.y, c2.x, c2.y, pt.x, pt.y);
    }
    endShape(CLOSE);
    
    if (display_control) {
      stroke(100);
      for (int i = 0; i < p.length; i++) {
        float k = min(PVector.dist(p[i], p[(i + 1) % p.length]),
                      PVector.dist(p[i], p[(i + p.length - 1) % p.length]))/100 * tension;
        PVector pt = midpoint(p[i], p[(i + 1) % p.length]);
        PVector c1 = scale_distance(midpoint(p[i], p[(i + p.length - 1) % p.length]),
                                    p[i], k);
        PVector c2 = scale_distance(pt, p[i], k);
        ellipse(c1.x, c1.y, 5, 5);
        ellipse(c2.x, c2.y, 5, 5);
      }
    }
    return res;
  }
}
  
void draw() {
  background(40);
  stroke(255);
  for (PVector v : points) {
    ellipse(v.x, v.y, 5, 5);
  }
  for (Polygon p : poly_list) {
    p.rounded_draw();
  }
}

void mousePressed() {
  points.add(new PVector(mouseX, mouseY));
  redraw();
}

void keyPressed() {
  if (key == 'd') {
    display_control = !display_control;
    redraw();
    return;
  } else if (key == ' ') {
    poly_list.clear();
    redraw();
    return;
  } else if (key == 'r') {
    p = get_rand_points((int) random(3, 6)); 
  } else {
    p = points.toArray(new PVector[points.size()]);
  }
  points.clear();
  poly_list.add(new Polygon(p));
  redraw();
}


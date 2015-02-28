
ArrayList points;
float t = 0;
float dt0 = 0.003;
float dt = dt0;
int rows = 30;
int mode = 0;

class Point {
  float r, a;
  float x, y;
  float d;
  
  Point(int n) {
    //x = map(n / rows, 0, rows, -1, 1) ;
    //y = map(n % rows, 0, rows, -1, 1);
    r = random(0, 1);
    a = random(0, 2 * PI);

    d = 0;
  }
  
  void draw() {
    //float xx = map(x*cos(y*t - cos(t*x)), -1, 1, 0, width);
    //float yy = map(y*cos(x*t - cos(t*y)), -1, 1, 0, height);
    
    calcxy();
    float xx = map(
      x
      , -1, 1, 0, width);
    float yy = map(
      y
      , -1, 1, 0, height);
    d = 1.5 + 2 * r * abs(cos(a + 10 * t));
    
    float col = 0;
    if (dist(mouseX, mouseY, xx, yy) < 40)
      col = 0;
    else
      col = dist(width / 2, height / 2, mouseX, mouseY) / dist(width / 2, height / 2, width, height);
    
    fill((a + 3 * t) % (2 * PI),
      col,
      1,
      0.3
    );
    
    ellipse(xx, yy, d, d);
    //set((int) xx, (int) yy, color(0, 0, 1, 0.1));
  }
  
  void calcxy() {
    switch (mode) {
      case 1:  // Spin
        x = r * cos(a * t);
        y = r * sin(a);
        break;
    
      case 2:  // Potter
        x = r * cos(a * t);
        y = r * sin(a * t);
        break;
    
      case 3:  // Galaxy
        x = r * cos(a * t);
        y = r * t * sin(a * t);
        break;

      case 4:  // Galaxy 2
        x = r * t * cos(a * t);
        y = r * t * sin(a * t);
        break;

      case 5:  // Laser
        x = r * sin(a * t);
        y = r * t * sin(a * t);
        break;
        
      case 6: // Separate
        x = a * sin(r * t);
        y = r * t * sin(a * t);
        break;

      case 7: // Lipats
        x = r * sin(a * t);
        y = r * cos(r * t);
        break;

      case 8: // Spiral
        x = a * sin(a * t);
        y = a * cos(a * t);
        break;

      case 9: // Mboh
        x = a * tan(a * t);
        y = r * cos(a * t);
        break;

      case 10: // 
        x = a * tan(r * t);
        y = r * tan(a * t);
        break;

      case 11: // Plus
        x = r * tan(r * t);
        y = a * tan(a * t);
        break;

      case 12: // Potter 2
        x = r * cos(a + t);
        y = r * sin(a + t);
        break;
        
      case 13: // Galaxy 3
        x = r * t * cos(a + t);
        y = r * t * sin(a + t);
        break;

      case 14: // Galaxy 4
        x = r * exp(t) * cos(a + t);
        y = r * t * sin(a + t);
        break;

      case 15: // Shrink
        x = r * exp(cos(t)) * cos(a + t);
        y = r * exp(cos(t)) * sin(a + t);
        break;

      case 16: // Opo iki
        x = r * (tan(t)) * cos(a + t);
        y = (tan(r * t)) * sin(a + t);
        break;

      case 17: // Krucud
        x = r * cos(a + t);
        y = r * atan(a + t);
        break;

      case 18: 
        x = a * asin(r + tan(t)) * cos(a + t);
        y = r * atan(a + tan(t)) * sin(a + t);
        break;

      case 19: // 
        x = r * cos(14 * (a + t));
        y = r * sin(3 * (a + t));
        break;

      case 20: 
        x = r * cos(exp(cos(a + t)));
        y = r * sin(3 * cos(exp(a + t)));
        break;

      case 21: // 
        x = r * cos((a + t));
        y = r * tan(asin(a * log(t)));
        break;

      case 22: // 
        x = r * tan(a + t);
        y = r * log(t);
        break;

      case 23: // 
        x = r * tan(a + t);
        y = r * tan(a + 3 * t);
        break;

      case 24: // 
        x = r * tan(a + t);
        y = r * tan(3 * (a + t));
        break;

      case 25: // 
        x = r * tan((a + t));
        y = r * tan(cos(a + t));
        break;

      case 26: // 
        x = r * tan(sin(a + t));
        y = r * tan(cos(a + t));
        break;

      case 27: // 
        x = r * tan(a + cos(t));
        y = r * tan((a + t));
        break;

      case 28: // 
        x = r * tan(a + cos(t));
        y = r * cos(a + t + sin(t));
        break;

      default: // 
        x = r * cos(tan(a + exp(t)));
        y = r * sin(log(a + tan(t)));
        break;

    }
  }
}

void setup() {
  size(400, 400);
  colorMode(HSB, 2 * PI, 1, 1, 1);
  smooth();  
  background(0, 0, 0);
  
  noStroke();
  
  points = new ArrayList();
  for (int i = 0; i < rows * rows; i++) {
    points.add(new Point(i));
  }
}

void draw() {
  clear();
  //fill(120, 0, 1, 0.3);
  
  for (int i = 0; i < points.size(); i++) {
    Point p = (Point) points.get(i);
    
    p.draw();
  }
  
  t += dt;
  dt *= 1.001;
}

void clear() {
  fill(0, 0, 0, 0.03);
  rect(0, 0, width, height);
}

void mousePressed() {
  if (mouseButton == LEFT) mode --;
  else mode ++;
  
  if (mode < 0) mode = 29;
  if (mode > 29) mode = 0;
  
  t = 0;
  dt = dt0;
}



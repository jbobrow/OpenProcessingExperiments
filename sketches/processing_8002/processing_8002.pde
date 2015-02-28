

float ax = 50;   // 1st point x
float ay = 50;   // 1st point y
float bx = 200;  // 2nd point x
float by = 300;  // 2nd point y

float cx = 350;  // 3rd point x
float cy = 80;   // 3rd point y
float dx;        // 4th point x
float dy;        // 4th point y

void setup() {
  size(400, 400); 
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  background(204);

  dx = mouseX;
  dy = mouseY;

  if (lineLineIntersect(ax, ay, bx, by, cx, cy, dx, dy) == true) {
    stroke(255); 
  } else {
    stroke(0); 
  }

  line(ax, ay, bx, by);
  line(cx, cy, dx, dy);
}

boolean lineLineIntersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4 ) {
  boolean over = false;
  float a1 = y2 - y1;
  float b1 = x1 - x2;
  float c1 = a1*x1 + b1*y1;

  float a2 = y4 - y3;
  float b2 = x3 - x4;
  float c2 = a2*x3 + b2*y3;

  float det = a1*b2 - a2*b1;
  if(det == 0){
    // Lines are parallel
  } 
  else {
    float x = (b2*c1 - b1*c2)/det;
    float y = (a1*c2 - a2*c1)/det;
    if(x > min(x1, x2) && x < max(x1, x2) && 
       x > min(x3, x4) && x < max(x3, x4) &&
       y > min(y1, y2) && y < max(y1, y2) &&
       y > min(y3, y4) && y < max(y3, y4)){
      over = true; 
    }
  }
  return over;
}





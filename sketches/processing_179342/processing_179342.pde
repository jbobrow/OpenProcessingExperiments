
/* Simple 2D tree generation
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */

float bg_color = 255;
color fg_color = color(20);

float d3 = PI/32;
float lr = 1.109; /* elongation rate */
float vr = 1.732; /* width increase rate */

class Point {
  float x;
  float y;
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

Point forward(float x, float y, float l, float a, float r, float w) {
  float target_x = x + (l * cos(a)) ;
  float target_y = y + l * sin(a);
  strokeWeight(w);
  line(x, y, target_x, target_y);
  return new Point(target_x, target_y);
}

void branch(float x, float y, float l, float a, float r, float w, float d1, float d2) {
  if (w > random(0.5, 0.8)) {
    w /= vr ;
    l /= lr;
    Point target = forward(x, y, l * random(.6, 1), a, r, w);
    float choice = random(0, 1);
    if (choice > 0.1) {
      branch(target.x, target.y, l, a + random(d3, d2), r + random(2 * PI), w, d1, d2);
    }
    if (choice > 0.5) {   
      branch(target.x, target.y, l, a + random(d1, -d3), r + random(2 * PI), w, d1, d2);
    }
    branch(target.x, target.y, l, a, r, w, d1, d2);
  }
}

void setup() {
  size(800,600);
  background(bg_color);
  noLoop();
  float startW = random(5,35);
  float startL = random(30,120);
  float startA = -PI/2 + radians(random(-20,20));
  float startR = -PI/2;
  branch(width/2, height - 100, startL, startA, startR, startW, -PI/4, PI/4); 
}

void draw() {
}

void mousePressed() {
  fill(bg_color, 30);
  noStroke();
  rect(0, 0, width, height);
  stroke(fg_color);
  branch(mouseX, mouseY, random(60,120), -PI/2 + radians(random(-10,10)), -PI/2, random(10,35), random(-PI/2, 0), random(0, PI/2)); 
  redraw();
}

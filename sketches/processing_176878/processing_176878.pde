
ArrayList<Pattern> myPattern;
int maxPattern = 1;
 
void setup() {
  size (864, 864);
  myPattern = new ArrayList<Pattern>();
}
 
void draw() {
 
  background(255);
 
  for (int i=0; i<maxPattern; i++) {
    float rx = random(width);
    float rtheta = random(PI);
    float rl = random(10, 20);
    myPattern.add( new Pattern(rx, -100, rtheta, rl));
  } 
 
  for (int i=0; i<maxPattern; i++) {
    Pattern ithPattern = myPattern.get(i);
    ithPattern.addForce(0, 0.1);
 
    //handle collisions
    for (int j=0; j<i; j++) {
      Pattern jthPattern = myPattern.get(j);
 
      if (jthPattern.py >= ithPattern.py) {
 
        float jx = jthPattern.px;
        float jy = jthPattern.py;
        float ix = ithPattern.px;
        float iy = ithPattern.py;
        float distance = sqrt((jy-iy)*(jy-iy) + (jx-ix)*(jx-ix));
 
        //radius of pattern
        if (distance < (jthPattern.l*2.6 + ithPattern.l*2.6)) {
          myPattern.get(i).addForce(0, 0);
          ithPattern.vy = 0;
        }
      }
    }
 
    ithPattern.update();
    ithPattern.render();
  }
 
  if (maxPattern < 400) {
    maxPattern ++;
  }
}
 
//=========================================================================
 
 
class Pattern {
  float l;
  float ptheta;
  float px;
  float py;
  float vx;
  float vy;
 
  //constructor for Pattern
  Pattern(float x, float y, float theta, float rl) {
    ptheta = theta;
    px = x;
    py = y;
    l = rl;
  }
 
  // Add a force in. One step of Euler integration.
  void addForce (float fx, float fy) {
    float ax = fx;
    float ay = fy;
    vx += ax;
    vy += ay;
  }
 
  void update() {
    px += vx;
    py += vy;
    if (py > height) { //land
      py = height;
    }
  }
 
  void render() {
    pushMatrix();
    translate(px, py);
    rotate(ptheta);
    noFill();
    strokeWeight(1);
    line(-l, 0, -l/2, round(-0.866*l));
    line(-l/2, round(-0.866*l), l/2, round(-0.866*l));
    line(l/2, round(-0.866*l), l, 0);
    line(l, 0, l/2, round(l*0.866));
    line(l/2, round(l*0.866), -l/2, round(l*0.866));
    line(-l/2, round(l*0.866), -l, 0);
    for (int i = 0; i < 6; i++) {
      rotate(PI/3);
      rect(-l/2, 3*l/2, l, l/2);
    }
    popMatrix();
  }
}


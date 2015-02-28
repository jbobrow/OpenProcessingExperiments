
/*
 * Lorenz Attractor
 * by Rick Companje, 5 december 2008, for Processing 1.0.1
 * based on a Processing sketch by Sunghun Kim
 * showing the noninear diferential equation described by Lorenz, E. N. (1963). "Deterministic nonperiodic flow". J. Atmos. Sci. 20: 130-141.
 * the Lorenz atractor is generated by the following noninear diferential equations:
 *   dx/dt = s ( y - x )
 *   dy/dt = r x - y - xz
 *   dz/dt = xy - b z
 */

PVector v = new PVector(0,0,0);
PVector s = new PVector(.1,0,0);

float dt = 0.01;
float sigma = 10;
float beta = 8.0 / 3.0;
float rohm = 28;
int c=1;

void setup() {
  size(400, 400, P3D);
  background(0);
  colorMode(HSB,255);
  noStroke();
}

void draw() {
  fill(0,0,0,1);
  rect(-width/2, -height/2, width, height);
  lights();
  camera(0,0,80, 0,0,0, 0,1,0);
  
  v.x = sigma * (s.y - s.x);
  v.y = s.x * (rohm - s.z) - s.y;
  v.z = s.x * s.y - beta * s.z;
  v.mult(dt);        
  s.add(v);
   
  pushMatrix();
    fill(c++%255, 255, 255, 200);
    translate(s.x, s.y, s.z);
    sphere(2);
  popMatrix();
}

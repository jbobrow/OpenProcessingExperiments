
PVector v = new PVector(0,0,0);
PVector s = new PVector(.1,0,0);
 
float dt = 0.005;
float sigma = 10;
float b = 10.0 / 5.0;
float rohm = 35;
int c=100;
 
void setup() {
  size(500, 375, P3D);
  background(0);
  frameRate(600);
}
 
void draw() {
  lights();
  camera(0, 0, 100, 0, 10, 10, 1, -1, 1);
   
  v.x = sigma * (s.y - s.x);
  v.y = s.x * (rohm - s.z) - s.y;
  v.z = s.x * s.y - b * s.z;
  v.mult(dt);       
  s.add(v);
    
  pushMatrix();
    translate(s.x, s.y, s.z);
    stroke(138, 19, 217);
    point(0.1, 0.1);
  popMatrix();
}


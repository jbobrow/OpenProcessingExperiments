
Bug[] orecuho = new Bug[400];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  for (int i=0; i<orecuho.length; i++) {
    float x = width/2 + cos(i/1.5) * i ;
    float y = height/2 + sin(i/1.5) * i ;
    orecuho[i] = new Bug(x, y, 0.04 + (i/2000.0) );
  }
}
void draw() {
  background(#192355);

  for (int i=0; i<orecuho.length; i++) {
    fill(255,map(i,0,200,0,255));
    orecuho[i].live();
  }
}
class Bug {
  float x;
  float y;
  
  float t;
  float speed;
  float calpha;
   
  Bug(float tx, float ty, float tspeed) {
    x = tx;
    y = ty;
    t = 0;
    speed = tspeed;
  }

  void live() {
    float sz = map(sin(t), -1, 1, 10, 20);
    ellipse(x, y, sz, sz);
    t = t + speed;
  }  
}

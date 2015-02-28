
float t = 0, dt = 0.01;

float ampsize = 0;
boolean ampwait =  false;

class Wave {
  float x, y;
  float amp;
  float it;
  
  Wave(float xx, float yy, float aa, float st) {
    x = xx;
    y = yy;
    amp = aa;
    
    it = st;
  }
  
  float get(float px, float py) {
    float r = dist(x, y, px, py);
    
    float ph = 75 * (t - it) - r / 8;
    
    return amp * sin(ph) / ph;
  }
  
  float geta(float px, float py) {
    float a = atan2(px - x, py - y);
    
    return a;
  }
}

ArrayList waves;

void setup() {
  size(400, 400);
  colorMode(HSB, TWO_PI, 1.0, 1.0, 1.0);
  background(0);
  smooth();
  
  waves = new ArrayList();
}

void draw() {
  
  int k = 0;
  while (k < waves.size()) {
    Wave w = (Wave) waves.get(k);
    
    if (t - w.it > 2) waves.remove(k);
    
    k ++;
  }
    
  randomSeed(131);
  
  clear();
  for (int i = 0; i < 5000; i++) {
    particle();
  }
  
  if (ampwait) ampsize ++;
  
  t += dt;
}

void particle() {
  float x = random(0, width);
  float y = random(0, height);
  
  float px = x;
  float py = y;
  float pz = 1;
  
  for(int i = 0; i < waves.size(); i++) {
    Wave w = (Wave) waves.get(i);
    
    float ph = w.get(x, y);
    float a = w.geta(x, y);
    
    px += ph * cos(a);
    py += ph * sin(a);
    pz += ph;
  }
  
  fill(map(x + y, 0, width + height, 0, TWO_PI), 0.7, 1);
  noStroke();
  ellipse(px, py, pz, pz);
}

void clear() {
  fill(0, 0, 0, 0.2);
  rect(0, 0, width, height);
}

void mousePressed() {
  ampsize = 5;
  ampwait = true;
}

void mouseReleased() {
  ampwait = false;
  
  waves.add(new Wave(mouseX, mouseY, ampsize, t));
}


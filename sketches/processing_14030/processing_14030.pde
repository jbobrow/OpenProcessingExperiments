
float t = 0, dt = 0.05;
float kz = 0;

float mt = 0;

float mx, my;

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
    
    float ph = 15 * ((t - it - 0.1) - r);
    
    return amp * sin(ph) / ph;
  }
  
  float geta(float px, float py) {
    //float a = atan2(py - y, px - x);
    float a = atan2(px - x, y - py);
    
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
  /*translate(width / 2, height / 2);
  rotate(t);*/
  
  int k = 0;
  while (k < waves.size()) {
    Wave w = (Wave) waves.get(k);
    
    if (t - w.it > 4) waves.remove(k);
    
    k ++;
  }
  
  mx = map(mouseX, 0, width, -1, 1);
  my = map(mouseY, 0, height, -1, 1);
    
  randomSeed(131);
  
  clear();
  for (int i = 0; i < 1000; i++) {
    particle();
  }
  
  if (ampwait) ampsize += 0.01;
  
  t += dt;
  mt += dt;
  
  if (mt > 2.1) {
    mt = 0;

    randomSeed((int) (cos(t) * 1000));
    waves.add(new Wave(
      random(-1, 1),
      random(-1, 1),
      random(0.005, 0.01),
      t
    ));
  }
}

void particle() {
  float ar = random(0, 0.1);
  float aa = random(0, TWO_PI);
  float af = random(0, 5);
  
  float x = random(-1, 1) + ar * cos(aa + af * t);
  float y = random(-1, 1) + ar * sin(aa + af * t);
  float z = 1;
  
  for(int i = 0; i < waves.size(); i++) {
    Wave w = (Wave) waves.get(i);
    
    float h = w.get(x, y);
    float a = w.geta(x, y);
    
    x += h * cos(a);
    y += h * sin(a);
    z += h;
  }
  
  float px = map(x, -1, 1, 0, width);
  float py = map(y, -1, 1, 0, height);
  float pz = random(3, 45);
  
  //pz = random(1,10);
  
  float alph = dist(mx, my, x, y) / 8;
  
  stroke(atan2(y, x) + PI, 0.7, 0, alph);
  //noStroke();
  noFill();
  ellipse(px, py, pz, pz);
}

void clear() {
  fill(0, 0, 1, 0.2);
  rect(0, 0, width, height);
}

void mousePressed() {
  ampsize = 0.02;
  ampwait = true;
}

void mouseReleased() {
  ampwait = false;
  
  waves.add(new Wave(
    map(mouseX, 0, width, -1, 1), 
    map(mouseY, 0, height, -1, 1),
    ampsize, t));
}


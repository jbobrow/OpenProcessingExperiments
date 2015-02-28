
ArrayList<Earthworm> Earthworms;
int numberOfDrops = 100;

void setup() {
  size(640, 480);
  Earthworms = new ArrayList<Earthworm>();
  for(int i = 0; i < numberOfDrops; i++) {
    Earthworm r = new Earthworm(random(-50, -100), random(-50, -100), random(3, 6), color(random(255), random(255), random(255)), random(TWO_PI));
    Earthworms.add(r);
  }
}


void draw() {
  background(0);
  for(int i = 0; i < Earthworms.size(); i++) {
    Earthworm r = Earthworms.get(i);
    r.update();
    r.render();
    
    if(r.x[0] < -20 || r.x[0] > width+20 || r.y[0] < -20 || r.y[0] > height+20) {
      Earthworms.remove(i);
      Earthworm rNew = new Earthworm(random(300,340), random(220,260), random(3, 6),  
      color(random(255), random(255), random(255)), random(TWO_PI));
      Earthworms.add(rNew);
      i--;
    }
  }
}


class Earthworm {
  final int numTrace = 20;
  float[] x = new float[numTrace];
  float[] y = new float[numTrace];
  
  //PVector[] points = new PVector[20];
  
  float spd;
  color col;
  float r;
  
  Earthworm(float _x, float _y, float _spd, color _col, float _r) {
    for(int i = 0; i < numTrace; i++) { 
      x[i] = _x; 
      y[i] = _y; 
      //points = new PVector(_x,_y);
    }
    spd = _spd;
    col = _col; 
    r = _r;
  }
  
  void update() {
    for(int i = 0; i < numTrace - 1; i++) {
      x[i] = x[i+1]; 
      y[i] = y[i+1];
    }
    y[numTrace - 1] += sin(r)*spd;
    x[numTrace - 1] += cos(r)*spd;
    r += random(-0.2, 0.2);
  }
  
  void render() {
    noStroke();
    for(int i = 0; i < numTrace; i++) {
      fill(col, map(i, 0, numTrace-1, 0, 250));
      ellipse(x[i], y[i], map(i, 0, numTrace-1, 5, 20),map(i, 0, numTrace-1, 5, 20));
    }
  }
}



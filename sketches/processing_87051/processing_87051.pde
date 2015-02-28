
PendulumWave p;
color[] colors = new color[10];

void setup() {
  size(640, 360, P3D);
  
  p = new PendulumWave(0, width, .2);//x pos
  
  for (int i = 0; i < 10; i++) {
    colors[i] = color(random(0, 255), random(0, 128), random(0, 64));
  }
}

void draw() {
  noFill();
  background(255);
  stroke(0);
  p.run();
  
  float adj = width/2 - mouseX;
  camera(width/2 - adj, height/10.0, (height/2.0) / tan(PI*30.0 / 180.0), 
      width/2, height/2, 0.0, 
       0.0, 1.0, 0.0);
  
  for (int i = 0; i < 10; i++) {
    int j = i + 1;
    fill(colors[i]);
    
    pushMatrix();
    translate(p.getAtStep(j, 10), height/2, i * 50 - 500);
    box(45);
    
    popMatrix();
  }
  
}

class PendulumWave {
    
    float deg2rad = PI / 180;
    float _theta;
    float _amplitude;
    float _speed;
    float _center;
    
    float value;//what we return

    PendulumWave (float min, float max, float speed) {
      _amplitude = max - min;//height of the wave
      _speed = speed * deg2rad / 2;//frequency of the wave
      _center = (max + min) / 2;
      _theta = 0;
    }

    void run() {      
      //value = sin(_theta) * _amplitude / 2 + _center;
      _theta += _speed;
    }

    float getAtStep(float step, float maxSteps) {
      float v = sin(_theta * step) * (_amplitude) / 2 + _center;
      return v;
    }
  }

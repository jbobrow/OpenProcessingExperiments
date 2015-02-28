
Spot[] sp = new Spot[3600];
Integrator[] X = new Integrator[3600];
Integrator[] Y = new Integrator[3600];

int spotNum = 10;
int count = 0;
 
void setup() {
  size(600, 300);
  smooth();
  frameRate(60);
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(80,120), random(0.1,0.5), true);
    X[i] = new Integrator(sp[i].x, 0.5, 0.2);
    Y[i] = new Integrator(sp[i].y, 0.5, 0.2);
  }
}
 
void draw() {
  background(0);
  
  for (int i = 0; i < spotNum; i++) {
    if (sp[i].flag) {
      sp[i].drop();
    } else {
      X[i].update();
      Y[i].update();
      sp[i].x = X[i].value;
      sp[i].y = Y[i].value;
    }
    sp[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < spotNum; i++) {
    float distance = dist(width/2, height/2, sp[i].x, sp[i].y);
    X[i].target(width/2 + 300/distance*(sp[i].x-width/2));
    Y[i].target(height/2 + 300/distance*(sp[i].y-height/2));
  }
}
 
//Spotクラスを定義
class Spot {
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ
  boolean flag; //60フレーム再生したらdropしないためのフラグ
 
  Spot(float _x, float _y, float _diameter, float _speed, boolean _flag) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
    flag = _flag;
  }
 
  //まるが小さくなる
  void drop() {
    count++;
    if (count < 60) {
      diameter -= speed;
    } else {
      count = 0;
      flag = false;
      spotNum++;
      if (spotNum > 3600) spotNum = 3600;
      
    }
  }
 
  //表示
  void display() {
    fill(255, 120-diameter);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}

class Integrator {
  
  final float DAMPING = 0.5f;
  final float ATTRACTION = 0.2f;
  
  float value;
  float vel;
  float accel;
  float force;
  float mass = 1;
  
  float damping = DAMPING;
  float attraction = ATTRACTION;
  boolean targeting;
  float target;
  
  
  Integrator() {
  }
  
  
  Integrator(float value) {
    this.value = value;
  }
  
  
  Integrator(float value, float damping, float attraction) {
    this.value = value;
    this.damping = damping;
    this.attraction = attraction;
  }
  
  
  void set(float v) {
    value = v;
  }
  
  
  void update() {
    if (targeting) {
      force += attraction * (target - value);    
    }
  
    accel = force / mass;
    vel = (vel + accel) * damping;
    value += vel;
  
    force = 0;
  }
  
  
  void target(float t) {
    targeting = true;
    target = t;
  }
}



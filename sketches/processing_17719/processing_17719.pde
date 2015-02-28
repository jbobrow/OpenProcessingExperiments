
Integrator X, Y;
float x[] = {-50};
float y[] = {-50};


void setup() {
  size(400, 300);
  smooth();
  colorMode(HSB, 100);
  frameRate(30);
}

void draw() {
  background(90);

  //時計（仮）
  textAlign(CENTER);
  textSize(32);
  fill(0);
  text("10:10:35", width/2, height/2);

  //雪
  x = append(x, random(width));
  y = append(y, random(height));
  float attraction = random(0.2, 0.6);
  for (int i = 0; i < x.length; i++) {
    X = new Integrator(x[i], 0.5, 0.2);//初期値、制動力値、推進力値
    Y = new Integrator(y[i], 0.5, 0.2);

    X.update();
    Y.update();

    fill(100, 80);
    noStroke();
    ellipse(X.value, Y.value, 40, 40);
    //print(x[i] + ", ");
  }


  //println(" ");
  //noLoop();
}

void mousePressed() {
  X.target(0);
  Y.target(0);
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

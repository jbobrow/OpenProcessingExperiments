
Integrator X, Y;
//Integrator H; 色
float x = random(400);
float y = random(400);

void setup(){
  size(400, 400);
  //smooth();
  colorMode(HSB, 100);
  background(100);
  frameRate(30);

  float attraction = random(0.2, 0.6);
  //println("attraction: " + nf(attraction, 1, 3) );

  X = new Integrator(x, 0.5, 0.2);//初期値、制動力値、推進力値
  Y = new Integrator(y, 0.5, 0.2);//真ん中、小さいとゆっくり、大きいほど急加速
  //H = new Integrator(0, 0.5, 0.2);
}

void draw(){
  fadeToWhite();
  
  X.update();
  Y.update();
  //H.update();
  
  //fill(H.value, 80, 100); 色を変えてく
  fill(0);
  ellipse(X.value, Y.value, 40, 40);
}

//背景
void fadeToWhite(){
  noStroke();
  fill(100);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

//マウスのクリックすると目的値に移動
void mousePressed() {
  if (x > 200 && y < 200){
  X.target(x*2);
  Y.target(y/2);
  }
  if (x > 200 && y > 200){
  X.target(x*2);
  Y.target(y*2);
  }
  if (x < 200 && y < 200){
  X.target(x/2);
  Y.target(y/2);
  }
  if (x < 200 && y > 200){
  X.target(x/2);
  Y.target(y*2);
  }
  //H.target(int(random(100)));
}


//Integratorタブ
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


  void noTarget() {
    targeting = false;
  }
}
                                                                                                                

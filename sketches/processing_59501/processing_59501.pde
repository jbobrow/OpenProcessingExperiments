
Pendulum p;
float t = 0.0;
ArrayList pends;
float[] lengths = new float[30];
float g = 9.8;

void setup() {
  size(400, 400);
  lengths[0] = 0.00009;
  for (int i=1;i<30;i++) {
    //arrange lengths so frequency difference between pendulums is constant
    //lengths[i] = g*lengths[i-1]/( g + 4*PI*PI*lengths[i-1] + 4*PI*sqrt(g*lengths[i-1]) );
    lengths[i] = g*lengths[i-1]/(g + 15*lengths[i-1]+15*sqrt(g*lengths[i-1]));
  }


  pends = new ArrayList();
  for (int i=0; i<30; i++) {
    p = new Pendulum(lengths[i], 0.5);
    pends.add(p);
  }
  smooth();
}

void draw() {
  fill(255,100);
  rect(0,0,width,height);
  translate(width/2,height/2);
  pushMatrix();
  //update current time
  t+=0.0002;
  for (int i = 0;i<pends.size();i++) {
    p = (Pendulum) pends.get(i);
    // fetch position of current pendulum at time t
    p.update(t);
    // draw pendulum
    p.render();
  }
  rotate(2*PI/3);
  for (int i = 0;i<pends.size();i++) {
    p = (Pendulum) pends.get(i);
    // fetch position of current pendulum at time t
    p.update(t);
    // draw pendulum
    p.render();
  }
  rotate(2*PI/3);
  for (int i = 0;i<pends.size();i++) {
    p = (Pendulum) pends.get(i);
    // fetch position of current pendulum at time t
    p.update(t);
    // draw pendulum
    p.render();
  }
  popMatrix();
}

class Pendulum {

  float damp = 1;
  float theta_0;
  float theta;
  PVector leng = new PVector(0, 0);
  float g = 9.8;
  int conv = 4000000; //conversion factor from physics units to pixels

  Pendulum(float length_, float theta_0_) {
    theta_0 = theta_0_;
    leng.y = length_;
  }

  void update(float time) {
    theta = damp*theta_0*cos(sqrt(g/leng.mag())*time);
    if (damp>0){
    damp -= 0.0001;
    }
    if (mousePressed == true){
      damp += 0.001;
    }
  }

  void render() {
    pushMatrix();
    translate(0,-120);
    rotate(theta);
    noStroke();
    strokeWeight(1);
    line(0, 0, conv*leng.x, conv*leng.y);
    for (int i = 20; i > 0; i--) {
      noStroke();
      fill(254-10*i);
      ellipse(conv*leng.x+i/5, conv*leng.y + i/5, i, i);
    }
    popMatrix();
  }
}



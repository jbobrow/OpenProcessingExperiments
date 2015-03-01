
///////////////////////////////////////////////////////////////////////
//
// symplectic integrator
//
///////////////////////////////////////////////////////////////////////
int N = 200;
Mover[] movers = new Mover[N];

float tau = 0.05; // step size of time
float time;
//////////
void setup() {
  size(500, 550);
  for (int i = 0; i < N/2; i++) {
    movers[i] = new Mover((i%10-5)*0.2, int(i/10)*0.2-2.7, (float)i/N*255.0);
  }
  for (int i = N/2; i < N; i++) {
    movers[i] = new Mover((i%10-5)*0.2, int(i/10)*0.2-1.2, (float)i/N*255.0);
  }
  colorMode(HSB);
  time = 0;
}
//////////
void draw() {
  fill(200, 20);
  rect(0, 0, width, height-50);
  for (int i = 0; i < N; i++) {
    movers[i].update_s2();
    movers[i].display();
  }
  displayText();
  time += tau;
}
/////////////////////////////////////
class Mover {
  float q, p;
  float hue;

  Mover(float q0, float p0, float hue0) {
    q = q0;
    p = p0;
    hue = hue0;
  }

  void update_s1() { //// symplectic integrator of 1st order
    q += tau * p;
    p += - tau * sin(q);
    if(q < -PI){ q += TWO_PI; }
    if(q > PI){ q -= TWO_PI; }
  }

  void update_s2() { //// symplectic integrator of 2nd order
    q += 0.5 * tau * p;
    p += - tau * sin(q);
    q += 0.5 * tau * p;
    if(q < -PI){ q += TWO_PI; }
    if(q > PI){ q -= TWO_PI; }
  }

  void display() {
    float xd = map(q, -PI, PI, 0, width);
    float yd = map(p, -3.0, 3.0, height-50, 0);
    //noStroke();
    fill(hue, 255, 255);
    ellipse(xd, yd, 16, 16);
  }
}
////////////////////////////////////
void displayText(){
  fill(100);
  rect(0,height-50,width,50);
  fill(100,255,255);
  textSize(20);
  text("time = " + (int)time, 10, height - 10);
  fill(255);
  text("mouse-left  to reverse time", width - 300, height - 30);
  text("mouse-right to stop time", width - 300, height - 5);
}
////////////////////////////////////
void mousePressed(){
  if(mouseButton == LEFT){
    tau *= -1;
  }else{
    noLoop();
  }
}
void mouseReleased(){
  loop();
}
////////////////////////////////////


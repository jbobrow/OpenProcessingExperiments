

MSD m, m0;
MSD ctlc, ctlk, ctlw;
color[] col = {unhex("FFFF6140"),
               unhex("FFFFA340"),
               unhex("FF3AA6D0"),
               unhex("FF37DC74"),
               };

void setup(){
  size(800, 600);
  frameRate(30);
  rectMode(CENTER);
  textAlign(CENTER);
  
  m = new MSD(1, 25, 0, width/2, height/2, 200, 100);
  m0 = new MSD(1, 25, 0, width/2-300, height/2, 20, 200);
  m.setConnected(m0);

  ctlc = new MSD(1, 0, 2, 100, height - 80, 100, 20);
  ctlk = new MSD(1, 0, 2, width/2, height - 40, 100, 20);
  ctlw = new MSD(1, 0, 2, width/2, height - 120, 100, 20);
}

void draw(){
  //update
  float wf = map(ctlw.x1, 50, width-50, 1, 30);
  m.k = map(ctlk.x1, 50, width-50, 0, 200);
  m.c = map(ctlc.x1, 50, width-50, 0, 10);
  m0.k = pow(wf, 2);
  m.updatePosition(1f/30);
  m0.updatePosition(1f/30);
  ctlk.updatePosition(1f/30);
  ctlc.updatePosition(1f/30);
  ctlw.updatePosition(1f/30);
  
  //draw
  background(0);
  fill(255);
  float zeta = m.c/(2*sqrt(m.k*m.m));
  float wn = sqrt(m.k/m.m);
  text("Zeta: " + nf(zeta, 1, 3) +
       "\nw_n: " + nf(wn/2/PI, 1, 3) + " Hz" +
       "\nw_f: " + nf(wf/2/PI, 1, 3) + " Hz" + 
       "\nr: " + nf(wf/wn, 1, 3), width/2, 20);  
  stroke(255);
  fill(col[0]);
  rect(m.x1, m.y1, m.w, m.h);
  fill(192, 192, 192);
  rect(m0.x1, m0.y1, m0.w, m0.h);
  
  fill(col[1]);
  noStroke();
  rect(ctlw.x1, ctlw.y1, ctlw.w, ctlw.h);
  fill(0);
  text("w: " + nf(wf/2/PI, 1, 2), ctlw.x1, ctlw.y1);
  
  fill(col[2]);
  noStroke();
  rect(ctlk.x1, ctlk.y1, ctlk.w, ctlk.h);
  fill(0);
  text("K: " + nf(m.k, 1, 2), ctlk.x1, ctlk.y1);
  
  fill(col[3]);
  noStroke();
  rect(ctlc.x1, ctlc.y1, ctlc.w, ctlc.h);
  fill(0);
  text("C: " + nf(m.c, 1, 2), ctlc.x1, ctlc.y1);
}

void mousePressed(){
  if(m.isOver(mouseX, mouseY)){
    m.grabbed = true;
  }
  if(m0.isOver(mouseX, mouseY)){
    m0.grabbed = true;
  }
  if(ctlk.isOver(mouseX, mouseY)){
    ctlk.grabbed = true;
  }
  if(ctlc.isOver(mouseX, mouseY)){
    ctlc.grabbed = true;
  }
  if(ctlw.isOver(mouseX, mouseY)){
    ctlw.grabbed = true;
  }
}

void mouseReleased(){
  m.grabbed = false;
  m0.grabbed = false;
  ctlk.grabbed = false;
  ctlc.grabbed = false;
  ctlw.grabbed = false;
}

void keyPressed(){
  setup();
}

class MSD {
  private float w = 200;
  private float h = 100;
  
  float m = 1;
  float c = 0;
  float k = 1;
  float x0 = 0; //rest position
  float x1 = 0; //position
  float x2 = 0; //velocity
  float y1 = 0; //position in y
  boolean grabbed = false;
  
  MSD connected; //connected mass object

  MSD(float mass, float stiffness, float damping, float x0, float y0, float w, float h) {
    m = mass;
    k = stiffness;
    c = damping;
    x1 = x0;
    this.x0 = x0;
    y1 = y0;
    this.w = w;
    this.h = h;
  }
  
  void setConnected(MSD m){
    this.connected = m;
  }

  float x2p(float x2) {
    float xc = 0;
    float vc = 0;
    if(connected != null){
      xc = connected.x1-connected.x0;
      vc = connected.x2;
    }
    return -c/m*(x2-vc) - k*((x1-x0)-xc);
  }

  float x1p(float x1) {
    return x2;
  }

  void updatePosition(float h) {
    if(grabbed){
      float xo = x1;
      x1 = mouseX;
      x2 = (x1 - xo)/h;
      return;
    }
    
    float k1, k2, k3, k4;

    //calc new velocity
    k1 = x2p(x2);
    k2 = x2p(x2+h/2*k1);
    k3 = x2p(x2+h/2*k2);
    k4 = x2p(x2+h*k3);
    x2 += h/6*(k1+2*k2+2*k3+k4);

    //calc new position
    k1 = x1p(x1);
    k2 = x1p(x1+h/2*k1);
    k3 = x1p(x1+h/2*k2);
    k4 = x1p(x1+h*k3);
    x1 += h/6*(k1+2*k2+2*k3+k4);
  }

  boolean isOver(float mX, float mY) {
    if(mX >= x1-w/2 && mX <= x1+w/2 &&
       mY >= y1-h/2 && mY <= y1+h/2){
         return true;
       } else {
         return false;
       }
  }
}




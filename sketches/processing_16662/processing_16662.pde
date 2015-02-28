
int pCnt = 700;
particle[] p;

void setup() {
  size(900,800, P2D);
  p = new particle[pCnt];
  for(int i=0; i<pCnt; i++) 
    p[i] = new particle();
  background(0);
  fill(0,80);
}

void draw() {
  rect(0,0,width,height);
  for(int i=0; i<pCnt; i++) 
    p[i].check();
}

class particle {
  PVector loc = new PVector(random(700)-350+width/2, random(700)-350+height/2, random(700)-350);
  PVector spd = new PVector(0,0,0);
  boolean fGone = false;
  int mode = int(random(3))-1;  
  float mass = random(pow(200,mode*-1+1));
  void check() {
    float r=0;
    loc.add(spd);
    for(int i=0; i<pCnt; i++){
      if (p[i] != this && mode != p[i].mode) {
        PVector d = PVector.sub(p[i].loc, loc);
        float dist = d.mag();
        if (mode == 1) r = constrain((p[i].mass*mass) / (dist*dist),0,2);
        else r = constrain((p[i].mass*mass) / (dist*dist*dist*dist),0,1);
        d.normalize();
        d.mult(r);
        spd.add(d);
        spd.mult(.999);
      }
    }
    if (abs(loc.z) < 20) {
      stroke(color(200, 200, 200));
      point(loc.x, loc.y);
    }
    else {
      stroke(color(0,180,200));
      point(loc.x+loc.z/40,loc.y);
      stroke(color(255,0,0));
      point(loc.x-loc.z/40,loc.y);
    }
  }
}

void keyPressed() {  
  if (key == CODED) {
    if (keyCode == UP)
      for(int i=0; i<pCnt; i++) 
        p[i].loc.y += 5;
    if (keyCode == DOWN)
      for(int i=0; i<pCnt; i++) 
        p[i].loc.y -= 5;
    if (keyCode == LEFT)
      for(int i=0; i<pCnt; i++) 
        p[i].loc.x += 5;
    if (keyCode == RIGHT)
      for(int i=0; i<pCnt; i++) 
        p[i].loc.x -= 5;
  }
}


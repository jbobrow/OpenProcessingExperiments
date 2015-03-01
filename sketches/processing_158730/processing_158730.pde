
final int pNum = 100;
final int lNum = 500;
particle p[] = new particle[pNum];
lineControl l1[] = new lineControl[lNum];
int index[][] = new int[2][lNum];
  int [][]map;
  int []neighbor;
void setup() {
  background(0);
  size(500, 500);
  background(0);
  noStroke();
  
    map = new int[pNum][];
    neighbor = new int[pNum];
    for(int i = 0; i < pNum; i++) {
      int neighborNum = floor(random(2, 5));
      map[i] = new int[neighborNum];
      neighbor[i] = neighborNum;
      for(int j = 0; j < neighborNum; j++) {
        map[i][j] = floor(random(0, pNum));
      }
    }
  for(int i = 0; i < pNum; i++) p[i] = new particle(width, height);
  for(int i = 0; i < lNum; i++) {
    index[0][i] = floor(random(0, pNum));
    index[1][i] = map[index[0][i]][floor(random(0, neighbor[index[0][i]]))];
    l1[i] = new lineControl(index[0][i], index[1][i]);
  }
  frameRate(60);
}
void draw() {
  background(250);
  for(int i = 0; i < pNum; i++) p[i].update();
  for(int i = 0; i < lNum; i++) {
    if(l1[i].isFinished) {
      index[0][i] = index[1][i];
      index[1][i] = map[index[0][i]][floor(random(0, neighbor[index[0][i]]))];
      l1[i] = new lineControl(index[0][i], index[1][i]);
    }
  }
  for(int i = 0; i < lNum; i++) l1[i].update();
}

class lineControl {
  int si, ei;
  PVector sp, ep, dirct, movep1, movep2;
  float progress;
  int iteration, boundary;
  boolean isFinished;


  lineControl(int si, int ei) {
    this.si = si;
    this.ei = ei;
 
    sp = new PVector(p[si].disp.x, p[si].disp.y);
    ep = new PVector(p[ei].disp.x, p[ei].disp.y);
    movep1 = new PVector();
    movep2 = new PVector();
    progress = 10;
    dirct = new PVector(ep.x - sp.x, ep.y - sp.y);
    float a = random(0, 100);
    if(a < 33.3) {
      iteration = 2;
      boundary = 152;
    } else if ( a > 66.6) {
      iteration = 10;
      boundary = 160;
    } else {
      iteration = 5;
      boundary = 155;
    }
    isFinished = false;
  }
  
  void update() {
    stroke(220, 100);
    
    sp.set(p[si].disp.x, p[si].disp.y);
    ep.set(p[ei].disp.x, p[ei].disp.y);
    
    dirct.set(ep.x - sp.x, ep.y - sp.y);
    
    if(progress <= 50) {
      movep2 = PVector.add(sp, PVector.mult(dirct, progress / 100));
      line(sp.x, sp.y, movep2.x, movep2.y);
    } else if(progress > 100) {
      movep1 = PVector.add(sp, PVector.mult(dirct, (progress - 50) / 100));
      line(movep1.x, movep1.y, ep.x, ep.y); 
    } else {
      movep1 = PVector.add(sp, PVector.mult(dirct, (progress - 50) / 100));
      movep2 = PVector.add(sp, PVector.mult(dirct, progress / 100));
      line(movep1.x, movep1.y, movep2.x, movep2.y);
    }
    noStroke();
    progress += iteration;
    if(progress >= boundary) isFinished = true;
  }
  

}
class particle {
  
  int w, h;
  PVector disp, vel, acc, gravity;
  float r, rofst, amp, freq, period, phase, dt, time;
  color c;
  particle(int w, int h) {
    this.w = w;
    this.h = h;
    disp = new PVector(random(0, w), random(0, h));
    vel = new PVector( sin(random(0, TWO_PI)), sin(random(0, TWO_PI)) );
    gravity = new PVector();
    acc = new PVector();
    rofst = random(5, 10);
    r = rofst;
    amp = rofst * random( 0.1, 0.2);
    freq = random(5.0, 10.0);
    period = 1/freq;
    phase = random(0, TWO_PI);
    dt = 0.001;
    time = 0;
    c = color(random(150, 250), random(150, 250), random(150, 250), 150);
  }
  
  void update() {
//    gravity.set(mouseX - disp.x, mouseY - disp.y);
//    gravity.mult(0.00005);
    acc.set( sin(random(0, TWO_PI)), sin(random(0, TWO_PI)) );
    acc.mult(0.05);
    acc.add(gravity);
    vel.add(acc);
    disp.add(vel);
    
    if(disp.x > w) disp.x -= w;
    else if(disp.x < 0) disp.x += w;
    if(disp.y > h) disp.y -= h;
    else if(disp.y < 0) disp.y += h;
    if(vel.mag() >= 1) vel.mult(0.8);
    
    r = rofst + amp * sin(TWO_PI * freq * time + phase);
    time += dt;
    if( time >= period) time -= period;
    
    display();
  }
  
  void display() {
    fill(c);
//    beginShape();
//    vertex(mouseX, mouseY);
//    vertex(disp.x, disp.y);
//    endShape();
//    stroke(100, 100);
//    line(mouseX, mouseY, disp.x, disp.y);
//    noStroke();
    ellipse(disp.x, disp.y, r, r);
  }
  
}



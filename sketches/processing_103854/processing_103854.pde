
PVector mousePos;
ArrayList<Ripple> ripples;

PVector origin = new PVector(110, 120);
PVector spawnpoint;
int radius;
float speed = 2.2;
float t;

void setup() {
  size(720,240,P2D);
  background(27,52,84);
  noFill();
  frameRate(60);
  stroke(110,160,255);
  strokeWeight(1);
  
  ripples = new ArrayList();
}

void draw() {
  
  origin.x = lerp(origin.x, mouseX*0.75+128, 0.05);
  speed = map(mouseY, 0, height, 4, 1);
  
  fill(27,52,84);
  //fill(27,52,84,50);
  rect(-5,-5,width+7,height+7);
  
  if (mousePressed) {
    //addRing();
  }
  
  t+=speed;
  float rad = radians(t);
  spawnpoint = new PVector(50*cos(rad)+origin.x, 50*sin(rad)+origin.y);
  addRing(spawnpoint);
  
  
  if (ripples.size()==0)
    return;
  //noFill();
  //for (Ripple rip : ripples) {
  for (int i=0; i<ripples.size(); i++) {
    Ripple rip = ripples.get(i); 
    rip.update();
    
    if (rip.x >width+rip.r)
        ripples.remove(i);
  }
}

void addRing() {
  Ripple ripple = new Ripple(mouseX,mouseY);
  ripples.add(ripple);
}
void addRing(PVector o) {
  Ripple ripple = new Ripple((int)o.x,(int)o.y);
  ripples.add(ripple);
}

//((o))((o))((o))((o))((o))((o))((o))((o))\\
class Ripple {
  int x;
  int y;
  int r;
  int a;
  
  Ripple(int mx, int my) {
    x = mx;
    y = my;
    r = 100;
    a = 255;
  }
  
  //Ripple(int mx, int my, int vx, int vy) {
  
  void update() {
    //r+=3;
    r-=1;
    y-=0;
    x+=8;
    
    stroke(110,160,255);
    ellipse(x,y,r,r);
  }
}



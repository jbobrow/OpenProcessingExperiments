
class Particle
{
  double x, y;
  double vx, vy;
  double fx, fy;
  double m;
  boolean flag;

  Particle(double m, double x, double y, double vx, double vy) {
    this.m = m;
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.fx = 0;
    this.fy = 0;
    flag=false;
  }

  void resetForce() {
    fx = 0;
    fy = 0;
  }

  void addForce(Particle p) {
    double k=0;
    double dx = p.x - x;
    double dy = p.y - y;
    double l = Math.sqrt(dx * dx + dy * dy);
    if (10<l)  k=1/(l*l+0.1);
    else k = 1 / (l * l*l + 0.1);
    fx += dx * k * p.m;
    fy += dy * k * p.m;
    p.fx -= dx * k * m;
    p.fy -= dy * k * m;
  }

  void move() {
    vx += fx * dt;
    vy += fy * dt;
    x += vx * dt;
    y += vy * dt;
  }

  void draw() {
    double k, l;
    double dx = width/2-x;
    double dy = height/2-y;
    k=Math.sqrt(dx*dx+dy*dy);
    l=random(width/2-30, width/2);
    if (k<l) {
      k=(Math.abs(k-l)*255/l)%255;
      fill((int)k, (int)k+80, 255, (int)k+10);
      int w=((int)k*30/255)%30;
      if (w>5)
        ellipse((int)x-width/2, (int)y-height/2, w, w);
      //  ellipse(random((int)x-2,(int)x+2),random((int)y-2,(int)y+2),2,2);
    }
    else flag=true;
  }
}

final int pmax = 1000;
Particle particles[];
Particle g;
final double dt = 0.01;
float r, theta;

Particle newParticle() {
  double x = random(width);
  double y = random(height);

  double vx = 0;
  double vy = 0;

  return new Particle(1000, x, y, vx, vy);
}

void setup() {
  size(300, 300, P3D);
  particles = new Particle[pmax];
  for (int i=0; i<pmax; i++) {
    particles[i] = newParticle();
  }
  background(255);
  frameRate(100);
  fill(255);
  noStroke();
  smooth();
  theta=0;
}

void draw() {
  // background(0);
  fill(0, 100);
  rect(0, 0, width, height);

  translate(width/2, height/2, -50);
  rotateZ(r);
  for (int i=0; i<pmax; i++) {
    particles[i].resetForce();
  }

  for (int i=0; i<pmax; i++) {
    for (int j=i+1; j<pmax; j++) {
      particles[i].addForce(particles[j]);
    }
    if (particles[i].flag&&random(2)%2==0) particles[i] = newParticle();
    particles[i].move();
    particles[i].draw();
  }
  filter(ERODE);
  filter(BLUR,3);
  //   filter(ERODE); //filter(DILATE);// filter(BLUR,2);

  r+=PI/30;
  if(r==PI) r=0;
}



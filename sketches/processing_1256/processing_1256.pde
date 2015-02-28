
// Coffee-table space filling
//
//   This was the genesis of the program used to do space-filling
//   for my Coverpop website (www.coverpop.com)
//
//  - Jim Bumgardner
 
double  damping = 0.8;
double  kRadiusFactor = 0.5;
double  kSpeed = 3.0;
double  minDistFactor = 2;
int  nbrParticles = 2000;
 
class Particle
{
  double  x,y,vx,vy,radius;
  float  r,g,b;
 
  Particle()
  {
    vx = 0;
    vy = 0;
    r = random(1);
    g = random(1);
    b = random(1);
    float[] hsv = RGBtoHSV(r,g,b);
    x = hsv[0]*width*.5/360;
    y = hsv[1]*height;
    radius = width*kRadiusFactor/Math.sqrt(nbrParticles);
    radius += random((int)(radius/2));
  }
}
 
Particle[] particles;
 
void setup()
{
  size(1000,600);
  frameRate(24);
  colorMode(RGB, 1);
  // noLoop();
  smooth();
  noStroke();
  particles = new Particle[nbrParticles];
  for (int i = 0; i < nbrParticles; ++i)
    particles[i] = new Particle();
}
 
void doPhysics()
{
  for (int i = 0; i < nbrParticles; ++i) {
    double fx = 0, fy = 0, wt = 0;
    particles[i].vx *= damping;
    particles[i].vy *= damping;
    for (int j = 0; j < nbrParticles; ++j) {
      if (j == i || Math.abs(particles[j].x - particles[i].x) > particles[i].radius*minDistFactor ||
                    Math.abs(particles[j].y - particles[i].y) > particles[i].radius*minDistFactor)
        continue;
      double  dx = particles[i].x - particles[j].x;
      double  dy = particles[i].y - particles[j].y;
      double  distance = Math.sqrt(dx*dx+dy*dy);
      double  maxDist = (particles[i].radius + particles[j].radius);
      double  diff = maxDist - distance;
      if (diff > 0) {
        double scle = diff/maxDist;
        scle = scle*scle;
        wt += scle;
        scle = scle*kSpeed/distance;
        fx += dx*scle;
        fy += dy*scle;
      }
    }
 
       // keep within edges
    double dx,dy,distance,scle,diff;
    double maxDist = particles[i].radius;
    // left edge 
    distance = dx = particles[i].x - 0;    dy = 0;
    diff = maxDist - distance;
    if (diff > 0) {
    scle = diff/maxDist;
    scle = scle*scle;
    wt += scle;
    scle = scle*kSpeed/distance;
        fx += dx*scle;
        fy += dy*scle;
    }
    // right edge 
    dx = particles[i].x - width;    dy = 0;
    distance = -dx;
    diff = maxDist - distance;
    if (diff > 0) {
    scle = diff/maxDist;
    scle = scle*scle;
    wt += scle;
    scle = scle*kSpeed/distance;
        fx += dx*scle;
        fy += dy*scle;
    }
    // top edge
    distance = dy = particles[i].y - 0;    dx = 0;
    diff = maxDist - distance;
    if (diff > 0) {
    scle = diff/maxDist;
    scle = scle*scle;
    wt += scle;
    scle = scle*kSpeed/distance;
        fx += dx*scle;
        fy += dy*scle;
    }
    // bot edge 
    dy = particles[i].y - height;    dx = 0;
    distance = -dy;
    diff = maxDist - distance;
    if (diff > 0) {
    scle = diff/maxDist;
    scle = scle*scle;
    wt += scle;
    scle = scle*kSpeed/distance;
        fx += dx*scle;
        fy += dy*scle;
    }
    if (wt > 0) {
      particles[i].vx += fx/wt;
      particles[i].vy += fy/wt;
    }
  }
  for (int i = 0; i < nbrParticles; ++i) {
    particles[i].x += particles[i].vx;
    particles[i].y += particles[i].vy;
    // particles[i].x += .5;
  }
}
 
int passes;
 
void draw()
{
  doPhysics();
  background(0);
  for (int i = 0; i < nbrParticles; ++i) {
    // particles[i].x += .1;
 //   if (i == 0)
 //     println(particles[i].x);
    fill(particles[i].r, particles[i].g, particles[i].b);
    ellipse((int) particles[i].x, (int) particles[i].y,
          (int) particles[i].radius, (int) particles[i].radius);
  }
  println(passes++);
}
 
float[] RGBtoHSV(float r, float g, float b)
{
  float mmax = r > g? r : g;
  mmax = mmax > b? mmax : b;
  float mmin = r < g? r : g;
  mmin = mmin < b? mmin : b;
  float v = mmax;
  float s = (mmax != 0)? (mmax-mmin)/mmax : 0;
  float h = 0;
  if (s == 0) {
    h = 0;  // undefined, actually
  }
  else {
    float d = mmax - mmin;
    if (r == mmax) {
        h = (g - b)/d;
    }
    else if (g == mmax) {
        h = 2 + (b-r)/d;
    }
    else if (b == mmax) {
        h = 4 + (r-g)/d;
    }
    h *= 60;
    if (h < 0) {
        h += 360;
    }
  }
  float[] results = new float[3];
  results[0] = h;
  results[1] = s;
  results[2] = v;
  return results;
}




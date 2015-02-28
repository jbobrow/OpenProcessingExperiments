
float imageScale;
float dotDensity = .1; // higher ratios = more dots
float  damping = 0.4;
float  kRadiusFactor = 0.5;
float  kSpeed = 3.0;
float  minDistFactor = 2.5; // area of influence - smaller numbers make rendering go faster
float  radiusRatio = 5;
float radiusOffset = 0.1;
int  nbrParticles = 12500;
int particlesPerFrame = 8; 
PImage reference;
 
 
class Particle
{
  float  x, y, vx, vy, rad, vrad;
  float  fx, fy, wt;
 
  Particle(float _x, float _y)
  {
    vx = 0;
    vy = 0;
    x = _x;
    y = _y;
    rad = 1;
    vrad = 1;
  }
}
 
Particle[] particles;
 
float minRadius, maxRadius, medRadius;
int pixelCount = 0;
 
void setup()
{
  size(640, 640);
 
 
  reference = loadImage("gew.jpg");
 
  int dwidth = 600;
  int dheight = 530;
  imageScale = width/(float) dwidth;
 
  particles = new Particle[nbrParticles];
 
 
  frameRate(55);
  smooth();
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
 
  float medArea = (width*height)/nbrParticles;
  medRadius = sqrt(medArea/PI);
  minRadius = medRadius;
  maxRadius = medRadius*medRadius*1;
  background(255);
}
 
void doPhysics()
{
 
 
  for (int i = 0; i < pixelCount; ++i) {
    int px = (int) (particles[i].x / imageScale);
    int py = (int) (particles[i].y / imageScale);
    if (px >= 0 && px < reference.width && py >= 0 && py < reference.height) {
      int v = (int) red(reference.pixels[ py*reference.width + px ]);
      particles[i].rad = map(v/255.0, 0, 1, minRadius, maxRadius);
      particles[i].vrad = radiusOffset + radiusRatio * (255 - v) / 255 ;
    }
  }
 
 
  for (int i = 0; i < pixelCount; ++i) {
    Particle p = particles[i];
    p.fx = p.fy = p.wt = 0;
 
    p.vx *= damping;
    p.vy *= damping;
  }
 
  // Particle -> particle interactions
  for (int i = 0; i < pixelCount-1; ++i) {
    Particle p = particles[i];
    for (int j = i+1; j < pixelCount; ++j) {
      Particle pj = particles[j];
      if (i== j || Math.abs(pj.x - p.x) > p.rad*minDistFactor ||
        Math.abs(pj.y - p.y) > p.rad*minDistFactor)
        continue;
 
      double  dx = p.x - pj.x;
      double  dy = p.y - pj.y;
      double  distance = Math.sqrt(dx*dx+dy*dy);
 
      double  maxDist = (p.rad + pj.rad);
      double  diff = maxDist - distance;
      if (diff > 0) {
        double scle = diff/maxDist;
        scle = scle*scle;
        p.wt += scle;
        pj.wt += scle;
        scle = scle*kSpeed/distance;
        p.fx += dx*scle;
        p.fy += dy*scle;
        pj.fx -= dx*scle;
        pj.fy -= dy*scle;
      }
    }
  }
 
  for (int i = 0; i < pixelCount; ++i) {
    Particle p = particles[i];
 
    // keep within edges
    double dx, dy, distance, scle, diff;
    double maxDist = p.rad;
    // left edge 
    distance = dx = p.x - 0;   
    dy = 0;
    diff = maxDist - distance;
    if (diff > 0) {
      scle = diff/maxDist;
      scle = scle*scle;
      p.wt += scle;
      scle = scle*kSpeed/distance;
      p.fx += dx*scle;
      p.fy += dy*scle;
    }
    // right edge 
    dx = p.x - width;   
    dy = 0;
    distance = -dx;
    diff = maxDist - distance;
    if (diff > 0) {
      scle = diff/maxDist;
      scle = scle*scle;
      p.wt += scle;
      scle = scle*kSpeed/distance;
      p.fx += dx*scle;
      p.fy += dy*scle;
    }
    // top edge
    distance = dy = p.y - 0;   
    dx = 0;
    diff = maxDist - distance;
    if (diff > 0) {
      scle = diff/maxDist;
      scle = scle*scle;
      p.wt += scle;
      scle = scle*kSpeed/distance;
      p.fx += dx*scle;
      p.fy += dy*scle;
    }
    // bot edge 
    dy = p.y - height;   
    dx = 0;
    distance = -dy;
    diff = maxDist - distance;
    if (diff > 0) {
      scle = diff/maxDist;
      scle = scle*scle;
      p.wt += scle;
      scle = scle*kSpeed/distance;
      p.fx += dx*scle;
      p.fy += dy*scle;
    }
    if (p.wt > 0) {
      p.vx += p.fx/p.wt;
      p.vy += p.fy/p.wt;
    }
    p.x += p.vx;
    p.y += p.vy;
  }
}
 
 
void draw()
{
  background(255);
  //if (pixelCount % 100 == 0) println(pixelCount);
   
  if (pixelCount < nbrParticles) {
    for (int i = 0; i < particlesPerFrame; i++) {
      particles[pixelCount++] = new Particle(random(width), random(height));
    }
  }
 
   
  doPhysics();
   
  for (int i = 0; i < pixelCount; ++i) {
    strokeWeight(particles[i].vrad);
    point(particles[i].x, particles[i].y);
  }
}




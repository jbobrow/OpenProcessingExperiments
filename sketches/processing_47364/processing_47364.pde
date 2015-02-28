
// Stipple Cat  Jim Bumgardner
//
//   @pjs preload="/cats2_0.png";
//   @pjs preload="/cats2_1.png";
//   @pjs preload="/cats2_2.png";
//   @pjs preload="/cats2_3.png";
//   @pjs preload="/cats2_4.png";
//   @pjs preload="/cats2_5.png";
//   @pjs preload="/cats2_6.png";
//   @pjs preload="/cats2_7.png";


// Play with these...
float imageScale;
float dotDensity = .24; // higher ratios = more dots


// Probably don't need to play with these as much...
float  damping = 0.7;
float  kRadiusFactor = 0.5;
float  kSpeed = 3.0;
float  minDistFactor = 2.5; // area of influence - smaller numbers make rendering go faster
int  nbrParticles = 2200;

int catSpeed = 2;


PImage reference; // for dithering initialilzation...
int nbrCatFrames = 8;

PImage[] cats = new PImage[nbrCatFrames];

class Particle
{
  float  x, y, vx, vy, rad;
  float  fx, fy, wt;

  Particle(float _x, float _y)
  {
    vx = 0;
    vy = 0;
    x = _x;
    y = _y;
    rad = 1;
  }
}

Particle[] particles;

float minRadius, maxRadius, medRadius;

void setup()
{
  size(500, 214);

  for (int i = 0; i < nbrCatFrames; ++i) {
    cats[i] = loadImage("cats2_" + i + ".png");
  }
  reference = cats[0];

  int dwidth = 136;
  int dheight = 68;
  imageScale = width/(float) dwidth;

  particles = new Particle[nbrParticles];

  for (int i = 0; i < nbrParticles; ++i) {
    particles[i] = new Particle(random(width), random(height));
  }

  frameRate(24);
  // noLoop();
  smooth();
  noStroke();

  float medArea = (width*height)/nbrParticles;
  medRadius = sqrt(medArea/PI);
  minRadius = medRadius;
  maxRadius = medRadius*medRadius*1;
  // println("nbrParticles = " + nbrParticles);
  // println("medrad = " + medRadius);
  // println("min-max = " + minRadius + " --> " + maxRadius);
  background(255);
}

void doPhysics()
{
  if (frameCount % catSpeed == 0) {
    int frameCtr = (frameCount/catSpeed % nbrCatFrames);
    reference = cats[frameCtr];
  }

  for (int i = 0; i < nbrParticles; ++i) {
    int px = (int) (particles[i].x / imageScale);
    int py = (int) (particles[i].y / imageScale);
    if (px >= 0 && px < reference.width && py >= 0 && py < reference.height) {
      int v = (int) red(reference.pixels[ py*reference.width + px ]);
      particles[i].rad = map(v/255.0, 0, 1, minRadius, maxRadius);
    }
  }


  for (int i = 0; i < nbrParticles; ++i) {
    Particle p = particles[i];
    p.fx = p.fy = p.wt = 0;

    p.vx *= damping;
    p.vy *= damping;
  }

  // Particle -> particle interactions
  for (int i = 0; i < nbrParticles-1; ++i) {
    Particle p = particles[i];
    for (int j = i+1; j < nbrParticles; ++j) {
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

  for (int i = 0; i < nbrParticles; ++i) {
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
  doPhysics();
  fill(255, 64);
  rect(0, 0, width, height);
  stroke(0);
  strokeWeight(medRadius*1);
  for (int i = 0; i < nbrParticles; ++i) {
    point(particles[i].x, particles[i].y);
  }
  // if (frameCount % 60 == 0)
  //  println("fps = " + frameRate);
}





/*
  Molecule Soup
  Stinging Eyes, 12 Dec 09
  sine/cosine orbitals from Keith Peters - thank you */

int numParticleGroups = 300;
int spreadRadius = 12;
int radius = 10;
int shimmer = 5;

ParticleGroup[] particles = new ParticleGroup[numParticleGroups];
final float Pi180 = PI / 180;

void setup() {

  size(600, 600);
  background(255);
  colorMode(HSB);
  noStroke();
  smooth();

  for (int i = 0; i < numParticleGroups; i++) {
    particles[i] = new ParticleGroup();
  }
}  

void draw() {

  background(255);

  for (int i = 0; i < numParticleGroups; i++) {
    particles[i].move();
  }
}

class ParticleGroup {

  float xspeed, yspeed, xradius, yradius, xangle, yangle, spread1, spread2, spread3, spread4, xp, yp, r;
  color col;

  ParticleGroup() {

    this.xspeed = random(1, 2); 
    this.yspeed = random(1, 2);
    this.xradius = random(0, 200);
    this.yradius = random(0, 200);
    this.r = radius;
    this.xangle = random(5,12);
    this.yangle = random(1,2);
    this.col = color(random(160, 170), random(100, 255), random(150, 230), random(150, 255));
    this.spread1 = random(-spreadRadius, spreadRadius);
    this.spread2 = random(-spreadRadius, spreadRadius);
    this.spread3 = random(-spreadRadius, spreadRadius);
    this.spread4 = random(-spreadRadius, spreadRadius);
  }

  void move() {

    this.xangle += this.xspeed;
    this.yangle += this.yspeed;
    this.xp = (float) Math.sin(this.xangle * Pi180) * this.xradius + 300;
    this.yp = (float) Math.cos(this.yangle * Pi180) * this.yradius + 300;

    fill(this.col);

    ellipse(xp, yp, this.r, this.r); // main point
    ellipse(xp + (this.spread1 + random(shimmer)), yp + (this.spread2 + random(shimmer)), this.r, this.r);
    ellipse(xp - (this.spread3 + random(shimmer)), yp + (this.spread4 + random(shimmer)), this.r, this.r);
    ellipse(xp - (this.spread4 + random(shimmer)), yp - (this.spread3 + random(shimmer)), this.r, this.r);
    ellipse(xp + (this.spread2 + random(shimmer)), yp - (this.spread1 + random(shimmer)), this.r, this.r);
  }
}



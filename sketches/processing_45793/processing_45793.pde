
ArrayList particleSystems;
PGraphics pg;

int mr, mg, mb;

float simplify = 2;
int far_threshold = 5000;

void setup() {
  size(600, 600);
  
  pg = createGraphics((int)(width/simplify), (int)(height/simplify), P2D);
  particleSystems = new ArrayList();
}

void draw() {
  background(0);
  
  // calc vx/vy
  for(int i=0; i<particleSystems.size(); i++) {
    ParticleSystem ps = (ParticleSystem)this.particleSystems.get(i);
    ps.calcMetaball();
  }
  
  // draw metaballs
  pg.beginDraw();
  pg.loadPixels();
  for(int y=0; y<pg.height; y++) {
    for(int x=0; x<pg.width; x++) {
      mr = 1;
      mg = 1;
      mb = 1;
      for(int i=0; i<particleSystems.size(); i++) {
        ParticleSystem ps = (ParticleSystem)this.particleSystems.get(i);
        ps.drawMetaball(x, y);
      }
      pg.pixels[x+y*pg.width] = color(mr, mg, mb);
    }
  }
  pg.updatePixels();
  pg.endDraw();
  
  image(pg, 0, 0, width, height);
  
  // proc
  for(int i=0; i<particleSystems.size(); i++) {
    ParticleSystem ps = (ParticleSystem)this.particleSystems.get(i);
    ps.proc();
    if(ps.dead()) {
      this.particleSystems.remove(i);
      i--;
    }
  }
}

void mouseClicked() {
  particleSystems.add(new ParticleSystem(new PVector(mouseX/simplify, mouseY/simplify), int(random(5, 6))));
}

class ParticleSystem {
  ArrayList particles;
  
  public ParticleSystem(PVector pos, int particleNum) {
    this.particles = new ArrayList();
    
    print(particleNum);
    
    for(int i=0; i<particleNum; i++) {
      PVector newpos = new PVector(pos.x, pos.y);
      float theta = random(PI/6*8, PI/6*10);
      float r = random(2.0, 3.0);
      PVector vel = new PVector(r*cos(theta), r*sin(theta));
      this.particles.add(new Particle(newpos, vel, int(random(120, 150))));
    }
  }
  /*
  public void drawParticles() {
    for(int i=0; i<this.particles.size(); i++) {
      Particle p = ((Particle)this.particles.get(i));
      p.drawParticle();
    }
  }
  */
  public void calcMetaball() {
    for(int i=0; i<this.particles.size(); i++) {
      Particle p = ((Particle)this.particles.get(i));
      p.calcMetaball();
    }
  }
  
  public void drawMetaball(int x, int y) {
    for(int i=0; i<this.particles.size(); i++) {
      Particle p = ((Particle)this.particles.get(i));
      p.drawMetaball(x, y);
    }
  }
  
  public void proc() {
    for(int i=0; i<this.particles.size(); i++) {
      Particle p = ((Particle)this.particles.get(i));
      p.proc();
      if(p.dead()) {
        this.particles.remove(i);
        i--;
      }
    }
  }
  
  public boolean dead() {
    for(int i=0; i<this.particles.size(); i++) {
      if(!((Particle)this.particles.get(i)).dead()) {
        return false;
      }
    }
    return true;
  }
}

class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  int t;
  int life;
  int vx[];
  int vy[];
  float r_ratio = 1, g_ratio = 1, b_ratio = 1;
  
  public Particle(PVector initPos, PVector initVel, int life) {
    this.pos = initPos;
    this.vel = initVel;
    this.life = life;
    
    this.vx = new int[pg.width];
    this.vy = new int[pg.height];
    
    this.acc = new PVector(0, 0.1);
    
    this.r_ratio = random(0, 1);
    this.g_ratio = random(0, 1);
    this.b_ratio = random(0, 1);
  }
  
  /*
  public void drawParticle() {
    point(this.pos.x, this.pos.y);
  }
  */
  
  public void calcMetaball() {
    for(int i=0; i<pg.width; i++) {
      vx[i] = int(sq(this.pos.x - i));
    }
    for(int j=0; j<pg.height; j++) {
      vy[j] = int(sq(this.pos.y - j));
    }
  }
  
  public void drawMetaball(int x, int y) {
    if((x-pos.x)*(x-pos.x) + (y-pos.y)*(y-pos.y) > far_threshold) return;
    float p = 20000/(vy[y] + vx[x] + 1);
    mr += p * r_ratio;
    mg += p * g_ratio;
    mb += p * b_ratio;
  }
  
  public void proc() {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    
    t++;
  }
  
  public boolean dead() {
    if(t>life) return true;
    else return false;
  }
  
}


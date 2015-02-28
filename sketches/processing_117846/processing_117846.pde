


ParticleSystem ps;
ParticleSystem2 ps2;
ParticleSystem3 ps3;
float moveX = displayWidth;
float moveY = displayHeight;
PImage chispa;
PImage chispa2;
PImage lluvia;

void setup() {
  size(displayWidth, displayHeight, P2D);
  orientation(LANDSCAPE);
  frameRate(40);

  chispa = loadImage("chispa.png");
  chispa2 = loadImage("chispa2.png");
  lluvia = loadImage("lluvia.png");
  ps = new ParticleSystem(10000);
  ps2 = new ParticleSystem2(10000);
  ps3 = new ParticleSystem3(10000);
  hint(DISABLE_DEPTH_MASK);
}

void draw () {
  background(0);

  moveX = random(0, displayWidth);
  moveY = random(displayHeight-10, displayHeight);


  ps2.setEmitter(moveX, moveY);
  ps.setEmitter(moveX, displayHeight);
  ps3.setEmitter(moveX, -300);

  ps2.update();
  ps2.display();
  ps.update();
  ps.display();
  ps3.update();
  ps3.display();
}

class Particle {

  PVector velocity;
  float lifespan = 255;

  PShape part;
  float partSize;

  PVector gravity = new PVector(0, 0);


  Particle() {
    partSize = random(30, 70);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(chispa);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, chispa.width, 0);
    part.vertex(+partSize/2, +partSize/2, chispa.width, chispa.height);
    part.vertex(-partSize/2, +partSize/2, 0, chispa.height);
    part.endShape();

    rebirth(width/2, height/2);
    lifespan = random(255);
  }

  PShape getShape() {
    return part;
  }


  void rebirth(float x, float y) {

    float s = second();
    float f = 40;

    if (s > 35) {
      f = 5;
    }
    else {
      f = 40 - s;
    }

    float a = random(TWO_PI);
    float speed = random(0.5, f);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = 255;   
    part.resetMatrix();
    part.translate(x, y);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } 
    else {
      return false;
    }
  }


  public void update() {
    lifespan = lifespan - 5;
    velocity.add(gravity);

    part.setTint(color(255, lifespan));
    part.translate(velocity.x, velocity.y);
  }
}

class Particle2 {

  PVector velocity;
  float lifespan = 255;
  
  PShape part;
  float partSize;
  
  PVector gravity = new PVector(0,0);


  Particle2() {
    partSize = random(30,100);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(chispa2);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, chispa2.width, 0);
    part.vertex(+partSize/2, +partSize/2, chispa2.width, chispa2.height);
    part.vertex(-partSize/2, +partSize/2, 0, chispa2.height);
    part.endShape();
    
    rebirth(width/2,height/2);
    lifespan = random(255);
  }

  PShape getShape() {
    return part;
  }
  
  void rebirth(float x, float y) {
    
    float s = second();
    float f2 = 5;

    if (s > 20) {
      f2++;
    }
    else {
      f2 = 20 - s;
    }
    
    float a = random(TWO_PI);
    float speed = random(0.5,f2);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = 255;   
    part.resetMatrix();
    part.translate(x, y); 
  }
  
  boolean isDead() {
    if (lifespan < 0) {
     return true;
    } else {
     return false;
    } 
  }
  

  public void update() {
    lifespan = lifespan - 3;
    velocity.add(gravity);
    
    part.setTint(color(255,lifespan));
    part.translate(velocity.x, velocity.y);
    
  }
}
class ParticleSystem {
  ArrayList<Particle> particles;

  PShape particleShape;

  ParticleSystem(int n) {
    particles = new ArrayList<Particle>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle p = new Particle();
      particles.add(p);
      particleShape.addChild(p.getShape());
    }
  }

  void update() {
    for (Particle p : particles) {
      p.update();
    }
  }

  void setEmitter( float x, float y) {
    for (Particle p : particles) {
      if (p.isDead()) {
        p.rebirth(x, y);
      }
    }
  }

  void display() {

    shape(particleShape);
  }
}

class ParticleSystem2 {
  ArrayList<Particle2> particles;

  PShape particleShape;

  ParticleSystem2(int n) {
    particles = new ArrayList<Particle2>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle2 p = new Particle2();
      particles.add(p);
      particleShape.addChild(p.getShape());
    }
  }

  void update() {
    for (Particle2 p : particles) {
      p.update();
    }
  }

  void setEmitter(float x, float y) {
    for (Particle2 p : particles) {
      if (p.isDead()) {
        p.rebirth(x, y);
      }
    }
  }

  void display() {

    shape(particleShape);
  }
}

class ParticleSystem3 {
  ArrayList<Particle3> particles;

  PShape particleShape;

  ParticleSystem3(int n) {
    particles = new ArrayList<Particle3>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle3 p = new Particle3();
      particles.add(p);
      particleShape.addChild(p.getShape());
    }
  }

  void update() {
    for (Particle3 p : particles) {
      p.update();
    }
  }

  void setEmitter(float x, float y) {
    for (Particle3 p : particles) {
      if (p.isDead()) {
        p.rebirth(x, y);
      }
    }
  }

  void display() {

    shape(particleShape);
  }
}

class Particle3 {

  PVector velocity;
  float lifespan = 255;
  
  PShape part;
  float partSize;
  
  PVector gravity = new PVector(0,+1);


  Particle3() {
    partSize = random(10,30);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(lluvia);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, lluvia.width, 0);
    part.vertex(+partSize/2, +partSize/2, lluvia.width, lluvia.height);
    part.vertex(-partSize/2, +partSize/2, 0, lluvia.height);
    part.endShape();
    
    rebirth(width/2,height/2);
    lifespan = random(255);
  }

  PShape getShape() {
    return part;
  }
  
  void rebirth(float x, float y) {
    
    float s = second();
    float f3 = 40;

    if (s > 35 && s < 10) {
      f3 = 40;
    }
    else {
      f3 = s;
    }
    
    
    float a = random(TWO_PI);
    float speed = random(0.5,f3);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = 255;   
    part.resetMatrix();
    part.translate(x, y); 
  }
  
  boolean isDead() {
    if (lifespan < 0) {
     return true;
    } else {
     return false;
    } 
  }
  

  public void update() {
    lifespan = lifespan - 8;
    velocity.add(gravity);
    
    part.setTint(color(255,lifespan));
    part.translate(velocity.x, velocity.y);
    
  }
}



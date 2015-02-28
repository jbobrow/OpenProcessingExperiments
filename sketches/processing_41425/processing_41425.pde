
int numParticles = 100;


GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 800);
  noStroke();
  smooth();

  for (int i = 0; i < p.length; i++) {
    if (random(20) > 8) {
      float velX = random(-100, 1);//-100 affects frequecy of burst. This way puffs slowly turn into fountain effect.
      float velY = random(-10, 3);
      p[i] = new aParticle(width, height, velX, velY, 100, width/2, height/2);//100 affects magnification of objects
    }
    else {
      if (random(20)<4) {
        float velX = random(-100, 1);  
        float velY = random(-1, 1);
        p[i] = new bParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
      }
      else {
        float velX = random(-100, 1);
        float velY = random(-1, 1);
        p[i] = new cParticle(width/2, height/2, velX, velY, 2.0, width/2, height/2);
      }
    }
  }
}
void draw() {
  fill(0);//sets background color
  rect(0, 0, width, height);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

class Particle {
  float x, y; 
  float vx, vy; 
  float radius; 
  float gravity = 0.006;//gravity at 0 will cause it to flow upward..space bound
  //composition shows gravity(lightning down) and anti-gravity (cells moving up)

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx/100;//affects spread
    vy = vely/50;
  }

  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {
    fill(155, 240, random(300));//random color elements set
    rect(x, y, random(50), random(50));//random rectangle sizes
  }
}

class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}

class aParticle extends GenParticle {

  aParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x =width/2;
      y = height;
      vx = random(-10.0, 10.0);
      vy = random(-4.0, 8.0);
    }
  }
  void display() {
    noFill();
    strokeWeight(random(1, 2));
    fill(155, 240, random(300), 50);//random color elements set
    rect(x, y, random(50), random(50));//random rectangle sizes
  }
}

class bParticle extends GenParticle {

  bParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX+10;
      y = height;
      vx = random(-8.0, 15.0);   
      vy = random(-4.0, -20.0);
    }
  }
  void display() {//triangular portion-lightning
    fill(140, 87, 201, 50);
    strokeWeight(random(1, 2));//variation for intensity
    stroke(random(150, 200), random(100, 150), random(50, 100));
    quad(random(x), random(y), x+4, y+5, radius*random(3, 6), radius*random(3, 6), 100, 100);
  }
}

class cParticle extends GenParticle {//cellular 2--every variable needs a set consisting of these elements and variables

  cParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = width/2;
      y = height;
      vx = random(-5, 12.0);    
      vy = random(-16.0, 20.0);
    }
  }
  void display() {
    noFill();
    strokeWeight(random(1, 2));
    stroke(random(180, 200), random(100, 200), random(100, 200), 40);
    rect(x, y, random(16), random(16));
  }
}



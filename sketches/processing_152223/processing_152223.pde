
float ay;
float op;

class Particle {
  float x, y, vx, vy;
  color pColor;


  //constructor, initializes the attributes for particles
  Particle () {
    //where are the particles?
    this.x = random(width);
    this.y = random(height);
    //how fast are they going?
    this.vx = random(-10, 10);
    this.vy = random(-10, 10);
  }

  //method, a thing thats inside a class, asks a particle to do something
  void drawParticle() {
    float angle = atan2(vy, vx);
    fill(pColor);
    translate(this.x, this.y);
    rotate(angle);
    rect(-20, -5, 40, 10);
    rotate(-angle);
    translate(-this.x, -this.y);
    noStroke();
    
    
  }

  void updateParticle() {
    this.x += this.vx;
    this.y += this.vy;
    vy += ay;
  }
}

//-------end of Particles class-------\\

//global variable are not in any brace, thats why they are global
ArrayList<Particle> particles;
ArrayList<Float> x, y, vx, vy;

void setup() {
  size(2000, 1500); 
  particles = new ArrayList<Particle>();
  op = 0;
  ay = 0.1; 
  //how many particles do we want?
}

void mouseClicked() {
  
  color particleColor = color(random(255), random(255), random(255));   
  

  for (int i = 0; i < 100; i++) {
    Particle p = new Particle();
    p.x = mouseX;
    p.y = mouseY;
    p.pColor = particleColor;
    particles.add(p);

    frameCount = 0;
    
    //r = random(255);
    //g = random(255);
    //b = random(255);
    
  }
  op = 255;
} 

void update() {
  if (op > 0) {
    op -= frameCount / 30;
  } else {
    particles.clear();
  }
  //giving velocity
  for (Particle p : particles) {
    //p.x += p.vx is shorthand for p.x = p.x + p.vx
    p.updateParticle();

    println(op);
  }
}
void draw() {
  //background(random(10, 500), random(10, 500), random(10, 500)); 

  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  //fill(r, g, b, op);
  update(); 

  //type name + variable: <-- (inside) draws the particle
  for (Particle p : particles) { 
    //type of particle
    p.drawParticle();
  }
}


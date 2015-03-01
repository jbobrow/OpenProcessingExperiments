
class Particle {
  float x, y, vx, vy;

  //constructor, initializes the attributes for particles
  Particle() {
    //where are the particles?
    this.x = random(width);
    this.y = random(height);
    //how fast are they going?
    this.vx = random(-5, 5);
    this.vy = random(-5, 5);
  }

  //method, a thing thats inside a class, asks a particle to do something
  void drawParticle() {
    float angle = atan2(vy, vx);
    translate(this.x, this.y);
    rotate(angle);
    rect(-20, -5, 40, 10);
    rotate(-angle);
    translate(-this.x, -this.y);
    //ellipse(this.x, this.y, random(10, 30), random(10, 30));
    noStroke();
  }

  void updateParticle() {
    this.x += this.vx;
    this.y += this.vy;

    //this.vy = this.vy + 0.05; //<-- gravity

    //Bouncing (top and bottom)
    //if (this.y > height || this.y < 0) {
      //this.vy = -this.vy;
      //this.y += this.vy;
    }

    //bouncing (left and right)
    //if (this.x > width || this.x < 0) {
      //this.vx = -this.vx;
      //this.x += this.vx;
    }
  //}
  //-------end of Particles class-------\\

  //global variable are not in any brace, thats why they are global
  ArrayList<Particle> particles;

  void setup() {
    size(2000, 1500); 
    particles = new ArrayList<Particle>();
    //how many particles do we want?
   
  }
  void mouseClicked() {
      Particle p = new Particle();
      p.x = mouseX;
      p.y = mouseY;
      particles.add(p);
  }

  void update() {
    //giving velocity
    for (Particle p : particles) {
      //p.x += p.vx is shorthand for p.x = p.x + p.vx
      p.updateParticle();
    }
  }
  void draw() {
    //background(random(10, 500), random(10, 500), random(10, 500)); 

    fill(0, 0, 0, 10);
    rect(0, 0, width, height);
    fill(#7AEDEA);
    update(); 

    //fill(random(100, 500), random(100, 500), random(1000, 500));

    //type name + variable: <-- (inside) draws the particle
    for (Particle p : particles) { 
      //type of particle
      p.drawParticle();
    }
  }
//}


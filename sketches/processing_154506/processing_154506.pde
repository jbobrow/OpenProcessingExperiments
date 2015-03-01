
ArrayList<Particle> particles = new ArrayList<Particle>();

color randomColor() {
  float r = random(50, 200);
  float g = random(50, 200);
  float b = random(50, 200);
  float a = random(150);
  color c = color(r, g, b, a);

  return (c);
}

void createParticles(int numParticles) {
  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle(random(width), random(height), random(-15, 15), random(-5, 5), random(-5, 5), randomColor()));
  }
}

void setup() {
  size(1000, 1000 );
  createParticles(2000);
  noStroke();
}
void update(){
  for(Particle p: particles){
   p.updateParticle(); 
}
}

 void draw() {
  background (255);
  update();
  for(Particle p : particles){
   p.drawParticle(); 
  }
}

class Particle {
  float x, y, radius;
  float vx, vy;
  color c;

  Particle() {
    this.x = 10;
    ;
    this.y = 10;
    ;
    this.radius = random(-15, 15);

    this.vx = 5;
    this.vy = 5;

    this.c = randomColor();
  }
  Particle(float x, float y, float radius, float vx, float vy, color c) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.vx = vx;
    this.vy = vy;
    this.c = c;
  }
  void makeRandom() {
    this.x = random(displayWidth);
    this.y = random(displayHeight);
    this.vx = random(-15, 15);
    this.vy = random(-15, 15);
  }
  void updateParticle() {
    this.x += this.vx;
    this.y += this.vy;
    if(x >= width || x<= 0){
      this.vx = -(this.vx);
    }
    if(y >=height || y<= 0){
    this.vy = -(this.vy);
    }
    
  }
  void drawParticle() {
    fill(this.c);
    ellipse(this.x, this.y, this.radius, this.radius);
  }
};





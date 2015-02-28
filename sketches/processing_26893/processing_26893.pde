
Particle[] particle = new Particle[10];

boolean button = false;


void setup () {
  size(1000,500);
  frameRate(30);
  smooth();
  background(255);
  noStroke();

  for (int i = 0; i < particle.length; i++) {
    particle[i] = new Particle(random(1,299),random(height));
  }
}

void draw() {
  float d = dist(500,250,mouseX,mouseY);
  background(d);
  
  for (int i = 0; i < particle.length; i++) {
    particle[i].display();
    particle[i].move();
    if (particle[i].x >= width) {
      Particle p = new Particle(random(width),random(height));
      particle = (Particle[]) append(particle,p);
    }
    if (particle[i].x <= 0){
      particle = (Particle[]) reverse(particle);
      particle = (Particle[]) shorten(particle);
    }
  }
}
 
  void keyPressed() {
    noLoop();
    for (int i = 0; i < particle.length; i++) {
    if (particle[i].x <= 0){
      particle = (Particle[]) reverse(particle);
      particle = (Particle[]) shorten(particle);
    }
  }
  }
  void keyReleased() {
    loop();
  }

void mousePressed () {
  Particle p = new Particle(mouseX,mouseY);
  particle = (Particle[]) append(particle,p);
}




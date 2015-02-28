
Particles ParticleSystem;
String s;
int selected;
void setup() {
  size(800, 200, P2D);
  int maxParticles = 19600;
  ParticleSystem = new Particles( maxParticles ); 
  /*
  ParticleSystem.spawnCircleFactor = 0.20;
   ParticleSystem.deathCircleFactor = 0.20;
   ParticleSystem.spawnAnnulusFactor = 0.44;
   ParticleSystem.deathAnnulusFactor = 0.20;
   */
  // inherited phi = bouncing swarm...
  ParticleSystem.spawnCircleFactor = 0.65;
  ParticleSystem.deathCircleFactor = 0.05;
  ParticleSystem.spawnAnnulusFactor = 0.0;
  ParticleSystem.deathAnnulusFactor = 0.75;

  for (int i = 0; i < maxParticles; ++i) {
    ParticleSystem.addParticle( random(width), random(height) );
  }
  textMode(SCREEN);
  loadPixels();
  selected = 0;
}

void draw() {
  ParticleSystem.updateParticles();
  ParticleSystem.moveParticles();
  s = "radius: " + (sqrt(ParticleSystem.rSq));

  Arrays.fill(pixels, 0);

  int xy, p;
  for (int i = 0; i < ParticleSystem.total(); ++i) {

    xy =  ParticleSystem.getX(i) + ParticleSystem.getY(i)*width;
    p = min((pixels[xy] & 0xFF) + 1, 0xFF);
    pixels[xy] = min(0xFF0000, (p<<21)) + min(0xFF00, (p<<11)) + p;
  }

  updatePixels();
  s = "Number of particles: " + ParticleSystem.total();
  text(s, 10, 18);
  s = "Radius: " + int(sqrt(ParticleSystem.rSq));
  text(s, 10, 36);
  s = "Circle spawn rate: " + ParticleSystem.spawnCircleFactor;
  text(s, 10, 54);
  s = "Circle death rate: " + ParticleSystem.deathCircleFactor;
  text(s, 10, 72);
  s = "Annulus spawn rate: " + ParticleSystem.spawnAnnulusFactor;
  text(s, 10, 90);
  s = "Annulus death rate: " + ParticleSystem.deathAnnulusFactor;
  text(s, 10, 108);
  text('>', 2, 36 + selected*18);
  if (ParticleSystem.total() == 0){
    text("Press SPACE to respawn", 10, 126);
  }

}



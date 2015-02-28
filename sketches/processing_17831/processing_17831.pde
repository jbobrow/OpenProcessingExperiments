
import traer.physics.*;

ParticleSystem physics;
Particle points;
  Word w,w2,w3,w4;
void setup()
{
  size(600,600,P3D);
 
physics = new ParticleSystem(0,0.05);
//w = new Word("Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! ",physics);
w = new Word("Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words !",physics);
frameRate(30);
background(0);
}

void draw()
{
  fill(255,80);
  rect(0,0,width,height);
//  background(255);
  w.update();
  w.draw();
  physics.tick();
}



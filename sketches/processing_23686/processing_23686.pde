
import traer.physics.*;
ParticleSystem physics = new ParticleSystem();
int pcount = 500;
Particle[] gup = new Particle[pcount];
Particle[] sup = new Particle[pcount];
float h=0; //hue variable
float z=0;
int p;
int ring_radius = 135;
Spring[] Innersprings = new Spring[pcount*2];
void setup()
{
  size(500,500);
  background(255);
  colorMode(HSB,255);
  float h = random(255);
  physics.setIntegrator( ParticleSystem.MODIFIED_EULER );
}

void draw()
{
  physics.tick();
  strokeWeight(3);
  stroke((h+(z*0.9))%255,255-(z*0.1),z*0.9,20);
  z++;
  for (int i=0; i<pcount; i++)
  {
    gup[int(i)] = physics.makeParticle(1.0,i+20+i/pcount,i*2-i/pcount,0);
  }
  for (int p=0;p<pcount;p++)
  {
    //line(gup[p].position().x(),gup[p].position().y(), 250,250);
    line(gup[p].position().x(),gup[p].position().y(),gup[int(random(p))].position().x(),gup[int(random(p))].position().y());
  }
  for (int l=0; l<pcount; l++)
  {
    Innersprings[l] =  physics.makeSpring(gup[l], gup[int(random(p))],.1, 0, 250);
  }
}
                

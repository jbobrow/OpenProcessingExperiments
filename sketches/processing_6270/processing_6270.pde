
int numparticles =1000;
particle[] particles;

void setup()
{
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  rectMode(CENTER);
  particles = new particle[numparticles];
  for(int i=0; i<numparticles; i++)
  {
    particles[i] = new particle(random(450, width-20), random(450, height-20), 10, 10, 5, 0.9,
                             color(0, 0, 0, 255));
  }
}

void draw()
{
  background(255);
  for(int i=0; i<numparticles; i++)
  {
    particles[i].collide();
    particles[i].move();
    particles[i].render();
  
    particles[i].xspeed*=particles[i].dampfactor;
    particles[i].yspeed*=particles[i].dampfactor;
  }
}



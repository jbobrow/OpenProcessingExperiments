
//  basic settings
 
int NUM_PARTICLES = 1200;
int WIDTH = 600;
int HEIGHT = 500;
 
ParticleSystem p;
void setup()
{
  smooth();
  size(600,500);
  background(0);
  p = new ParticleSystem();
}
 
void draw()
{
  noStroke();
  fill(248,39,255,1);
  rect(0,0,width,height);
  p.update();
  p.render();
}
 
class Particle
{
  PVector position, velocity;
  int offset;
  
  Particle()
  {
    position = new PVector(random(WIDTH),random(HEIGHT));
    velocity = new PVector(); 
    offset = int(random(2));
    
  }
  
  void update()
  {
    velocity.x = 2*(noise(mouseX/10+position.y/100)-0.5);
    velocity.y = 2*(noise(mouseY/10+position.x/100)-0.5);
    position.add(velocity);
    
    if(position.x<0)position.x+=WIDTH;
    if(position.x>WIDTH)position.x-=WIDTH;
    if(position.y<0)position.y+=HEIGHT;
    if(position.y>HEIGHT)position.y-=HEIGHT;
  }
 
  void render()
  {
    stroke(255,230,39);
    line(position.x,position.y,position.x-velocity.x,position.y-velocity.y);
  }
}
class ParticleSystem
{
  Particle[] particles;
  
  ParticleSystem()
  {
    particles = new Particle[NUM_PARTICLES];
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      particles[i]= new Particle();
    }
  }
  
  void update()
  {
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      particles[i].update();
    }
  }
  
  void render()
  {
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      particles[i].render();
    }
  }
}

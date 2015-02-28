
class Particle
{
  PVector position, velocity;
 
  Particle()
  {
    position = new PVector(random(width),random(height));
    velocity = new PVector();
  }
   
  void update()
  {
    velocity.x = mouseY/1.5*(noise(mouseX*100/.1+position.y/100)-0.5);
    velocity.y = mouseX/1.5*(noise(mouseY*2/.1+position.x/100)-0.5);
    position.add(velocity)*21;
     
    if(position.x<10)position.x+=width;
    if(position.x>width)position.x-=width;
    if(position.y<120)position.y+=height;
    if(position.y>height)position.y-=height;
  }
 
  void render()
  {
    stroke(mouseX/1.5,mouseY/1.5,random(0,255),random(2,95));
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
int NUM_PARTICLES = 3000;
ParticleSystem p;
void setup()
{
  smooth();
  size(820,820);
  background(10,0);
  //frameRate:(30);
  p = new ParticleSystem();
}
 
void draw()
{

  noStroke();
  fill(0,random (50));
  rect(0,0,width,height);
  p.update();
  p.render();
}



                
                                                                                                                                                                                                                                                

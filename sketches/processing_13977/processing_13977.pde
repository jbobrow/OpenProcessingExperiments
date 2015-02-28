
//Code from Starkes and ms noh edited by Rolland Leung

int NUM_PARTICLES = 1000;
ParticleSystem p;
void setup()
{
  smooth();
  size(500,500);
  background(0);
  noStroke();
  p = new ParticleSystem();
}
 
void draw()
{
    noStroke();
  fill(0,30);
  ellipse(170,50,50,50);
  ellipse(250,20,100,100);
  ellipse(500,500,300,300);
  ellipse(250,500,100,100);
  ellipse(10,200,300,300);
  ellipse(500,20,200,200);
  p.update();
  p.render();
  
  float a = random(-30,30);
  float i = random(10,180);
  ellipse(mouseX+a,mouseY+a,i,i);
  //fill(random(150),random(20),35,random(200));
  
}


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
    velocity.x = 20*(noise(mouseX/10+position.y/100)-0.5);
    velocity.y = 20*(noise(mouseY/10+position.x/100)-0.5);
    position.add(velocity);
     
    if(position.x<0)position.x+=width;
    if(position.x>width)position.x-=width;
    if(position.y<0)position.y+=height;
    if(position.y>height)position.y-=height;
  }
 
  void render()
  {
    stroke(255);
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
                

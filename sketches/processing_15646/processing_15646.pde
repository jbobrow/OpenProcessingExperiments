
//Particle system from Starkes, edited by Rolland Leung

float radius;
float x;
float y;
float xball;
float yball;
float xspeed = 2;
float yspeed = 1;
float speed = 10;
int NUM_PARTICLES = 1000;
ParticleSystem p;

void setup() 
{
  smooth();
  size(400,400);
  background(0);
  noStroke();
  p = new ParticleSystem();
}

void draw() 
{
  noStroke();
  fill(0,5);
  radius = random(25);
  xball = xball + xspeed;
  yball = yball + yspeed;
  y = y + speed;
  x = x + speed; 
  //stroke(0);
  fill(0);
  ellipse(xball,yball,random(55),random(55));
  ellipse(300,y,radius,radius);
  ellipse(x,100,radius,radius);

  if(x > 400) {
    speed = -10; 
    x = x + speed;
  }
  if(speed == -10) {
    if (x == 0) {
      speed = 10;
    }
  }

  if(y > 400) {
    speed = -10; 
    y = y + speed;
  }
  if(speed == -10) {
    if (y == 0) {
      speed = 10;
    }
  }

  if(xball>400) {
    xspeed = -2;
  }
  if(xball<0) {
    xspeed = +2;
    {
      if(yball>400) {
        yspeed =-random(50);
      }
      if(yball<0) {
        yspeed = random(50);
      }
    }
  }
    p.update();
    p.render();

    float a = random(-30,30);
    float i = random(10,180);
    
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
  


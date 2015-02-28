
VectorField vectorField                          ;
Particle[] particles = new Particle[ 700 ]      ;
int numP             = particles.length          ;
int c                = int(sqrt(numP))           ;
int i                                            ;
int j                                            ;
float minDist = 80                               ;
float spring  = .07                              ;
float visc    = .99                              ;
int fieldRes = 20                              ;

void setup()
{
  size(300,300, P2D)                          ;
  smooth()                                     ;
  vectorField = new VectorField(fieldRes)        ;
  
  
  for(i = 0; i < numP; i++)
  {
    PVector loc = new PVector(random(width), height/2 + i);
    particles[i] = new Particle(loc, floor(random(5,10)),5,.15);
  }
}

void draw()
{
  background(255)                      ;
  vectorField.display()                ;
  
  particlesRepulse()                   ;
  
  for(i = 0; i < numP; i++)
  {
    Particle p = (Particle) particles[i]; 
    p.run();
    p.follow(vectorField);
  }
}

void particlesRepulse()
{
  for(i = 0; i < numP - 1; i++)
  {
    Particle pA = (Particle) particles[i];
    for(j = i + 1; j < numP; j++)
    {
      Particle pB = (Particle) particles[j];
      
      float dx       = pB.loc.x - pA.loc.x;
      float dy       = pB.loc.y - pA.loc.y;
      float distABsq = dx *dx + dy *dy;
      float distAB   = sqrt(distABsq);
      
      float force = pA.mass * pB.mass / distABsq;
      float accX  = force * dx / distAB * spring;
      float accY  = force * dy / distAB * spring;

      if(distAB < minDist)
      {
        pA.vel.x  -= accX / pA.mass * visc;
        pA.vel.y  -= accY / pA.mass * visc;
        
        pB.vel.x  += accX / pB.mass * visc;
        pB.vel.y  += accY / pB.mass * visc;
      }
    }
  }
}
      
      
    
void mousePressed()
{
  vectorField = new VectorField(fieldRes)            ;
  for(i = 0; i < numP; i++)
  {
    Particle p = (Particle) particles[i]; 
    p.loc.x    = random(width);
    p.loc.y    = random(height);
    p.vel.x    = 0;
    p.vel.y    = 0;
  }
  
}



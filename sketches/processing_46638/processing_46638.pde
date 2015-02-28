
float[] x,y;
int[] lifespan;
float oldX, oldY;

int maxLifespan = 120;
float taper = 60.0;
float noiseScale = 0.001;
int particleCount = 150;
int generationsPerFrame = 50;
float frameOffset = 0.0;

void setup()
{
  size(900, 450);
  
  x = new float[particleCount];
  y = new float[particleCount];
  lifespan = new int[particleCount];
  background(255);
}
  
void draw()
{
  smooth();
  noFill();
  strokeWeight(1.0);
  strokeCap(SQUARE);
  stroke(0, 0, 0, 20);
  for(int gen=0; gen < generationsPerFrame; gen++)
  {
    for(int i=0; i < particleCount; i++)
    {
      oldX = x[i];
      oldY = y[i];
      
      //increment all variables
      x[i] += 20 * (0.5 - noise(x[i]*noiseScale, y[i]*noiseScale, frameOffset + 0));
      y[i] += 20 * (0.5 - noise(x[i]*noiseScale, y[i]*noiseScale, frameOffset + 1));
      lifespan[i]--;
      
      line(oldX, oldY, x[i], y[i]);
      
      //if a particle has "died", reinitialize it
      if(lifespan[i] < 0)
      {
        x[i] = random(width+200)-100;
        y[i] = random(height+200)-100;
        
        lifespan[i] = (maxLifespan/2) + random(maxLifespan/2);
      }
    }
  }
}

void mousePressed()
{
  background(255);
  frameOffset = random(10.0);
  noiseScale = 0.0005 + random(0.007);
  
}                                                               

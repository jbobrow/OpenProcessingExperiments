
class particle
{
  private PVector po;
  private float idx;
  public particle(int id, float x, float y, float z)
  {
    po = new PVector(x,y,z);
    idx = id;
  }

  public void draw(float t)
   {
        float noiz = noise(po.x/300, po.z/300, t/250)*250;
        
        float dx = isoX(po.x, po.y + noiz, po.z);
        float dy = isoY(po.x, po.y + noiz, po.z);
        
        float subZ= max(0.5,10-((po.z+po.x)/100));
        
        stroke(100+(subZ*14));
        fill(100+(subZ*14));
        

        
        ellipse(dx, dy+height *0.7, subZ, subZ);
   }
}



float xOrigin=0;
float yOrigin=0;
float t=0;

var particles = new Array();

void setup()
{
  // setup() runs once
  size(840, 480);
  smooth();
  
  xOrigin = width/2;
  yOrigin = height / 2;
 
  for(int i = 0; i < 480; i+=24)
  {
     for(int j = 0; j < 480; j += 24)
     {
       particle np=new particle(i,i,0, j);
       particles.push( np );
     }
  }
  background(0);
}


void draw()
{
  background(0);
  stroke(255);
  
  for(int i = 0; i < particles.length; i++)
  {
    particle cp = particles[i];
    cp.draw(t);
    
  }
  t += 1;
}

float isoX(float x, float y, float z)
{ 
  float xCart = ( x - z ) * cos(0.46365); 
  float xI = xCart + xOrigin; 
  return xI; 
}

float isoY(float x, float y, float z) 
{ 
  float yCart = y + ( x + z) * sin(0.46365); 
  float yI = 0-yCart + yOrigin; 
  return yI; 
}

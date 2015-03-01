
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
        PVector spos = mapToSphere(po.x+t,po.y,po.z);
        float dx = isoX(spos.x, spos.y, spos.z);
        float dy = isoY(spos.x, spos.y, spos.z);
        
        float subZ= 5-((spos.z+spos.x)/34);
        
        stroke(100+(subZ*14));
        fill(100+(subZ*14));
        ellipse(dx, dy, subZ, subZ);
   }
}



float xOrigin=0;
float yOrigin=0;
float t=0;

var particles = new Array();

void setup()
{
  // setup() runs once
  size(350, 480);
  smooth();
  
  xOrigin = width/2;
  yOrigin = height / 2;
 
  //720/3 = 240
  //240/10 = 24
  for(int i = 0; i < 24; i++)
  {
     for(int j = 0; j < 24; j++)
     {
       particle np=new particle(i,0-360 + (i*30), 0 - 360 + (j*30), width / 3);
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

PVector mapToSphere(float x, float y, float r)
{
  float longitude = x / r;
  float latitude = 2 * atan(exp(y/r)) - PI/2;

  return new PVector(r * cos(latitude) * cos(longitude),  r * cos(latitude) * sin(longitude),  r * sin(latitude));
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

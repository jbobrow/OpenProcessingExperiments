
class particle
{
  private PVector po;
  private PVector pn;
  private float idx;
  
  private int r, g, b;
  
  public particle(int id, float x, float y, float z)
  {
    po = new PVector(x,y,z);
    pn = po;
    idx = id;
    r = random(255);
    g = random(255);
    b = random(255);
  }
 
  public void draw(float t)
   { 
        po = pn;
        
        float drx = round(getRandom(-1,1));
        float dry = round(getRandom(-1,1));
        float drz = round(getRandom(-1,1));
        
        pn = new PVector(po.x + drx * 10, po.y + dry * 10, po.z + drz*10);
        if(pn.x > cubeDim/2)
        {
            pn.x = cubeDim/2;
             
        }
        if(pn.x < 0-cubeDim/2)
        {
            pn.x = 0-cubeDim/2;
             
        }
        if(pn.y > cubeDim/2)
        {
            pn.y = cubeDim/2;
             
        }
        if(pn.y < 0-cubeDim/2)
        {
            pn.y = 0-cubeDim/2;
             
        }
        if(pn.z > cubeDim/2)
        {
            pn.z = cubeDim/2;
             
        }
        if(pn.z < 0-cubeDim/2)
        {
            pn.z = 0-cubeDim/2;
            
        }
       
        float dx = isoX(po.x, po.y, po.z);
        float dy = isoY(po.x, po.y, po.z);
        float x = isoX(pn.x, pn.y, pn.z);
        float y = isoY(pn.x, pn.y, pn.z);
        
        float subZ= max(0.5,10-((pn.z+pn.x)/100));
         
        stroke(r, g, b);
        strokeWeight(subZ/2);
        line(dx, dy, x, y);
        
        stroke(255);
        strokeWeight(subZ/3);
        
        line(dx, dy, x, y);
   }
}
 
 
 float getRandom(min, max) {
    return min + Math.floor(Math.random() * (max - min + 1));
}
 
 
float xOrigin=0;
float yOrigin=0;
float t=0;

float cubeDim = 200;
 
var particles = new Array();
 
void setup()
{
  // setup() runs once
  size(840, 480);
  smooth();
   
  xOrigin = width/2;
  yOrigin = height / 2;
  
  frameRate(19);
  
  for(int i = 0; i < 9; i+=1)
  {
       particle np=new particle(i,0,0,0);
       particles.push( np );
  }
  background(0);
}
 
 
void draw()
{

  stroke(255);
  strokeWeight(1);
  fill(0,0,0,30);

  
  beginShape();
  vertex(isoX(0-cubeDim/2, 0-cubeDim/2, cubeDim/2), isoY(0-cubeDim/2, 0-cubeDim/2, cubeDim/2));
  vertex(isoX(cubeDim/2, 0-cubeDim/2, cubeDim/2), isoY(cubeDim/2, 0-cubeDim/2, cubeDim/2));
  vertex(isoX(cubeDim/2, cubeDim/2, cubeDim/2), isoY(cubeDim/2, cubeDim/2, cubeDim/2));
  vertex(isoX(0-cubeDim/2,cubeDim/2, cubeDim/2), isoY(0-cubeDim/2,cubeDim/2, cubeDim/2));
  endShape(CLOSE);
  
  beginShape();
  vertex(isoX(0-cubeDim/2, 0-cubeDim/2, 0-cubeDim/2), isoY(0-cubeDim/2, 0-cubeDim/2, 0-cubeDim/2));
  vertex(isoX(cubeDim/2, 0-cubeDim/2, 0-cubeDim/2), isoY(cubeDim/2, 0-cubeDim/2, 0-cubeDim/2));
  vertex(isoX(cubeDim/2, 0-cubeDim/2, cubeDim/2), isoY(cubeDim/2, 0-cubeDim/2, cubeDim/2));
  vertex(isoX(0-cubeDim/2,0-cubeDim/2, cubeDim/2), isoY(0-cubeDim/2,0-cubeDim/2, cubeDim/2));
  endShape(CLOSE);
  
  
  beginShape();
  vertex(isoX(cubeDim/2, 0-cubeDim/2, 0-cubeDim/2), isoY(cubeDim/2, 0-cubeDim/2, 0-cubeDim/2));
  vertex(isoX(cubeDim/2, 0-cubeDim/2, cubeDim/2), isoY(cubeDim/2, 0-cubeDim/2, cubeDim/2));
  vertex(isoX(cubeDim/2, cubeDim/2, cubeDim/2), isoY(cubeDim/2, cubeDim/2, cubeDim/2));
  vertex(isoX(cubeDim/2,cubeDim/2, 0-cubeDim/2), isoY(cubeDim/2,cubeDim/2, 0-cubeDim/2));
  endShape(CLOSE);
  
   
  for(int i = 0; i < particles.length; i++)
  {
    particle cp = particles[i];
    cp.draw(t);
  }
  
  stroke(255);
  strokeWeight(1);

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


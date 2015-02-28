
//import processing.opengl.*;

static int numBlades = 1000;
static int lifeTime = 10;
PVector[] grassBladePositions = new PVector[numBlades];
PVector[] grassBladeVelocities = new PVector[numBlades];
color[] grassBladeColour = new color[numBlades];
float [] grassBladeFloppiness = new float[numBlades];
PVector gravity = new PVector(0.0f,-0.098f,0.0f);
float fVelocitySpread  = 0.5f;
float fPatchWidth = 20.0f;

float fStartWidth = 0.3f;
float fWidthStep = fStartWidth / lifeTime;

PVector windVelocity = new PVector(random(-0.0f,0.0f),0.0f,random(-0.0f,0.0f));
PVector windDirection = new PVector(random(-0.005f,0.005f),0.0f,random(-0.005f,0.005f));

float fMaxVelocity = 0.1f;

void setup()
{
  size(512,512,P3D);
  
  for(int i=0;i<numBlades;i++)
  {
    float x = random(fPatchWidth*2.0f);
    x-=fPatchWidth;
    float z = random(fPatchWidth*2.0f);
    z-=fPatchWidth;
    
    grassBladePositions[i] = new PVector(x,0.0,z);
    
     float fVX = (random(1.0f)-0.5f) * fVelocitySpread;
     float fVZ = (random(1.0f)-0.5f) * fVelocitySpread;    
    grassBladeVelocities[i] = new PVector(fVX,1.0,fVZ);
    grassBladeVelocities[i].normalize();
    grassBladeVelocities[i].mult(random(0.8f,1.3f));
    
    grassBladeColour[i] = color(random(0,40),random(100,255),random(0,50));
    
    grassBladeFloppiness[i] = random(0.0f,0.8f);
    
  }
}

void draw()
{
  beginCamera();
  camera(0.0,10,34.0,
          0.0,0.0,0.0,
          0.0,-1.0,0.0);
          
  perspective(45.0f, float(width)/float(height), 
            0.1f, 100.0f);        
  endCamera();
  background(0x7,0xFF,0xFC); 
  
  stroke(0x4e,0x41,0x09);
  fill(0x4e,0x41,0x09);
  beginShape(QUADS);
  
  float fBase = fPatchWidth + 5.0f;
  
  vertex(fBase,0.0f,fBase);
  vertex(-fBase,0.0f,fBase);
  vertex(-fBase,0.0f,-fBase); 
  vertex(fBase,0.0f,-fBase);   
  endShape();
  
  if(random(50)<1)
  {
     windDirection = new PVector(random(-0.005f,0.005f),0.0f,random(-0.005f,0.005f));
  }
  
  windVelocity.add(windDirection);
  if(windVelocity.mag() > fMaxVelocity)
  {
    windVelocity.normalize();
    windVelocity.mult(fMaxVelocity);
    windDirection = new PVector(random(-0.005f,0.005f),0.0f,random(-0.005f,0.005f));
  }
  

  PVector vEnd = new PVector();
  PVector vVel = new PVector(); 
  PVector vTangent = new PVector();
  
  
  beginShape(QUADS);
  
  for(int i=0;i<numBlades;i++)
  {
    vEnd.set(grassBladePositions[i]); 
    vVel.set(grassBladeVelocities[i]);
    
    vTangent = vVel.cross(new PVector(0.0f,1.0f,0.0f));
    vTangent.normalize();
    
  //  vertex(vEnd.x,vEnd.y,vEnd.z);
  //  vertex(vEnd.x+vTangent.x,vEnd.y+vTangent.y,vEnd.z+vTangent.z);
  
    stroke(grassBladeColour[i]);
    fill(grassBladeColour[i]);   
    float fGrassWidth = fStartWidth;

      PVector vAddMe = new PVector();
      vAddMe.set(vTangent);
      vAddMe.mult(fGrassWidth);

    for(int j=0;j<lifeTime;j++)
    {

      
      vertex(vEnd.x + vAddMe.x,vEnd.y + vAddMe.y,vEnd.z + vAddMe.z);
      vertex(vEnd.x - vAddMe.x,vEnd.y - vAddMe.y,vEnd.z - vAddMe.z);
        
      vEnd.add(vVel);
      vVel.add(gravity);
      vVel.x += windVelocity.x * grassBladeFloppiness[i];
      vVel.y += windVelocity.y * grassBladeFloppiness[i];
      vVel.z += windVelocity.z * grassBladeFloppiness[i];   
      fGrassWidth-=fWidthStep;
      vAddMe.set(vTangent);
      vAddMe.mult(fGrassWidth);
      vertex(vEnd.x - vAddMe.x,vEnd.y - vAddMe.y,vEnd.z - vAddMe.z);
      vertex(vEnd.x + vAddMe.x,vEnd.y + vAddMe.y,vEnd.z + vAddMe.z);
      
      if(vVel.y < 0 && vEnd.y < 0.5f)
      {
        j=lifeTime;
      }  

    }
  }
  endShape();
}


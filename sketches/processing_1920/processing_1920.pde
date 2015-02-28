
final int maxBlades = 200;
int numBlades = 200;
int lifeTime = 10;
PVector gravity = new PVector(0.0f,-0.098f,0.0f);
float fVelocitySpread  = 0.5f;
float fPatchWidth = 20.0f;

float fStartWidth = 0.3f;
float fWidthStep = fStartWidth / lifeTime;
float fTime = 0.0f;

HaltonSequence positionsequence = new HaltonSequence();
HaltonSequence velocitysequence = new HaltonSequence();

PVector windVelocity = new PVector(random(-0.0f,0.0f),0.0f,random(-0.0f,0.0f));
PVector windDirection = new PVector(random(-0.005f,0.005f),0.0f,random(-0.005f,0.005f));

float fMaxVelocity = 0.1f;

void setup()
{
  size(512,512,P3D);
}

void draw()
{
  beginCamera();
  camera(0.0,20,34.0,
          0.0,0.0,0.0,
          0.0,-1.0,0.0);
          
  perspective(45.0f, float(width)/float(height), 
            0.1f, 100.0f);        
  endCamera();
  background(0x7,0xFF,0xFC); 
  

  fill(51,192,83);
  beginShape(QUADS);
  
  float fBase = fPatchWidth + 5.0f;
  
  vertex(fBase,0.0f,fBase);
  vertex(-fBase,0.0f,fBase);
  vertex(-fBase,0.0f,-fBase); 
  vertex(fBase,0.0f,-fBase);   
  endShape();
  
  
  if(keyPressed == true)
  {
    if(key==CODED)
    {
      if(keyCode == UP)
      {
          numBlades += 1;
      }
      else if(keyCode == DOWN)
      {
          numBlades = max(0,numBlades-1);
      }
    }    
  }
  
  ambientLight(40,40,40);
  directionalLight(0x47,0xFF,0xFC,-0.7,-0.7,-0.7);
  directionalLight(0x47,0xFF,0xFC,0.7,-0.7,0.7);
  directionalLight(0x47,0xFF,0xFC,-0.7,-0.7,0.7);
  directionalLight(0x47,0xFF,0xFC,0.7,-0.7,-0.7);
  
  
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
 
  
  positionsequence.Reset();
  velocitysequence.Reset();
  PVector position = new PVector();
   
  for(int i=0;i<numBlades;i++)
  {
    positionsequence.Increment();
    
    position.set(positionsequence.m_CurrentPos);
    position.x -=0.5f;
    position.y = 0.0f;
    position.z -=0.5f;
    position.mult(fPatchWidth*2.0f);
    
    for(int k=0;k<7;k++)
    {
      vEnd.set(position);
      velocitysequence.Increment();    
      vVel.set(velocitysequence.m_CurrentPos);
      vVel.x  = (vVel.x-0.5) * fVelocitySpread;
      vVel.y = max(vVel.y , positionsequence.m_CurrentPos.y) * 1.5f;
      vVel.z  = (vVel.z-0.5) * fVelocitySpread; 
      
      float floppiness = velocitysequence.m_CurrentPos.y;
      floppiness*=floppiness;
      
      vTangent = vVel.cross(new PVector(0.0f,1.0f,0.0f));
      vTangent.normalize();
      noStroke();
      fill(0xFF008000);   
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
        vVel.x += windVelocity.x * floppiness;
        vVel.y += windVelocity.y * floppiness;
        vVel.z += windVelocity.z * floppiness;   
        fGrassWidth-=fWidthStep;
        vAddMe.set(vTangent);
        vAddMe.mult(fGrassWidth);
        vertex(vEnd.x - vAddMe.x,vEnd.y - vAddMe.y,vEnd.z - vAddMe.z);
        vertex(vEnd.x + vAddMe.x,vEnd.y + vAddMe.y,vEnd.z + vAddMe.z);
        
        if(vVel.y < 0 && vEnd.y < 0.5f)
        {
          break;
        }  
  
      }
    }
  }
  
  endShape();
}


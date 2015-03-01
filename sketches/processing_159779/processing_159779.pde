
Agent[] agents = new Agent[500]; 
int agentsCount =500;
float noiseScale = 200, noiseStrength = 10, noiseZRange = 0.4;
float overlayAlpha = 80, agentsAlpha = 90, strokeWidth = 0.3;

float age = 100;
float r = 50;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup(){
  size(600,600);
  smooth();
  background(255);
  for(int i=0; i<agents.length; i++) agents[i] = new Agent();

}

void draw(){
  
  background(0);
 
   for(int i=0; i<agentsCount; i++) {
               
      stroke(0, 140, 220 );
      agents[i].update();
      
        }
strokeWeight(5);
stroke(255);
line(mouseX-r, mouseY-r, mouseX+r, mouseY+r);

}




class Agent {
  PVector p, pOld;
  float noiseZ, noiseZVelocity = 0.01;
  float stepSize, angle;
  
      
    float theta = random(0, 0.5*PI);
    float disX;
    float disY;

  Agent() {

    
    p = new PVector(mouseX-r,mouseY-r);
    pOld = new PVector(p.x,p.y);
    stepSize = random(1,5);
    // init noiseZ
    setNoiseZRange(0.4);
    

  }

  void update(){
    angle = noise(p.x/noiseScale, p.y/noiseScale, noiseZ) * noiseStrength;
    

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;
    
  
 
    if ((p.y<-0)||(p.x<-0)) {
      p.y=pOld.y= mouseY-r;
      p.x=pOld.x= mouseX-r;
    }
    if ((p.y>height) || (p.x>width)){
      p.y=pOld.y=mouseY-r;
      p.x=pOld.x=mouseX-r;
    }

    strokeWeight(strokeWidth*stepSize);
    line(pOld.x,pOld.y, p.x,p.y);

    pOld.set(p);
    noiseZ += noiseZVelocity;
    
    
  }

  void setNoiseZRange(float theNoiseZRange) {
    // small values will increase grouping of the agents
    noiseZ = random(theNoiseZRange);
  }
}









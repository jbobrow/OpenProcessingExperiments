
class Branch 
{ 
  PVector loc; 
  PVector oloc; 
  PVector aloc; 
  PVector gloc; 
  PVector vel; 
  PVector acc; 
  float inA; 
  float inAngle; 
  float inDistance; 
  float RinAngle; 
  float RinDistance; 
  boolean brTrigger; 
 
  Branch(PVector l, float a, float d, float rd) 
  { 
    brTrigger=false; 
    loc = l.get(); 
    oloc = l.get(); 
    gloc = l.get(); 
    inDistance=d; 
    inAngle=rd; 
    inA=a; 
    float rD=random(-jitRatDistance*d,jitRatDistance*d); 
    float rRd=random(-jitRatAngle,jitRatAngle); 
    RinDistance=inDistance+rD; 
    RinAngle=inAngle+rRd; 
    acc = new PVector(inA*cos(RinAngle), inA*sin(RinAngle)); 
    vel = new PVector(0,0); 
    aloc = new PVector(RinDistance*cos(RinAngle), RinDistance*sin(RinAngle)); 
    gloc.add(aloc); 
  }   
   
  void update() 
  { 
    vel.add(acc); 
    loc.add(vel); 
    float ud = PVector.dist(oloc,loc);
    if(ud > RinDistance) 
    { 
      brTrigger=true; 
    } 
  }  
   
  void render() 
  { 
    stroke(15); 
    point(loc.x,loc.y); 
    noStroke(); 
    fill(15); 
    int rCol =int(random(100)); 
    if(80<=rCol) 
    { 
      stroke(15); 
      fill(255); 
    } 
    if(brTrigger==true) 
    { 
      ellipse(gloc.x,gloc.y,diameter,diameter); 
    } 
  } 
   
  boolean timeToBranch() 
  { 
    if (brTrigger==true) 
    { 
      return true; 
    } 
    else 
    { 
      return false; 
    } 
  } 
 
  Branch branch(float brA) 
  { 
    float newInAngle = inAngle + brA; 
    return new Branch(loc,inA,inDistance,newInAngle); 
  }  
} 


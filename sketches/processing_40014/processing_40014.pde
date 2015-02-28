

class Bullet{
  
  PVector loc = new PVector();  
  float angle;  
  Cannon c;  
  int age = 0;  
  PVector center;  
  PVector turret;  
  Bullet(Cannon c, float x, float y)  
  {  
    this.c = c;  
    loc.x = x;  
    loc.y = y;  
    center = new PVector(c.loc.x,c.loc.y);  
    turret = new PVector(c.cX,c.cY);  
  }  


  void run(){
  
    noStroke();  
    fill(255,50,50);  
    ellipse(loc.x,loc.y,4,4);  
    PVector vel = PVector.sub(turret,center);  
    loc.add(new PVector(vel.x/8,vel.y/8));  
    age++;  
    if (age>50)  bullets.remove(this);  
  }  
} 



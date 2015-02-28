
Pendulum[] pendulums;
int nPend = 10;

void setup(){
  size(600,600);
  //frameRate(10);

  pendulums = new Pendulum[nPend];
  for (int i = 0; i < nPend; i++){
    pendulums[i] = new Pendulum();
    pendulums[i].ang = (-1)^(i+1)*(-45);
    pendulums[i].armLength = 50;
    
    if(i > 0){
      pendulums[i].setJoined(pendulums[i-1]);
    }
  }

}

void draw(){
  background(255);
  translate(width/2,30);
  pendulums[nPend-1].update();
  pendulums[nPend-1].display();
}

class Pendulum
{
  float originX;
  float originY;
  float x;
  float y;
  float armLength;
  float ang;
  float aVel;
  float aAcel;
  float grav = 1; 
  float damping = .991; 
  Pendulum joined;
  
  void update()
  {
    aAcel = (-1*grav)*sin(radians(ang));
    aVel += aAcel;
    ang += aVel;
    aVel *= damping;

    x = originX + armLength*sin(radians(ang));
    y = originY + armLength*cos(radians(ang));
    
    if(joined != null)
    {
      joined.setOrigin(x,y);
      joined.update();
    }
  }
  
  void display()
  {
    line(originX,originY,x,y);
    ellipse(x,y,5,5);
    
    if(joined != null)
    {
      joined.display();
    }
  }
  
  void setJoined(Pendulum joined)
  {
    this.joined = joined;
  }
  
  void setOrigin(float x, float y)
  {
    originX = x;
    originY = y;
  }
}

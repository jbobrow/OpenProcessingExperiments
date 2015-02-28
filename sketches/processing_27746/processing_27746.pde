
void render()
{

  for(int i=0;i<balls.size();i++) {
       strokeWeight(1);
    Ball temp = (Ball) balls.get(i);
    temp.update(xs); 
  }
}
  

class Ball
{
  PVector pos,vel,acc;
  float radius;
  float gravity = -.02;
  float h;
  Ball()
  {
    radius = random(10,30);
    pos = new PVector(0,1000);
    vel = new PVector(random(-5,1),0);
    acc = new PVector(0,gravity);
 
  }
  void update(float[][] inxs)
  {
    pos.add(vel);
    vel.add(acc);
   
    render();
    if(pos.y>200)
    {
     
   
    }
  }
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(255,10);
    stroke(255,50);
    smooth();
    ellipse(0,0,radius,radius);
    ellipse(radius-11*(radius/10),radius-12*(radius/10),radius/5,radius/5);
    noSmooth();
    popMatrix();
         radius = radius-0.01;
    if (pos.y<250){
      radius=0;
    }
  }
}



class particle
{
  float theta, u;
  float vTheta, vU;
  float x,y,z;
   
  particle(float Theta, float U)
  {
    theta = Theta;
    u = U;
    vTheta = 0;
    vU =0;
  }
  void update()
  {
    vTheta+=random(-0.01,0.01);
    theta+=vTheta;
    if(theta<0||theta>TWO_PI)
    {
      vTheta*=-1;
    }
     
    vU+=random(-0.001,0.001);
    u+=vU;
    if(u<-1||u>1)
    {
      vU*=-1;
    }
     
    vU*=0.95;
    vTheta*=0.95;
     
    x = radius*cos(theta)*sqrt(1-(u*u));
    y = radius*sin(theta)*sqrt(1-(u*u));
    z = u*radius;
 
  }
   
  void render()
  {
    pushMatrix();
      translate(x,y,z);
      box(2);
      //sphere(2);
    popMatrix();
  }
}



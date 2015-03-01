
float delta=1;

void setup()
{
  size(600,600,P3D);
}

void draw()
{
  background(255);
  
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  
    for(float deg=0, r=0, z=0; deg<7200; deg+=delta){
      float theta=radians(deg);
      r=deg/15;
      z=deg/8;
      float x=r*cos(theta);
      float y=r*sin(theta);
      point(x,y,z);
    }
  
}

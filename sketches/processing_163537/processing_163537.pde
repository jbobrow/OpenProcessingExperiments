
float curdeg=0;

void setup()
{
  size(600,600, P3D);
  frameRate(20000);
}

void draw()
{
  background(50);
  translate(width/2,height/2,0);
  
  curdeg+=3;
  rotateY(radians(curdeg));
  
  stroke(200,150,0);
  for(float a=0 ; a<150; a+=10)
  {
  for(float deg=0 ; deg<5400 ; deg+=1)
  {
    float deg1=deg/30;
    float deg2=deg;
    float pi=radians(deg1);
    float theta=radians(deg2);
    float x1=a*sin(pi)*cos(theta);
    float z1=a*sin(pi)*sin(theta);
    float y1=300*cos(pi);
    point(x1,y1,z1);
  }
}
}
  

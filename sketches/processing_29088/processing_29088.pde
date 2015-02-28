
void setup()
{ 
  size(600,600,P3D);
  background(0);
  smooth();
}


float a=2,t=0;
float i=1;
float x=0,y=0,z=0;
float m;

void draw()
{
  noStroke();
  translate(300,100); 

  if((t<=500)&&(i<1200))
  { 
    x=a*cos((t));
    y=a*sin((t));
    z=a*radians(t);


    translate(x,y,z);

    t-=0.9; 
    a+=2.5;


    fill(0,random(150,255),50,40);

    sphere(i);
    i+=0.8;
  }
}



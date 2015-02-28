
void setup()
{
size(500,300); 
smooth();
frameRate(3);
}


float radius=100;
float x,y;
float lastx=-999;
float lasty=-999;
int centx=250;
int centy=150;

float radius1;

void draw()
{
background(255); 

float radiusNoise = random(10);
stroke(0, random(30));

for(float ang=0;ang<1440;ang+=5)
{
 radiusNoise+=0.5;
  float rad = radians(ang);
  radius1=radius+(noise(radiusNoise)*200)-100;
  x=centx+radius1*(cos(rad));
  y=centy+radius1*(sin(rad));
  if(lastx>-999)
  {
    line(250,150,lastx,lasty);
  }
  lastx=x;
  lasty=y;
}
}




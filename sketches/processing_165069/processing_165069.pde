
float angle  = 0;
float radius = 0;

float stepangle  = radians(15);
float stepradius = 1;

size(250,250);
translate(width/2,height/2);
strokeWeight(5);
stroke(150);

for(int n=0 ; n<5*24 ; n++)
{
  angle  += stepangle;
  radius += stepradius;
  
  float x = radius*cos(angle);
  float y = radius*sin(angle);
  
  point(x,y);
}





{
  background(26, 72, 118);
}
float angle  = 0;


float radius = 0;
float stepangle  = radians(15);
float stepradius = 1;
size(300,300);
translate(width/2,height/2);
strokeWeight(9);
stroke(120);
for(int n=0 ; n<5*24 ; n++)
{
  angle  += stepangle;
  radius += stepradius;
  float x = radius*cos(angle);
  float y = radius*sin(angle);
  point(x,y);
}




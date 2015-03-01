
float angle =0;
float radius =0;

float stepangle = radians(10);
float stepradius =1;

size(300,300);
translate(width/3,height/3);
strokeWeight(6);
stroke(80);

for(int n=0 ; n<100 ; n++)
{
  angle += stepangle;
  radius += stepradius;
  
  float x = radius*cos(angle);
  float y = radius*sin(angle);
  
  point(x,y);
}



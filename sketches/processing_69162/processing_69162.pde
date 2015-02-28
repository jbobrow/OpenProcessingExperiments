
// Keana Moezzi, CP1 modes 4-5, Loops Assignment
// url: http://ilovestarsandsmiles.webs.com/

size(500, 500);
noFill();
smooth();

float r=30;
float g=144;
float b=255;
int c=0;
while(c<500)
{
  stroke(r,g,b);
  line(c,0,c,500);
  c=c+1; 
  r=r+(255-30)/500.0;
  g=g+(20-144)/500.0;
  b=b+(147-255)/500.0;
}

stroke(255, 255, 255, 127);  
int m=400;
while (m>9)
{
  ellipse(250, 250, m, m);
  m=m-20;
}

stroke( 205,16,118);
strokeWeight(3);
int pink = 0;
while( pink < 301)
{
  ellipse(250,250,150,pink);
  pink = pink + 25;
}

stroke(0,0,255);
int h = 10;
int loop=0;
while (loop<150)
{
  ellipse(250-loop, 250, 100, h);
  ellipse(250+loop, 250, 100, h);
    h=h+10;
  loop=loop+5;
}

stroke(0,255,127);
int green = 0;
while( green < 301)
{
  ellipse(250,250,green,140);
  green = green + 25;
}

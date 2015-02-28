
// new script
// new script
//
float x,y;
float px,py;
float ang;
float radius;
void setup()
{
size(800，800);
background(127);
radius = 0.01;
ang = 0;
}
void draw()
{
px = x;
py = y;
ang = ang+PI/100;
radius = radius+0.5;
x = sin(ang)*radius+width/2;
y = cos(ang)*radius+height/2;
if(ang > 1)
{
if(radius<width/2)
{
strokeWeight(radius/5);
stroke(255);
line(px,py,x,y);
stroke(0);
strokeWeight(100-radius/5);
line(px,py,x,y);
}
}
}

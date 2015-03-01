
float a=0;
float b=0;
float c=0;
void setup()
{
background(0,0,255);
size(1000,1000);
}
void draw()
{
noStroke();
fill(0);
arc(500,500,300,300,radians(a),radians(a+180));
fill(255);
arc(500,500,300,300,radians(a+180),radians(a+360));
fill(0);
arc(500,500,200,200,radians(b),radians(b+180));
fill(255);
arc(500,500,200,200,radians(b+180),radians(b+360));
fill(0);
arc(500,500,100,100,radians(c),radians(c+180));
fill(255);
arc(500,500,100,100,radians(c+180),radians(c+360));
c=c+1.5;
b=b+1;
a=a+0.5;
}

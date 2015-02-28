
float distance=.1;
float distance2=.1;
float rotation=.1;
float color=.1;
void setup()
{
size(600,600);
background(0);
}
void draw()
{
frameRate(10000000000000000);
fill(color/2,color,255-color);
translate(300,300);
rotate(rotation);
ellipse(distance,0,20,20);
ellipse(400-distance2,0,20,20);
distance=distance+.05;
distance2=distance2+.07;
rotation=rotation+100;
color=color+.05;
}

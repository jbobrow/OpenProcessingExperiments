
float x,y;
void setup() 
{
size(800,400);
x=width/2;
y=height/2;
}

void draw()
{
background(x,y,100);
ellipse(x,y,60,30);
x = x+y;
y = y+x;
if ((x >= width)||(y >=height))
{
 fill(random(100,250),random(60,200),100);
 strokeWeight(random(6,12));
 x = random(0,width);
 y = random(0,height); 
}
}

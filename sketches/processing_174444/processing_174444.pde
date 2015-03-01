
float x,y;
void setup()
{
size(800,400);
x=width/2;
y=height/2;
background(255);
}
 
void draw()
{
stroke(random(100,250),random(60,200),100);
point(x,y);
x = x+y;
y = y+x;
if ((x >= width)||(y >=height))
{
 strokeWeight(random(6,12));
 x = random(0,width);
 y = random(0,height);
}
if(mousePressed){
x = 400;
y = 200;
}
}


float x = 50;
float y = 100;

float speed = 2;

void setup()
{
size(500,300);
background(255,200,150);
smooth();
}

void draw()
{
//ellipse(width/2,height/2,100,100);
//ellipse(mouseX,mouseY,100,100);
x= x+speed;
ellipse(x,y,50,50);
}

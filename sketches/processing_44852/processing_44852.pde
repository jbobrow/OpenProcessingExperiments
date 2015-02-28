

float x,y =0;
float moveSpeed=1;


void setup()
{
  size (400, 400) ;
  smooth();
}

void draw()

{
 background(0);
 y=y-moveSpeed;
 ellipse(x,y,25,25); 
}

void mousePressed ()
{
x=mouseX;
y=mouseY;
}


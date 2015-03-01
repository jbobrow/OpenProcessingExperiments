
int y = 0;
int x=0;

int b=(0);
float v= random (255);
float r = random (255);
float a = random (255);
void setup()
{background (255);
  size(200,200);
  frameRate (7);
}
void draw()
{
fill (r,v,a);
 rect (x, y, width/10,height/10);
  x=x+width/10;
  
r=r+1;
v=v+2;
a=a+3;
 if (x >= width ){;x=0;y=y+width/10;
}
 
}
 
 


/* @pjs preload="sonic.png, 1933.jpg, gipsey.jpg"; */
PImage myimage;
PImage myimage2;
PImage myimage3;
void setup()
{size (400,400);

myimage = loadImage ("sonic.png");
myimage2 = loadImage ("1933.jpg");
myimage3 = loadImage ("gipsey.jpg");

  myimage2.filter(POSTERIZE, 4);
}

void draw ()
{
  image(myimage,0,0,width,height);
 

  
  image (myimage2, width/2,height/2, 100,100);
  

 
  filter (POSTERIZE, 5);



image (myimage3, width/3, height/3,100,100);

for (int x= 0; x <width; x = x +5)
{
line(x,0,x, height);
}
for (int y=0; y <height; y= y +5)
{line (0,y,width,y);}
float ly = 0.0;
float lx = 0.0;

while (lx <width)
{
float nextX = lx + random (1,10);
float nextY = ly + random (50);
line(lx,ly,nextX,nextY);
lx = nextX;
ly = nextY;
}

}




/* @pjs preload="simon.jpg,nope.png"; */
PImage myimage;
PImage myimage2;

void setup ()
{size (400,400);
myimage = loadImage ("simon.jpg");
myimage2 = loadImage ("nope.png");
filter (DILATE);
}

void draw()
{



  image (myimage,0,0,width,height);
  image (myimage2,242,256,width/8,height/8);

 println(mouseX,mouseY);
{ ellipse(248,162,10,10);
 ellipse(228,169,10,10);
fill(0,0,255);
  rect(237,201,20,10);
  fill(255,0,0);}
  
  
  filter (ERODE);

  
for (int x= 0; x <width; x= x +3)
 { 
line(x,0,x,height);
 } 
for (int y=0; y<height; y =y+3)
{line (0,y,width,y);}
float ly = 0.0;
float lx =0.0;

while (lx <width)
{
  float nextX = lx +random (10);
  float nextY = ly + random (10,11);
  line(lx,ly,234,210);
  lx = nextX;
  ly = nextY;
  stroke(0,0,0);
}
}




float dist, x, y, x2, y2, xvel, yvel, x2vel, y2vel, r, s;
PImage pow, batman, joker, boom;

void setup()
{
  x=200;
  y=200;
  x2=100;
  y2=300;
  xvel=5;
  yvel=3;
  x2vel=-2;
  y2vel=6;
  size(400, 400);
  pow = loadImage("pow.jpg");
  imageMode(CENTER);
  batman = loadImage("batman.jpg");
  imageMode(CENTER);
  joker = loadImage("joker.jpg");
  imageMode(CENTER);
  boom = loadImage("boom.jpg");
  imageMode(CENTER);
  
  frameRate(60);
}
void draw()
{
  background(0);
  image(batman, x, y, 100, 100);
  image(joker, x2, y2, 100, 100);
  x=x+xvel;
  y=y+yvel;
  x2=x2+x2vel;
  y2=y2+y2vel;
  
  if ((x>width+25) || (x<-25))
  {
    xvel=-xvel;
  }
  if ((y>height+25) || (y<-25))
  {
    yvel=-yvel;
  }
 
  if ((x2>width+50) || (x2<-50))
  {
    x2vel=-x2vel;
  }
  if ((y2>height+50) || (y2<-50))
  {
    y2vel=-y2vel;
  }
  if (dist(x, y, x2, y2)<140)
  { if (x>x2)
    {
     image( pow, width/2, height/2, width, height);
    }
    if (x<x2)
    {
      image( boom, width/2, height/2, width, height);
    }
  }
    

     
}





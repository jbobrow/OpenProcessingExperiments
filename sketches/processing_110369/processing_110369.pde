
PImage gusta;
PImage yup;
PImage ohmy;

void setup()
{
  size(500,500);
  gusta = requestImage("gusta.jpg");
  yup = requestImage("yup.jpeg");
  ohmy = requestImage("ohmy.jpeg");
  frameRate(15);
}


void draw ()
{
  
  if (gusta.width >0)
  {
    //gusta.filter(BLUR);
    image(gusta,0,0,width,height);
    image(yup,0,0,100,100);
    image(ohmy,400,400,100,100);
  }
 
   int xx = 0;//grid X
   int yy = 0; // grid y
   strokeWeight(2);
  while (xx < width)
  {
    stroke(100,100,105);
    line(xx,0,xx,height);
    xx += 15;
  }
  while (yy < height)
  {
    stroke(100,100,105);
    line(0,yy,width,yy);
    yy += 25;
  }
 
 

  
  
  // lines
  
  stroke(#F50000);
  strokeWeight(5);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextx = lx + 20;
    float nexty=  ly + random(15,25);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }
  
    ly = 0.0;
   lx = 0.0;
  while (lx < width)
  {
    float nextx = lx + random(50);
    float nexty=  ly + random(50);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }
  strokeWeight(1);
 
 
}



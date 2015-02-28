
PImage cat;
PImage nope;
PImage ddp;

void setup()
{
  size(573,479);
  cat = requestImage("cat.jpg");
  nope = requestImage("nope.jpg");
  ddp = requestImage("ddp.jpg");
  frameRate(15);
}


void draw ()
{
  if (cat.width >0)
  {
    cat.filter(INVERT);
    image(cat,0,0,width,height);
    image(nope,0,0,150,150);
    image(ddp,450,350,150, 150);
  }
   int xx = 0;//grid X
   int yy = 0; // grid y
   //strokeWeight(2);
  while (xx < width)
  {
    stroke(0,0,255);
    line(xx,0,xx,height);
    xx += 25;
  }
  while (yy < height)
  {
    stroke(0,255,0);
    line(0,yy,width,yy);
    yy += 25;
  }
  
  
  
  // lines
  
  stroke(#28E51C);
  strokeWeight(10);
  float ly = 150;
  float lx = 150;
  /*while (lx < width)
  {
    float nextx = lx + 10;
    float nexty=  ly + random(9,10);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }*/
  

  while (lx < 450)
  {
    float nextx = lx + random(50);
    float nexty=  ly + random(50);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }
  strokeWeight(1);
  
  
}



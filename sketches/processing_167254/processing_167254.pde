
void setup()
{
 background(0); 
 size(400,400);
}

void draw()
{
 base();
 roof();
 windows();
 door();
 doorhandle();
}

void base()
{
  fill(color(255));
  rect(100,199,200,200);
}

void roof()
{
  fill(color(80,33,33));
  triangle(100,199,300,199,200,150);
}

void windows()
{
  fill(color(97,210,199));
  rect(125,320,40,40);
  rect(235,320,40,40);
  rect(125,220,40,40);
  rect(235,220,40,40);
}

void door()
{
  fill(color(151,82,33));
 rect(175,300,50,100); 
}

void doorhandle()
{
  fill(color(127,127,127));
 ellipse(215,350,10,10);
}



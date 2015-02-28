
//Gregory Taxerman, Animation, CP1 16-17

int x = 10;
int z = 1;
float w = 0.25;

void setup ()
{
  size(300,300);
  fill(250,140,5);
  frameRate(30);
}

void draw()
{
  background(0);
  stroke(0,255,0);
  strokeWeight(w);
  ellipse(x,150,100,100);
  x = x + z;
  w = w + .3;

  if(x > 300)
  {
    x = 0;
  }
  counter ();
  fall ();
  rise ();
}

void counter ()
{
  stroke(255,0,0);
  strokeWeight(w);
  ellipse(300-x,150,100,100);
  x = x + z;
  w = w + .3;
}

void fall ()
{
  stroke(0,0,255);
  strokeWeight(w);
  ellipse(150,x+10,100,100);
  x = x + z;
  w = w + .3;
 
}

void rise ()
{
  stroke(233,250,8);
  strokeWeight(w);
  ellipse(150,300-x,100,100);
  x = x + z;
  w = w + .3;
  
}


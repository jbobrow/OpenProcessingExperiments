
ArrayList series;

int position;

PVector loc;
PVector step;

final float theta = TWO_PI*90/360;

//final int s = 50;
//final PVector c = new PVector(random(0+s,255-s), random(0+s,255-s), random(0+s,255-s));
final int hueTheme = (int)random(360);
final int hueRandomness = (int)random(80, 90);

void setup()
{
  size(600, 400);
  background(0);
  colorMode(HSB, 360);
  
  series = new ArrayList();
  series.add(true);
  
  for(int k = 0; k < 9; k++)
  {
    ArrayList newSeries = new ArrayList();
    newSeries.addAll(series);
    newSeries.add(true);
    newSeries.addAll(flip(series));
    series = newSeries;
  }
  
  position = 0;
  
  loc = new PVector(.3*width, .3*height);
  step = new PVector(0, 10);
}

ArrayList flip(ArrayList a)
{
  ArrayList flipped = new ArrayList();
  
  for(int i = a.size() - 1; i >= 0; i--)
  {
    Boolean b = (Boolean)(a.get(i));
    flipped.add(!b);
  }
  
  return flipped;
}

void draw()
{
  drawStep(getStep());
}

boolean getStep()
{
  if(position == series.size())
  {
    end();
    return false;
  }
  
  boolean turn = (Boolean)series.get(position);
  position++;
  
  return turn;
}

void end()
{
  noLoop();
}

void drawStep(boolean turn)
{
  //stroke(c.x + random(-d,d), c.y + random(-d,d), c.z + random(-d,d));
  stroke(hueTheme + random(-hueRandomness,hueRandomness), random(300,360), random(300,360));
  strokeWeight(5);
  
  PVector newLoc = PVector.add(loc, step);
  line(loc, newLoc);
  loc = newLoc;
  
  PVector newStep = new PVector();
  newStep.x = cos(theta)*step.x - sin(theta)*step.y;
  newStep.y = sin(theta)*step.x + cos(theta)*step.y;
  step = newStep;
  
  if(turn)
    step.mult(-1);
}

void line(PVector start, PVector end)
{
  line(start.x, start.y, end.x, end.y);
}
/*
PVector arc(PVector start, boolean direction, int radius)
{
  PVector end = start
}*/


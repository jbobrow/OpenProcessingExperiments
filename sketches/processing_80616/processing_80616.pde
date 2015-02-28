
PVector pos, vel, acc, center, mouseP;
int rad, radP, decayRate, numP;

void setup()
{
  size(window.innerWidth, window.innerHeight); 
  background(150);
  rad = 20;
  numP = 6;
  center = new PVector (width/2, height/2);
  pos = new PVector (width/2, height*.75);
  mouseP = new PVector();
  vel = new PVector (0, 0);
  acc = new PVector ();
}


void draw()
{
  background(150);
  ellipse(center.x, center.y, rad, rad);
  ellipse(pos.x, pos.y, rad, rad);



  if (mousePressed)
  {
    pos = new PVector (mouseP.x, mouseP.y);
    line(mouseP.x, mouseP.y, mouseX, mouseY);
    vel =  PVector.sub(mouseP, new PVector(mouseX, mouseY));
    ellipse(pos.x, pos.y, rad, rad);
    projection();
  }



  else
  {
    acc = PVector.sub(center, pos);
    acc.mult(.001);
    vel.add(acc);
    pos.add(vel);
  }
  
 
}

void mouseReleased()
{
  vel = PVector.sub(mouseP, new PVector(mouseX, mouseY));
  vel.mult(.05);
}

void mousePressed()
{
  mouseP = new PVector (mouseX, mouseY);
  vel = new PVector();
}

void projection()
{
  PVector futA, futV, futP;

  futP = pos;
  futA = PVector.sub(center, pos);
  futA.mult(.001);
  futV = vel;
  futV.mult(.05);
  futV = PVector.add(futV, futA);
  futP = PVector.add(futP, futV);

  int step = 5;

  for (int i = 1; i<numP*step; i++)
  {
    futA = PVector.sub(center, futP);
    futA.mult(.001);
    futV.add(futA);
    futP.add(futV);

    if (i%step == 0)
    {
      ellipse(futP.x, futP.y, rad-i/3, rad-i/3);
    }
  }
}


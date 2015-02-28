
void setup()
{
  size(200,200);
  
}
void draw()
{
  background(180, 200, 255);
  translate(width/2,height/2);
  
  for(int m=1 ; m<=60 ; m++ )
  {
    minuteTick(m);
  }
  
  for(int h=1 ; h<=12 ; h++ )
  {
    hourTick(h);
  }
  
  quarterTick(12);
  quarterTick(3);
  quarterTick(6);
  quarterTick(9);
  
  secondHand (second());
  hourHand (hour()+float(minute())/60);
  minuteHand (minute());
}

void quarterTick(int q)
{
pushMatrix();
float angle = radians(map(q, 0, 12, 0, 360));
rotate(angle);
strokeCap(ROUND);
stroke(100);
strokeWeight(9);
line(80, 0, 90, 0);
point(70, 0);
stroke(color(0, 0, 255));
strokeWeight(5);
line(80, 0, 90, 0);
point(70, 0);
popMatrix();
}

void hourTick(int h)
{
pushMatrix();
float angle = radians(map(h, 0, 12, 0, 360));
rotate(angle);
strokeCap(PROJECT);
stroke(100);
strokeWeight(5);
line(80, 0, 90, 0);
stroke(color(0, 200, 200));
strokeWeight(3);
line(80, 0, 90, 0);
popMatrix();
}
void minuteTick(int m)
{
pushMatrix();
float angle = radians(map(m, 0, 60, 0, 360));
rotate(angle);
strokeCap(ROUND);
stroke(150);
strokeWeight(3);
line(80, 0, 90, 0);
popMatrix();
}

void secondHand(float second)
{
  pushMatrix();
  float angle = radians(map(second(), 0,60, -90,270));
  rotate(angle);
  stroke(255,0,0);
  strokeWeight(1);
  line(0,0, 60,0);
  popMatrix();
  
}
  
void hourHand(float hour)
{ pushMatrix();
  float angle = radians(map(hour(), 0,12, -90,270));
  rotate(angle);
  stroke(0);
  strokeWeight(3);
  line(0,0, 40,0);
  popMatrix();
}

void minuteHand(float minute)
{ pushMatrix();
  float angle = radians(map(minute(), 0,60, -90,270));
  rotate(angle);
  line(0,0, 60,0);
  popMatrix();
}

  



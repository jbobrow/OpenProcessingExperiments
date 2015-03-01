



void setup()
{size(200, 200);}

void draw()
{background(20);
  translate(width/2, height/2);
  for (int m=1 ; m<=60 ; m++ )
  {minuteTick(m);  }
  for (int h=1 ; h<=12 ; h++ )
  { hourTick(h);
  }
  quarterTick(3);
  quarterTick(6);
  quarterTick(9);
  quarterTick(12);
  hourHand(hour()+float(minute())/60);
 minuteHand(minute());
  secondHand(second());
}void hourHand(float hour)
{  pushMatrix();
  pushStyle();
  rotate(hourAngle(hour));
  stroke(10);
  fill(220);
  strokeWeight(4);
  line(0,0, 20,0);
  bezier(20, 0, 30, 20, 40, 0, 60, 0);
  bezier(20, 0, 30, -20, 40, 0, 60, 0);
  popStyle();
  popMatrix();
}
void minuteHand(int minute)
{  pushMatrix();
  pushStyle();
  rotate(minuteAngle(minute));
  stroke(10);
  strokeWeight(4);
  bezier(0, 0, 10, 10, 30, 0, 70, 0);
  bezier(0, 0, 10, -10, 30, 0, 70, 0);
  popStyle();
  popMatrix();
}
void secondHand(int second)
{  pushMatrix();
  pushStyle();
  rotate(minuteAngle(second));
  stroke(120);
  strokeWeight(3);
  line(0, 0, 80, 0);
  fill(color(95,255,120));
  triangle(80, 0, 70, 7, 70, -7); 
  popStyle();
  popMatrix();
}
void quarterTick(int q)
{
  pushMatrix();
  float angle = hourAngle(q);
  rotate(angle);
  strokeCap(ROUND);
  stroke(100);
  strokeWeight(9);
  line(80, 0, 90, 0);
  point(70, 0);
  stroke(color(255, 0, 0));
  strokeWeight(5);
  line(80, 0, 90, 0);
  point(70, 0);
  popMatrix();
}
void hourTick(int h)
{
  pushMatrix();
  float angle = hourAngle(h);
  rotate(angle);
  strokeCap(PROJECT);
  stroke(100);
  strokeWeight(5);
  line(80, 0, 90, 0);
  stroke(color(0, 200, 0));
  strokeWeight(3);

line(80, 0, 90, 0);
  popMatrix();
}
void minuteTick(int m)
{
  pushMatrix();
  float angle = minuteAngle(m);
  rotate(angle);
  strokeCap(ROUND);
  stroke(150);
  strokeWeight(3);
  line(80, 0, 90, 0);
  popMatrix();
}
float hourAngle(float hour)
{
  return radians(map(hour, 0, 12, -90, 270));
}
float minuteAngle(float minute)
{
  return radians(map(minute, 0, 60, -90, 270));
}

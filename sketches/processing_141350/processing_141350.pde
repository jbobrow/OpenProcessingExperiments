
void setup()
{
size(400, 400);

}

void draw()
{
  background(204);
translate(width/2, height/2);
stroke(color(0,0,0));
ellipse(0,0, 377.5,377.5);

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

  
  pushMatrix();
  strokeWeight(4);
  stroke(color(0,0,100));
  float angle2 = radians(map(hour(), 0,12, -90, 270));
  rotate(angle2);
  line(0,0, 100,0);
  popMatrix(); 
   
  pushMatrix();
  strokeWeight(3);
  stroke(color(0,100,0));
  float angle1 = radians(map(minute(), 0,60, -90,270));
  rotate(angle1);
  line(0,0, 140,0);
  popMatrix();
  
  pushMatrix();
  strokeWeight(2);
  stroke(color(100,0,0));
  float angle = radians(map(second(), 0,60, -90,270));
  rotate(angle);
  line(-30,0, 140,0);
  popMatrix();
  
}


void quarterTick(int q)
{
  pushMatrix();
  float angle = radians(map(q, 0, 12, 0, 360));
  rotate(angle);
  strokeCap(ROUND);
  stroke(100);
  strokeWeight(9);
  line(160, 0, 180, 0);
  point(145, 0);
  stroke(color(0, 255, 0));
  strokeWeight(5);
  line(160, 0, 180, 0);
  point(145, 0);
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
  line(160, 0, 180, 0);
  stroke(color(255, 120, 0));
  strokeWeight(3);
  line(160, 0, 180, 0);
  popMatrix();
}

void minuteTick(int m)
{
  pushMatrix();
  float angle = radians(map(m, 0, 60, 0, 360));
  rotate(angle);
  strokeCap(ROUND);
  stroke(150);
  stroke(color(80,0,150));
  strokeWeight(3);
  line(160, 0, 180, 0);
  popMatrix();
 
}




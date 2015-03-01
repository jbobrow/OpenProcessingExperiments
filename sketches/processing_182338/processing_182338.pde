
float x, y;
void setup()
{
 
  size(800, 600);

  x = 0;
  y = 0;
}
void draw()
{
  
  size(800, 600);
  background(random(255),random(10),random(40));
  strokeWeight(9);
fill(random(3),random(400),random(200),random(200));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  x = x + 3;
  y = y + 3;


  if ((x>width)||(y>height))
  {
    stroke(random(100), random(255), random(200));
    x=random(0, width);
    y=random(0, height);
  }
}

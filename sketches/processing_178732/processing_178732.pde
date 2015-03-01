
float radius;
float angle;
float radiusIncrement;
float angleIncrement;

boolean outline = false;

void setup() 
{
  //size(displayWidth, displayHeight);
  size(800,800);
  background(20);

  radius = random(2);
  angle = random(2);

  radiusIncrement = random(0.20, 0.50);
  angleIncrement = random(0.20, 0.50);

  if (random(100) < 50)
  {
    outline = true;
  }
  else 
  {
    outline = false;
  }
}

void draw() 
{ 
  float x = radius * cos(angle);
  float y = radius * sin(angle);

  if (outline)
  {
    stroke(random(50));
  }
  else
  {
    noStroke();
  }

  smooth(4);
  fill(245);
  ellipse(x + width / 2, y + height / 2, 10, 10);

  if (radius < width)
  {
    angle += angleIncrement;
    radius += radiusIncrement;
  }
}

void mousePressed() 
{
  setup();
}

//boolean sketchFullScreen() 
//{
//  return true;
//}





boolean shouldDraw;
boolean hasDrawn;
int minSize = 5;
int maxSize = 20;
int radius = 10;
color startBG = color(51, 51, 51);
color endBG = color(255, 255, 255);
float velocityConstant = 0.5;

class Rectangle
{
  PVector position;
  PVector rotation;
  PVector velocity;
  float w;
  float h;
  float r;
  color c;
}

ArrayList <Rectangle> rectangles;

void setup()
{
  size(800, 600);
  background(startBG);
  rectMode(CENTER);
  rectangles = new ArrayList<Rectangle>();
}

void draw()
{
  update();
  background(lerpColor(startBG, endBG, (1 + sin(millis() * 0.0001)) / 2));
  for(Rectangle r : rectangles)
  {
      noStroke();
      pushMatrix();
      translate(r.position.x, r.position.y);
      rotate(r.rotation.z);
      fill(r.c);
      rect(0, 0, r.w, r.h, r.r);
      popMatrix();
  }
}

void update()
{
  if(shouldDraw && !hasDrawn)
  {
    drawBrushEffect();
  }
 
  for(Rectangle r : rectangles)
  {
    if(r.position.x < 0)
    {
      r.position.x = 1;
      r.velocity = calcReflection(r.velocity, fromAngle(90));
    }
    else if (r.position.y < 0)
    {
      r.position.y = 1;
      r.velocity = calcReflection(r.velocity, fromAngle(360));
    }
    else if (r.position.x > width)
    {
      r.position.x = width - 1;
      r.velocity = calcReflection(r.velocity, fromAngle(270));
    }
    else if (r.position.y > height)
    {
      r.position.y = height -1;
      r.velocity = calcReflection(r.velocity, fromAngle(180));
    }
 
    r.position.add(PVector.mult(r.velocity, velocityConstant));
  }
}

PVector fromAngle(float angle)
{
  return new PVector(cos(radians(angle)), sin(radians(angle)));
}

PVector calcReflection(PVector v, PVector n)
{ 
  return PVector.sub(PVector.mult(n, ( 2 * PVector.dot(v,n)/PVector.dot(n, n))), v);
}

void mousePressed()
{
  shouldDraw = true;
}

void mouseReleased()
{
  shouldDraw = false;
}

void mouseMoved()
{
  hasDrawn = false;
}

void mouseDragged()
{
  hasDrawn = false;
}

void drawBrushEffect()
{
  Rectangle r = new Rectangle(); 
  r.c = color(0, 183, 235, random(200));
  float randSize = minSize + random(maxSize);
  r.position = new PVector(mouseX + random(maxSize), mouseY + random(maxSize), 0);
  r.w = randSize;
  r.h = randSize;
  r.r = radius;
  r.rotation = new PVector(0.0, 0.0, radians(random(0,360)));
  r.velocity = fromAngle(random(0, 360));
  rectangles.add(r);
  hasDrawn = true;
}


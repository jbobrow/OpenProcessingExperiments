
Circle dottie;
Circle wheeliam;

void setup()
{
  ellipseMode(RADIUS);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  size(400, 400);
  
  wheeliam = new Circle(40, (width/2), (height/2), 120);
  dottie = new Circle(20, (width/2), (height/2), 0);
}

void draw()
{
  background(255);
  
  dottie.follow();
  dottie.draw();
  
  if (circlesCollided(dottie.xpos, dottie.ypos, wheeliam.xpos, wheeliam.ypos, dottie.radius, wheeliam.radius) == true)
  {
    wheeliam.hue = 0;
  }
  else
  {
    wheeliam.hue = 120;
  }
  wheeliam.draw();
}

class Circle
{
  int radius;
  int xpos;
  int ypos;
  int hue;
  
  Circle (int radiusn, int xposn, int yposn, int huen)
  {
    radius = radiusn;
    xpos = xposn;
    ypos = yposn;
    hue = huen;
  }
  
  void follow()
  {
    xpos = mouseX;
    ypos = mouseY;
  }
  
  void draw ()
  {
    noStroke();
    fill(hue, 100, 100);
    ellipse(xpos, ypos, radius, radius);
  }
}

boolean circlesCollided(float x1, float y1, float x2, float y2, float radius1, float radius2)
{
  if (dist(x1, y1, x2, y2) < (radius1 + radius2))
  {
    return true;
  }
  else
  {
    return false;
  }
}

boolean imagesCollided(PImage image1, PVector position1, PImage image2, PVector position2)
{
  boolean collided = false;
  if ((position1.x > (position2.x - image2.width / 2)) && (position1.x < (position2.x + image2.width / 2))
  && (position1.y > (position2.y - image2.height / 2)) && (position1.y < (position2.y + image2.width / 2)))
  {
    collided = true;
  }
  if (collided == true)
  {
    return true;
  }
  else
  {
    return false;
  }
}



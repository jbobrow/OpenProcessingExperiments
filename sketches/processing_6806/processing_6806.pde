

int timer;
int lastX;
int lastY;
int lastDripX;
int lastDripY;

void setup()
{
  size(800,600);
  //frameRate(60);
  timer = 0;
  lastX = lastDripX = mouseX;
  lastY = lastDripY = mouseY;
  fill(0);
  background(255);
  smooth();
  strokeJoin(ROUND);
}

void draw()
{
  fill(0);
  float d = dist(lastDripX, lastDripY, mouseX, mouseY);
  if (d > 200)
  {
    int numDrips = (int)random(3);
    randomCircles(mouseX, mouseY, numDrips, 2, 10, 10, 30);
    lastDripX = mouseX;
    lastDripY = mouseY;
  }
  int dx = abs(mouseX - lastX);
  int dy = abs(mouseY - lastY);
  if ((dx == 0) && (dy == 0))
  {
    strokeWeight(1);
  }
  else if (dist(mouseX,mouseY, lastX,lastY) < 2 )
  {
    strokeWeight(10);
  }
  else
  {
     strokeWeight(150/(dx+dy+15));
     timer = 0;
  }
  line(mouseX,mouseY, lastX,lastY);
  lastX = mouseX;
  lastY = mouseY;
  
  if (timer > 15)
  {
    clouds(15, 30, 10, 20);
    timer = (int)random(-50,15);
  }
  timer++;
}

void randomCircles(int x, int y, int numCircles, int minSize, int maxSize, int minDist, int maxDist)
{
  for(int i=0; i<numCircles; i++)
  {
    float r = minSize + random(maxSize-minSize);
    float offsetX = minDist + random(maxDist - minDist);
    float offsetY = minDist + random(maxDist - minDist);
    float flipX = random(1);
    if (flipX > 0.5) offsetX *= -1;
    float flipY = random(1);
    if (flipY > 0.5) offsetY *= -1;
    ellipse(x+offsetX, y+offsetY, r, r);
  }
}

void clouds(int minmin, int minmax, int maxmin, int maxmax)
{
  
  float minsize = random(minmin,minmax);
  float maxsize = minsize + random(maxmin,maxmax);
  
  for(int i=0; i<6; i++)
  {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(radians(random(360))); 
    beginShape();
    vertex(0, 0);
    bezierVertex(0, 0+random(minsize,maxsize), 0+random(minsize,maxsize), 0, 0, 0);
    bezierVertex(0, 0-random(minsize,maxsize), 0-random(minsize,maxsize), 0, 0, 0);
    bezierVertex(0+random(minsize,maxsize), 0, 0, 0-random(minsize,maxsize), 0, 0);
    bezierVertex(0-random(minsize,maxsize), 0, 0, 0+random(minsize,maxsize), 0, 0);
    endShape();
    popMatrix();
  }
  
}


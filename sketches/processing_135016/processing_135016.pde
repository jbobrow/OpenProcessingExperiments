
int value = 0;
float value2 = random(60);
float value3 = random(200);

float speed = 5;
float speed2 = 5;
float yspeed2 = 5;
float radius = 20;
float radius2 = 10;
float y = 250;
float x = 250;
float ty = 250;
float tx = 250;
float y2 = 200;
float x2 = 100;
float predatorX = 300;
float predatorY = 300;
float predatorRadius = 50;
float predatorSpeed = 5;


class Predator
{
  float size = 50;
  float speed = 5;
  PVector position = new PVector(300,300);
  PImage predatorImage;
  
  Predator()
  {
    this.predatorImage = requestImage("texas.jpg");
  }
  
  void update()
  {
    float toX = tx - this.position.x;
    float toY = ty - this.position.y;
    if (dist(tx, ty, this.position.x, this.position.y) < 100)
    {
      this. speed = speed +.05;
    }
    PVector direction = new PVector(toX, toY);
    direction.normalize();
    this.position.x += direction.x * this.speed;
    this.position.y += direction.y * this.speed;
  }
  void draw()
  {
    if (predatorImage.width > 0 && dist(tx, ty, this.position.x, this.position.y) > 20)
    {
      image(predatorImage, this.position.x, this.position.y, this.size, this.size);
    }
  }
}
Predator mypredator = new Predator();
Predator mypredator2 = new Predator();

void setup()
{
  size(500,500);
  noStroke();
  
  mypredator2.position.y = 10;
}
void draw()
{
  background(0);
  fill(255, 255, 255, 10);
  x = x + speed;
  if (x > height)
  {
    speed = -speed;
  }
  if (x < 0)
  {
    speed = -speed;
  }
  fill(value, value2, value3);
  ellipse(x, y, radius, radius);
  
  x2 = x2 + speed2;
  y2 = y2 + yspeed2;
  if (x2 > height)
  {
    speed2 = -speed2;
  }
  if (x2 < 0)
  {
    speed2 = -speed2;
  }
  if (y2 > height)
  {
    yspeed2 = -yspeed2;
  }
  if (y2 < 0)
  {
    yspeed2 = -yspeed2;
  }
  ellipse(x2, y2, radius2, radius2);
  value = value + 10;
  if (value > 255);
  {
    value = 0;
  }
  if (value2 > 255)
  {
    value2 = 0;
  }
  if (value3 > 255)
  {
    value3 = 0;
  }
  float distanceToX = dist(mypredator.position.x, mypredator.position.y, x, y);
  float distanceToX2 = dist(mypredator.position.x, mypredator.position.y, x2, y2);
 
  if (distanceToX < distanceToX2)
  {
    tx = x;
    ty = y;
  }
  else
  {
    tx = x2;
    ty = y2; 
  }
  mypredator.update();
  mypredator.draw();
  mypredator2.update();
  mypredator2.draw();
}
void mouseMoved()
{
  fill(255);
  rect(mouseX, mouseY, 10, 10);
}



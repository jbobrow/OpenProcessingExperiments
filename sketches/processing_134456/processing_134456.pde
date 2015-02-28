
float radius = 20;
float y = 50.0;
float x = 33;
float speed = 1;

float predatorX = 300;
float predatorY = 300;
float predatorRadius = 40;
float predatorSpeed = 2;

float easing = 0.05;

class Predator
{
  float size = 40;
  float speed = 2;
  PVector position = new PVector(300, 300);
  PImage img;
  
  Predator()
  {
    this.img = requestImage("wolf.jpg");
  }
  
  void update()
  {
    float toX = x - this.position.x;
    float toY = y - this.position.y;
  
    // Use easing to move with an acceleration
    // add the direction to the prey
    // but multiply by a small value (easing) to slow him down
    //predatorX += (toX * easing);
    //predatorY += (toY * easing);
  
    // check if predator is les than 200 away from prey and double speed if so
    if (dist(x, y, this.position.x, this.position.y) < 200)
    {
      this.speed = 4;
    }
  
    // Move at a constant speed
    PVector direction = new PVector(toX , toY);
    direction.normalize();
    this.position.x += direction.x * this.speed;
    this.position.y += direction.y * this.speed;
  }
  
  void draw()
  {
    //ellipse(this.position.x, this.position.y, this.size, this.size);
    if (img.width > 0 && dist(x, y, this.position.x, this.position.y) > 20)
    {
      image(img, this.position.x, this.position.y, this.size, this.size);
    }
  }
}

Predator mypredator = new Predator();
Predator mypredator2 = new Predator();

void setup() 
{
    size(500, 500);
    noStroke();
    
    mypredator2.position.y = 0;
}

void draw()
{
  fill(0,0,0, 10);
  rect(0,0,width,height);
  
  // speed up
  //speed += (speed * 0.01);
  
  y = y + speed;
  
  if (y > height)
  {
    speed = -speed;
  }
  if (y < 0)
  {
    speed = -speed;
  }
  
  fill(255);
  //float x = 33 + random(-3, 3);
  float waveSpeed = 0.5;
  float waveHeight = 10;
  x = 33 + sin(y * waveSpeed) * waveHeight;
  ellipse(x, y, radius, radius);
  
  mypredator.update();
  mypredator.draw();
  
  mypredator2.update();
  mypredator2.draw();
}




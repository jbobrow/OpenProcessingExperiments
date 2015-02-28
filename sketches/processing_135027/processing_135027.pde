
float radius = 20;
float y = 50.0;
float x = 33;
float speed = 1;
PImage img4;
PImage img3;
 
float predatorX = 300;
float predatorY = 300;
float predatorRadius = 40;
float predatorSpeed = 2;
 
float easing = 0.05;
 
class Predator
{
  float size = 100;
  float speed = 2;
  PVector position = new PVector(400, 400);
  PImage img;
   
  Predator()
  {
    this.img = requestImage("monster1.png");
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
   
    // check if predator is les than 100 away from prey and double speed if so
    if (dist(x, y, this.position.x, this.position.y) < 100)
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
    
    img4 = requestImage("hell.jpg");
    img3 = requestImage ("monster2.png");
     
    mypredator2.position.y = 0;
}
 
void draw()
{
  image(img4, 0, 0, width, height);
   
  // speed up
  //speed += (speed * 0.01);
   
  x = x + speed;
   
  if (y > height)
  {
    speed = -speed;
  }
  if (x < 0)
  {
    speed = -speed;
  }
   
  fill(255);
  //float x = 33 + random(-3, 3);
  float waveSpeed = 0.5;
  float waveHeight = 10;
  y = 33 + sin(x * waveSpeed) * waveHeight;
  image(img3,x, y, radius * 5, radius * 5);
  
  
  
  mypredator.update();
  mypredator.draw();
   
  mypredator2.update();
  mypredator2.draw();
}





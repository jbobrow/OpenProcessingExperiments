
Ball[] balls;

void setup(){
  size(800,800);
  ellipseMode(CENTER);
  noStroke();
  
  balls = new Ball[50];
  
  for(int i = 0; i < balls.length; i++)
  {
  balls[i]=new Ball();
  }
}

void draw()
{
  for(int i = 0; i < balls.length; i++)
  {
  balls[i].move();
  balls[i].draw();
  }
}









class Ball

{
  //data/Fields
  PVector location;
  PVector velocity;
  int size;

  Ball()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    size = int(random(10, 200));
  }
  
  void move() 
  {
    location.add(velocity);
    println(location.x);
  }

void checkBounce()
{
  if(location.x < 0 || location.x > width)
  velocity.x *= -1;
  if (location.y < 0 || location.y > height)
  velocity.y*=-1;
}
  
  void draw() 
  {
    if(dist(mouseX,mouseY,location.x,location.y) < size)
    fill(random(255),random(255),random(255),random(100));
    else fill(0);
    ellipse(location.x, location.y, size, size);
  }


void mousePressed()
{
  location.x = 0;
  location.y = 0;
}
}



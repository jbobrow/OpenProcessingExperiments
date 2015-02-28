
//Simple graphics demo
//Ben Richards

//Variables
float x = 150;
float y = 0;
float vx = 16;
float vy = 0;
float radius = 50;
float gravity = 2;


void setup()
{
  size(500,500);
  
  fill(255,0,0);
  stroke(128,0,0);
  strokeWeight(radius * 0.1);
}


void draw()
{
  //Accelerate
  vy = vy + gravity;
  
  //Move
  x = x + vx;
  y = y + vy;
  
  //Bounce
  if(x > width-radius)
  {
    vx = -abs(vx);
    x = width-radius;
  }
  if(x < radius)
  {
    vx = abs(vx);
    x = radius;
  }
  
  if(y > height-radius)
  {
    vy = -abs(vy);
    y = height-radius;
  }
  if(y < radius)
  {
    vy = abs(vy);
    y = radius;
  }
  
  //Draw
  background(0);
  ellipse(x,y,radius,radius);
}


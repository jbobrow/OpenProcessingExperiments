
float ball_x;
float ball_y;
float ball_dir = 1;
float ball_size = 50;  // Radius
float dy = 0;  // Direction

void setup()
{
  size(640, 360);
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  noStroke();
  smooth();
  ball_y = height/2;
  ball_x = 1;
}

void draw() 
{
  background(51);
  
  ball_x += ball_dir * 1.0;
  ball_y += dy;
  if(ball_x > width+ball_size) {
    ball_x = -width/2 - ball_size;
    ball_y = random(0, height);
    dy = 0;
  }

fill(255);
  rect(ball_x, ball_y, ball_size, ball_size);
  }


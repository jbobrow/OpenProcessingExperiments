
// Keith O'Hara <kohara@bard.edu>
// Feb 8 2010 Lecture - Almost Pong

// variables for the ball
float x,y,vy,vx;
int radius = 40;

// variables for the paddle
float px, py;
int paddlewidth = 75;

void setup()
{
  size(500, 500);
  smooth();
  x = width/2;
  y = height/2;
  vx = random(-5, 5);
  vy = random(-5, 5);
  px = 0;
  py = 470;
}

void draw()
{
  background(0);
  
  if (mousePressed)
  {
    vx = random(-5, 5);
    vy = random(-5, 5);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
    px = 0;
    py = 470;
  }
  
  // tests to see if the ball is bouncing
  // left or right wall
  if (x >= width-radius || x <= radius)
  {
    background(255, 0, 0);
    vx = -1*vx;
  }

  //tests to see if the ball is bouncing off top wall
  if (y <= radius)
  {
    background(255, 0, 0);
    vy = -1*vy;
  }

  // tests to see if the ball is bouncing off the paddle
  if ((y + radius) >= py && (x + radius) > px && (x - radius) < (px + paddlewidth))
  {
    background(0, 0, 255);
    vy = -1*vy;
  }


  // move the ball
  x = x + vx;
  y = y + vy;

  // draw the ball
  strokeWeight(5);
  ellipse(x, y, radius*2, radius*2);
  stroke(0, 0, 255);
  strokeWeight(15);

  // move the paddle
  px = mouseX;
  // draw the paddle
  line(px, py, px + paddlewidth, py);
}




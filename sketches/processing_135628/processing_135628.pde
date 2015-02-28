
float x;
float y;
float xspeed = 1;
float yspeed = 2;

// setup - runs one time
void setup()
  {
  // set a stage size of 500 x 500 pixels
  size (500,500);

  // smooth all drawing
  smooth();

  // don't draw an outline around your shapes
  noStroke();

  // start off our x and y in the center of the screen
  x = width / 2;
  y = height / 2;
  }

// draw - runs once a frame
void draw()
  {
  // background color
  background (150);

  // did the ball hit the left or right side of the screen?
  if (x >= 480)
    {
    xspeed = -1;
    }

  if (x < 20)
    {
    xspeed = 1;
    }
  // did the ball hit the left or right side of the screen?
  if (y >= 480)
    {
    yspeed = -1;
    }

  if (y < 20)
    {
    yspeed = 1;
    }
  // change the ball's fill color when the mouse is over it
  if (mouseX > x && mouseX < x+30 && mouseY > y && mouseY < y+30)
    {
    fill(random(255), random(255), random(255));
    }

  // move the ball to the left or right
  x = x + xspeed;

  // move the ball up and down
  y = y + yspeed;

  // draw a ball using x and y
  ellipse(x,y,30,30);
  }

void mousePressed()
  {
  // move the ball somewhere else!
  x = random(10,490);
  y = random(10,490);
  }

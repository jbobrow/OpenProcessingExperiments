
/*Making the shape of the circles change when they hit the wall 
during the test was very difficult for me to figure out so I have
made another example of a state change when the circles hit the
wall.
Also, figuring out how to space the circles apart from each other
using a loop was very difficult because I kept changing the value 
of x, rather than using a new variable to add to x, but once I 
figured that out I was able to make them.  Here I have used spacing
that affects both x axis spacing and y axis spacing.*/


float x = 250;
float y = 250;
float spacing = -100;
float sizeW = 50;
float sizeH = 50;
float i = 0;
float spaceCheck;
float speedx = 2;
float speedy = 2;
float a = 100;
float b = 100;
float speeda = 3;
float speedb = 2;
float spacingH = -100;
float spaceCheckH;
float state = 0;
float state1 = 255;

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  noStroke();
  background(state);
  while (i < 5)
  {
    fill(state1);
    ellipse(x+spacing, y+spacingH, sizeW, sizeH);
    spacing = spacing + 50;
    if(i < 2)
    {
    spacingH = spacingH + 50;
    }
    else if (i == 2)
    {
     spacingH = spacingH - 50; 
    }
    else if(i > 2)
    {
      spacingH = spacingH - 50;
    }
    spaceCheck = spacing;
    spaceCheckH = spacingH;
    i++;
  }
  fill(state1);
  ellipse(a, b, sizeW, sizeH);
  a = a + speeda;
  b = b + speedb;
  x = x + speedx;
  y = y + speedy;
  if (x < (0+spaceCheck)-(sizeW/2) || x > width-spaceCheck+(sizeW/2))
  {
    speedx = speedx * -1;
    if(state1 == 255)
    {
    state1 = 0;
    }
    else if(state1 == 0)
    state1 = 255;
    if(state == 255)
    {
     state = 0; 
    }
    else if(state == 0)
    {
     state = 255; 
    }
  }
  if (y < 0-sizeH/2-spaceCheckH || y > height-sizeH/2)
  {
    speedy = speedy * -1;
    if(state1 == 255)
    {
    state1 = 0;
    }
    else if(state1 == 0)
    state1 = 255;
    if(state == 255)
    {
     state = 0; 
    }
    else if(state == 0)
    {
     state = 255; 
    }
  }
  if (a < 0+sizeW/2 || a > width-sizeW/2)
  {
    speeda = speeda * -1;
    if(state1 == 255)
    {
    state1 = 0;
    }
    else if(state1 == 0)
    state1 = 255;
    if(state == 255)
    {
     state = 0; 
    }
    else if(state == 0)
    {
     state = 255; 
    }
  }
  if (b < 0+sizeH/2 || b > height-sizeH/2)
  {
    speedb = speedb * -1;
    if(state1 == 255)
    {
    state1 = 0;
    }
    else if(state1 == 0)
    state1 = 255;
    if(state == 255)
    {
     state = 0; 
    }
    else if(state == 0)
    {
     state = 255; 
    }
  }
  spacingH = -100;
  spacing = -100;
  i = 0;
}




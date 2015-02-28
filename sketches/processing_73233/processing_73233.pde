
// HW8 Computing for the Arts with Processing
// Copyright 2012 Tony Zhang

// Mouse input: click to change the color of the background circles.
// Keyboard input: use the arrow keys to move the position of the green/yellow and red/purple bands.

float x, y, x1, y1, x2, y2;
color r1;


void setup()
{
  size(400, 400);
  smooth();

  x = 0;
  y = 0;
  x1 = 0;
  y1 =0;
  color r1 = 50;
}

void draw()
{
  back();
  whileLoops(x, y, x1, y1, r1);
  whileLoops2(x2, y2);
}

void mousePressed()
{
  r1= color (random(255)); //change color of background circles
}

void keyPressed() //arrow key controls
{
  if (keyCode == RIGHT)
  {
    x1+=width*.08;
    x+=width*.08;
    if (x1 > width)
    {
      x1 = 0;
    }
  }

  if (keyCode == LEFT)
  {
    x1+=-width*.08;
    x+=-width*.08;
    if (x1 < 0)
    {
      x1 = width;
    }
  }
  if (keyCode == UP)
  {
    y2+=-height*.08;
    if (y2 < 0)
    {
      y2 = height;
    }
  }

  if (keyCode == DOWN)
  {
    y2+=height*.08;
    if (y2 > height)
    {
      y2 = 0;
    }
  }
}

void back() //transparent background for fade effect
{
  fill(193, 248, 234, 20);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void whileLoops(float x, float y, float x1, float y1, color r1)
{
  while (x < width*2) //background circles
  {
    stroke(r1);
    strokeWeight(1);
    noFill();
    ellipse(width*.75, height*.5, x, x);
    x+= 10;
    r1 += 5;
  }

  int ar=0;

  while (ar < 255) //red & purple band
  {
    fill(ar, 10, 100);
    noStroke();
    rectMode(CENTER);
    rect(x1, y1, random(1, 50), random(1, 50));
    y1+= 10;
    ar += 6;
  }
}

void whileLoops2(float x2, float y2)
{
  int br=20;

  while (br < 255) //yellow & green band
  {
    fill(br, 250, 0);
    noStroke();
    rect(x2, y2, random(1, 50), random(1, 50));
    x2+= 10;
    br += 6;
  }
}



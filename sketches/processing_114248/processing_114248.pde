
// HW #7
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved

// Controls:
// '1' to redraw rabbit at random location
// '2' to redraw snake at random location

// Rabbit controls:
// faster in initial X direction: d
// slower in initial X direction: a
// faster in initial Y direction: w
// slower in initial Y direction: s

// Snake controls:
// faster in initial X direction: RIGHT arrow
// slower in initial X direction: LEFT arrow
// faster in initial Y direction: UP arrow
// slower in initial Y direction: DOWN arrow

float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;

PImage rabbit, snake;

color col1, col2;

void setup()
{
  rectMode(CENTER);
  imageMode(CENTER);

  size(400, 400);
  x1 = random(width);
  y1 = random(height);
  sz1 = 50;
  dx1 = random(3, 10);
  dy1 = random(3, 10);
  
  x2 = random(width);
  y2 = random(height);
  sz2 = 100;
  dx2 = random(3, 10);
  dy2 = random(3, 10);
  
  col1 = color(200, 200, 0);
  col2 = color(0, 200, 200);
  
  rabbit = loadImage("rabbit.png");
  snake = loadImage("snake.png");
}
  
void draw()
{
  prepScreen();
  movFig2();
  fig2();
  movFig1();
  fig1();
  collide();
}

void collide()
{  
//  if (dist(x1, y1, x2, y2) < (sz1+sz2)/2)
//  {
//    dx1 = -dx1;
//    dy1 = -dy1;
//    dx2 = -dx2;
//    dy2 = -dy2;
//    fill( 255, 0, 0 );
//    rect(width/2, height/2, width, height);
//  }
if (dist(x1, y1, x2, y2) <= (sz1+sz2)/2)
  {
    float tempX, tempY;

    tempX = dx1;
    dx1 = dx2;
    dx2 = tempX;

//    tempY = dy1;
//    dy1 = dy2;
//    dy2 = tempY;
    
    
    fill( 255, 0, 0 );
    rect(width/2, height/2, width, height);
  }

}

void fig2()
{
  fill(col2);
  image(snake, x2, y2, 50, 50);
}

void prepScreen()
{
    noStroke();
    fill(255, 10);
    rect(width/2,height/2, width, height);
}

void fig1()
{
  noStroke();
  fill(col1);
  image(rabbit, x1, y1, 50, 50);
}

void movFig1()
{
  x1 +=dx1;
  y1 +=dy1;
  
  if(x1> width)
  x1 = 0;
  if(x1<0)
  x1 = width;
  
  if(y1> height)
  y1 = 0;
  if(y1<0)
  y1 = height;
}

void movFig2()
{
  x2 += dx2;
  y2 += dy2;
  
  if(x2 > width || x2<0 )
  dx2 = -dx2;
  
  if(y2> height || y2 <0 )
  dy2 = -dy2;
}

void keyPressed( )
{
  if (key == '1')
  {
  x1 = random(width);
  y1 = random(height);
  dx1 = random(3, 10);
  dy1 = random(3, 10);
  }
  if (key == '2')
  {
  x2 = random(width);
  y2 = random(height);
  dx2 = random(3, 10);
  dy2 = random(3, 10);
  }
  if (key == 'w')
  dy1++;
  if (key == 's')
  dy1--;
  if (key == 'a')
  dx1--;
  if (key == 'd')
  dy1++;
  if (key == CODED)
  {
    if (keyCode == UP)
    dy2++;
    if (keyCode == DOWN)
    dy2--;
    if (keyCode == LEFT)
    dx2--;
    if (keyCode == RIGHT)
    dy2++;
  }
  
  
}




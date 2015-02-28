
//Homework #4
//Copyright Eden Weingart 2013
//eweingar@andrew.cmu.edu

float x, y, wd, ht, n;
color col;
color col1;
color col2;
color col3;
color col4;
color col5;

void setup()
{
  size(400, 400);
  fill (200, 0, 0);
  x = 200;
  y = 200;
  wd = 150;
  ht = 150;
  frameRate(10);
  smooth();
  rectMode(CENTER);
  col= color (120, 242, 178);
  background (170);
  colorMode(RGB,200,50,100);
}


void draw()
{
  println(x); 



  fill(col);
  rect(x, y, wd, ht);
  if (mousePressed)
  {
    col= color(random(255), random(255), random(255));
  }
  if (key == CODED)
  { 
    if ( keyCode == UP )
    {
      y = y - 10;
    if (y < 0+ht*.5) {
      y = y + 10;
    }
    }
    else if (keyCode == DOWN)
    {
      y = y + 10;
    if (y > height-ht*.5) {
      y = y - 10;
    }
    }
    else if (keyCode == LEFT)
    {
      x = x - 10;
    if (x < 0+wd*.5) {
      x = x + 10;
    }
    }
    else if (keyCode == RIGHT)
    {
      x = x + 10;
    if (x > width-wd*.5) {
        x = x - 10;
      }
      
      
    }
  }
}

void keyPressed()
{
  //navigation


  //size changes
  if (key == 'a')
  {
    wd= wd+17;
    ht=ht+17;
  }
  if (key == 's')
  {
    wd=wd-17;
    ht=ht-17;
  }

  //background change
  if (keyCode == TAB)
  {
    background(170);
  }
}




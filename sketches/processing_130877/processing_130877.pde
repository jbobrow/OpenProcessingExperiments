
//HW 4
//©Scott Alberstein 2014

float x, y, wd, ht;
color col;
 
void setup()
{
  size(400, 400);
  fill (200, 0, 0);
  x = 200;
  y = 200;
  wd = 10;
  ht = 10;
  smooth();
  frameRate(100);
  col= color (100, 250, 150);
  background (255);
}
 
 
void draw()
{
  fill(col);
  noStroke();
  rectMode(CENTER);
  ellipse(x, y, wd, ht);
//  fill(255, 255, 255, 5);
//  rect(x, y, 400, 400);
  {
    if ( keyCode == UP )
    {
      y = y - 1;
    if (y < 0+ht*.5) {
      y = y + 1;
    }
    }
    else if (keyCode == DOWN)
    {
      y = y + 1;
    if (y > height-ht*.5) {
      y = y - 1;
    }
    }
    else if (keyCode == LEFT)
    {
      x = x - 1;
    if (x < 0+wd*.5) {
      x = x + 1;
    }
    }
    else if (keyCode == RIGHT)
    {
      x = x + 1;
    if (x > width-wd*.5) {
        x = x - 1;
      } 
    }
  }
}
 
void keyPressed()
{
  if (key == ' ')
  {
    col = color(random(255), random(255), random(255));
  }
  
  if (key == '1')
  {
    wd = wd+5;
    ht = ht+5;
  }
  
  if (key == '2')
  {
    wd = wd-5;
    ht = ht-5;
  }
}

void mousePressed()
{
  background(random(255), random(255), random(255));
}

void mouseWheel(MouseEvent event) 
{
  float e = event.getAmount();
  println(e);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 0+e*20, 0+e*20);
}



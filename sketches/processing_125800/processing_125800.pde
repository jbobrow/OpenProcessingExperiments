
int x = 450;
int y = 450;
int size = 100;
float elipsx = random(900);
float elipsy;
float esizex;
float esizey;
int count;
int operations;

void setup()
{
  count = 0;
  operations = 0;
  size(900,900);
  background(count,count,count);
  stroke(255);
  fill(0,255,0);
}

void draw()
{
  backChange();
  background(count,count,count);
  fill(0,255,0);
  rect(x,y,size,size);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      size = size + 1;
      background(count,count,count);
    }
    else if (mouseButton == RIGHT)
    {
      size = size - 1;
      background(count,count,count);
    }
  }
  strokeWeight(5);
  line(0,0,x+(size/2),y+(size/2));
  line(width,0,x+(size/2),y+(size/2));
  line(0,height,x+(size/2),y+(size/2));
  line(width,height,x+(size/2),y+(size/2));
  stroke Weight(1);
  ellipse(x+(size/2),y+(size/2),size,size)
  operations += 100;
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      y = y - 5;
      background(count,count,count);
    }
    else if (keyCode == DOWN)
    {
      y = y + 5;
      background(count,count,count);
    }
    else if (keyCode == RIGHT)
    {
      x = x + 5;
      background(count,count,count);
    }
    else if (keyCode == LEFT)
    {
      x = x - 5;
      background(count,count,count);
    }
  }
}

void backChange()
{
  while (operations >= 100)
  {
    count += 10;
    if (count > 255)
    {
      count = 0;
    }
    operations = 0;
  }
}


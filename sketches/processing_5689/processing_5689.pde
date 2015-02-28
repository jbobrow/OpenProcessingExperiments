
void setup()
{
  size (100,600);

  smooth();
}

int x = 0;
int y = 0;

int speed = 1;
int state = 0;

void draw()
{
  background (random (0,255));
  fill (0);
  ellipse (x,y,4,4);

  if (state == 0)
  { 
    x = x + speed;
    y = y + speed;

    if (x > width)
    { 
      x = width;
      state = 1;
    }
  }
  else if (state == 1)
  {
    x = x - speed;
    y = y + speed;
    if ( x < 0)
    { 
      y = 200; 
      x = 0; 
      state = 2; 
    }  
  } 
  else if (state == 2) { 
    x = x + speed; 
    y = y + speed;
    if (x > width) { 
      x = 100; 
      y = 300; 
      state = 3; 
    } 
  } 
  else if (state == 3) { 
    x = x - speed;
    y = y + speed;
    if (x < 0)
    { 
      x = 0;
      y = 400;
      state = 4; 
    } 
  } 
  else if (state == 4) { 
    x = x + speed;
    y = y + speed;
    if (x > width)
    {
      x = 100;
      y = 500;
      state = 5;
    }
  }
  else if (state == 5)
  {
    x = x - speed;
    y = y + speed;
    if (x < 0)
    { 
      x = 0;
      y = 600;
      state = 6;
    }
  }
  else if (state == 6)
  {
    x = x + speed;
    y = y - speed;
    if ( x > width)
    {
      x = 100;
      y = 500;
      state = 7;
    }
  }
  else if (state == 7)
  { 
    x = x - speed;
    y = y - speed;
    if (x < 0)
    { 
      x = 0;
      y = 400;
      state = 8;
    }
  }
  else if (state == 8)
  {
    x = x + speed;
    y = y - speed;
    if ( x > width)
    {
      x = 100;
      y = 300;
      state = 9;
    }
  }
  else if (state == 9)
  {
    x = x - speed;
    y = y - speed;
    if (x < 0)
    {
      x = 0;
      y = 200;
      state = 10;
    }
  }
  else if (state == 10)
  {
    x = x + speed;
    y = y - speed;
    if (x > width)
    {
      x = 100;
      y = 100;
      state = 11;
    }
  }
  else if (state == 11)
  { 
    x = x - speed;
    y = y - speed;
    if ( x < 0)
    {
      x = 0;
      y = 0;
      state = 0;
    }
  }
}







int x=0;
int y=0;
int c=100;
int counter=0;
void setup()
{
  size(500, 500);
  colorMode(HSB);
  frameRate(15);
}

void draw()
{
  if (counter<500)
  {
    y=0;
    for (int count=500;y<count;y+=20)
    {
      for (int count2=500;x<count2;x+=20)
      {
        fill(random(255));
        beginShape();
        vertex(x, y);
        vertex(x, y+20);
        vertex(x+10, y+10);
        endShape();
        fill(random(255));
        beginShape();
        vertex(x, y);
        vertex(x+20, y);
        vertex(x+10, y+10);
        endShape();
        fill(random(255));
        beginShape();
        vertex(x+20, y);
        vertex(x+10, y+10);
        vertex(x+20, y+20);
        endShape();
        fill(random(255));
        beginShape();
        vertex(x, y+20);
        vertex(x+10, y+10);
        vertex(x+20, y+20);
        endShape();
      }
      x=0;
    }
  }
  if (counter>=500&&counter<1500)
  {
    y=0;
    for (int count=500;y<count;y+=20)
    {
      for (int count2=500;x<count2;x+=20)
      {
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-10, 10);
        }
        fill(random(255));
        beginShape();
        vertex(x, y);
        vertex(x, y+20);
        vertex(x+10, y+10);
        endShape();
        if (random(300)>=290)
        {
          x+=random(-30, 30);
          y+=random(-20, 20);
        }
        fill(random(255));
        beginShape();
        vertex(x, y);
        vertex(x+20, y);
        if (random(300)>=290)
        {
          x+=random(-5, 5);
          y+=random(-10, 10);
        }
        vertex(x+10, y+10);
        endShape();
        if (random(300)>=290)
        {
          x+=random(-10, 10);
          y+=random(-30, 30);
        }
        fill(random(255));
        beginShape();
        vertex(x+20, y);
        vertex(x+10, y+10);
        if (random(300)>=290)
        {
          x+=random(-50, 50);
          y+=random(-5, 5);
        }
        vertex(x+20, y+20);
        endShape();
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-30, 30);
        }
        fill(random(255));
        beginShape();
        vertex(x, y+20);
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-10, 10);
        }
        vertex(x+10, y+10);
        vertex(x+20, y+20);
        endShape();
      }
      x=0;
    }
  }

  if (counter>1000)
  {
    background(c);
    c+=random(-50,50);
    y=0;
    for (int count=500;y<count;y+=20)
    {
      for (int count2=500;x<count2;x+=20)
      {
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-10, 10);
        }
        translate(-50,50);
        rotate(sin(noise(-100, 100)));
        fill(random(255), random(255), random(255));
        beginShape();
        vertex(x, y);
        if (random(300)>=290)
        {
          x+=random(-5, 5);
          y+=random(-10, 10);
        }
        vertex(x, y+20);
        if (random(300)>=290)
        {
          x+=random(-5, 5);
          y+=random(-10, 10);
        }
        vertex(x+10, y+10);
        endShape();
        if (random(300)>=290)
        {
          x+=random(-30, 30);
          y+=random(-20, 20);
        }
        fill(random(255), random(255), random(255));
        beginShape();
        vertex(x, y);
        if (random(300)>=290)
        {
          x+=random(-5, 5);
          y+=random(-10, 10);
        }
        vertex(x+20, y);
        if (random(300)>=290)
        {
          x+=random(-5, 5);
          y+=random(-10, 10);
        }
        vertex(x+10, y+10);
        endShape();
        if (random(300)>=290)
        {
          x+=random(-10, 10);
          y+=random(-30, 30);
        }
        fill(random(255), random(255), random(255));
        beginShape();
        vertex(x+20, y);
        if (random(300)>=290)
        {
          x+=random(-50, 50);
          y+=random(-5, 5);
        }
        vertex(x+10, y+10);
        if (random(300)>=290)
        {
          x+=random(-50, 50);
          y+=random(-5, 5);
        }
        vertex(x+20, y+20);
        endShape();
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-30, 30);
        }
        fill(random(255), random(255), random(255));
        beginShape();
        vertex(x, y+20);
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-10, 10);
        }
        vertex(x+10, y+10);
        if (random(300)>=290)
        {
          x+=random(-20, 20);
          y+=random(-10, 10);
        }
        vertex(x+20, y+20);
        endShape();
      }
      x=0;
    }
  }
  counter+=10;
  if (counter>=1500)
  {
    counter=0;
  }
}




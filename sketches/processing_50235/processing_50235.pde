
//hw3
//Daniel C Lee, Copyright January 2012

float x, y, w, d;


void setup()
{
   size (800, 500);
   background(0, 0, 0);
   smooth();
   frameRate(30);
   x= 30;
   y= 50;
}

void draw() 
{
  if (mousePressed && (mouseButton == LEFT))
  {
    if (mouseY > 250)
    {
    noStroke();
    fill (random(120), 255, random(255), random(255));
    ellipse (pmouseX, pmouseY, x, x);
    x = x*1.01;
    }
    if (mouseY < 250)
      {
      noStroke();
      fill(random(200,255), random(0, 60), 30);
      ellipse (pmouseX, pmouseY, y, y);
      y = y/1.01;
      {
        if (mousePressed && (mouseButton == RIGHT))
        {
          background (0, 0, 0);
          //Reset Does not work
        }    
      }
    }
  }
}




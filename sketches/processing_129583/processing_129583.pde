
float timer = 0.0;
float timer2 = 4.0;
float myscale = 1;
float myscaleSpeed = 0.4;
float waveHeight = 5;

void setup()
{
  size(500,500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  myscale = myscale + myscaleSpeed;
  timer = timer + (1.0 / 30.0);
  
  if (timer >= 2.0 && timer < 3.0)
  {
    rect(0,0,100,100);
  }
  else if (timer >= 3.0 && timer < 3.5)
  {
    ellipse(300,300,200,200);
  }
  else if (timer > 3.0 && timer < 4.0)
  {
    triangle(70,100,150,50,100,50);
    myscale = 1.0;
  }
  else if (timer > 4.0 && timer < 7.0)
  {
  timer2 = timer2 + (2.0 / 30.0);
  
    fill(0,0,255);
    pushMatrix();
    stroke(0);
    translate(width/2, height/2);
    rotate(timer2);
    scale(myscale);
    rect(0,0,10,10);
    popMatrix();
  }
  else
  {
    background(255,0,0);
  }
  float starty = 100.0;
  
  float ly = starty;
  float lx = 0.0;
  
  float endx = 500.0;
  float endy = 100.0;
  
  while (lx < endx)
  {
  fill(0,0,255);
  float waveHeight = 100;
  float waveFrequency = 5;
  float nextX = lx + 1;
  float nextY = starty + waveHeight * sin(radians(lx * waveFrequency));
  line(lx, ly, nextX, nextY);
  ly = nextY;
  lx = nextX;
  }
}



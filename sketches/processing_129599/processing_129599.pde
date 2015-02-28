
float timer = 0.0;
float myscale = 0.0;
float myscaleSpeed = 0.02;
float myscaleSpeedDown = -0.02;
float lx = 0.0;
float ly = 100.0;  
float endx = 500.0;
float endy = 100.0;

void setup()
{
  size(750, 500);
  frameRate(30);
}

void draw()
{
  background(0);
  timer = timer + (1.0 / 60.0);
  println(timer, myscale);
  
  if (timer > 0.0 && timer < 5.0)
  {
    myscale = myscale + myscaleSpeed;
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(timer * 775));
    scale(myscale);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
  }
  
  else if (timer >= 5.0 && timer < 10.0)
  {
    myscale = myscale + myscaleSpeedDown;
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(timer * 775));
    scale(myscale);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
  }
  
  else if (timer >= 10.0 && timer < 13.0)
  {
    rect(0, 0, 100, 100);
  }
  
  else if (timer >= 13.0 && timer < 16.0)
  {
    ellipse(300, 300, 200, 200);
  }
  
  else if (timer >= 16.0 && timer < 19.0)
  {
    triangle(77, 100, 150, 50, 100, 50);
  }
  
  else if (timer > 19.0)
  {
    stroke(255);
    float waveHeight = 5;
    float waveFrequency = 4;
    float nextX = lx + 1;
    float nextY = ly + waveHeight * sin(radians(lx * waveFrequency));
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
}



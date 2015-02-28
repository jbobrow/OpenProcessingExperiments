
float timer= 0;
float waveHeight= 7;
float rad= 0.0;
float theScale= 0.0;
float reverseScale= 0.0;

void setup()
{
  size(500,500);
  frameRate(30);
}

void draw()
{
  //wave line
  strokeWeight(4);
  float startY=400;
  float ly= startY;
  float lx= 0.0;
  float endx= 500.0;
  float endy= 100.0;
  while(lx <endx)
  {
    float waveHeight= 30;
    float waveFrequency= 3;
    float nextX= lx+1;
    float nextY= startY + waveHeight * sin(radians(lx*waveFrequency));
    line(lx,ly,nextX,nextY);
    ly= nextY;
    lx= nextX;
  }
  fill(random(255),random(255),random(255));
  timer= timer + (1.0/30.0);
  theScale= theScale+ .001;
  reverseScale= reverseScale - 0.001;
  if (timer >= 2 && timer < 3.0)
  {
    pushMatrix();
    rad= rad+ 1;
    translate(100,100);
    rectMode(CENTER);
    rotate(rad);
    rect(100,100,100,100);
    popMatrix();
  }
  else if (timer >= 4.0)
  {
    pushMatrix();
    scale(theScale);
    ellipse(250,250, 200,200);
    popMatrix();
  }
  //pulsing
    pushMatrix();
    scale(theScale);
    translate(1000,1000);
    ellipse(400,100,80,30);
    popMatrix();

    if (theScale >= 100)
    {
      pushMatrix();
      scale(reverseScale);
      translate(350,200);
      ellipse(400,100,80,30);
      popMatrix();
    }
}



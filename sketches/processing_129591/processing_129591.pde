
float timer = 0.0;
float myscale = 1;
float myscaleSpeed = 0.01;
float myRotation = 0;

void setup()
{
  size(500,500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  timer = timer + (1.0 / 30.0);
  println(timer);
  myscale = myscale + myscaleSpeed;
  myRotation = myRotation + 0.01;
  
  if (myscale >= 2)
  {
    myscaleSpeed = - 0.01;
  }
 
  if (myscale < 1)
  {
    myscaleSpeed = 0.01;
  }
  
  if (timer >= 0.0 && timer < 13.0)
  {
    pushMatrix();
    scale(myscale);
    rect(0,0,100,50);
    popMatrix();
  }
  else if (timer >= 14.0 && timer < 15.0)
  {
    ellipse(200,200,200,200);
  }
  else if (timer > 16.0 && timer < 17.0)
  {
    triangle(100,400,100,350,200,350);
  }
  else if (timer > 17.0 &&  timer < 25.0)
  {
    translate(250,250);
    rotate(myRotation);
    rectMode(CENTER);
    rect(0,0,100,100);
  }
  else
  {
    background(0,255,0);
  }
}



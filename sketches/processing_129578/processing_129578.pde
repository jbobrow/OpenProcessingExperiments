
float timer = 0.0;
float timer2 = 5.0;
float myscale = 1.0;
float myscaleSpeed = 0.05;

void setup()
{
  size(500,500);
  frameRate(30);
}
void draw()
{
  background (255,255,255);
  timer = timer + (1.0/30.0);
  myscale = myscale + myscaleSpeed;
  if (timer >= .5 && timer <= 1.5)
  {
    fill(0,255,0);
    ellipse(width/2, height/2, 300, 300);
  }
  else if (timer >= 1.5)
  {
    background(0);
  }
    {
    rect(0,0,100,100);
  }
  if (timer >= 2.0 && timer <= 3.0)
  {
    ellipse(300,300,200,200);
  }
  timer2 = timer2 + (1.0/30.0);
  if (timer >= 5.0)
  {

    stroke(128);
    translate(width/2, height/2);
    rotate(timer2);
    scale(myscale);
    rect(0,0,100,100);
  
  }
  if (timer2 >= 7.0 && myscale <= 10)
  {
    pushMatrix();
    scale(myscale);
    rect(0,0,100,100);
    popMatrix();
  }
  if (myscale <= 12)
  {
    pushMatrix();
    scale(myscale);
    rect(0,0,100,100);
    popMatrix();
  }
  

}



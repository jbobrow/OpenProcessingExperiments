
float timer = 0.0;
float myscale = 0.1;
float myScaleSpeed = 1.8;
float rotate = 0.1;

void setup()
{
  size(500, 500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  timer = timer + (1.0 / 30.0);
  myscale = myscale + myScaleSpeed;
  rotate = rotate + 0.1;
  
  if (timer >= 2.0 && timer <10.0)
  {
    pushMatrix();
    scale(myscale);
    rect(0,0,100, 100);
    popMatrix();
  }
  else if(timer >= 10.0 && timer < 13.5)
  {
   translate(width/2, height/2);
   rotate(rotate);
   fill(255);
   noStroke();
   rectMode(CENTER);
   rect(0, 0, 40, 40);
  }

  
  /*else if (timer >= 10.0)
  {
   pushMatrix();
   scale(myscale - 2.0);
   rect(0, 0, 100, 100);
   popMatrix();
  }
  */
  /*
  else if (timer >= 10.0 && timer < 13.5)
  {
    pushMatrix();
    scale(myscale);
    ellipse(0, 0, 200, 200);
    popMatrix();
  }
  */
}



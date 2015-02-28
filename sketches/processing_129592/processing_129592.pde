
float timer = 0.0;
float myscale = 1.0;
float myscaleSpeed = 0.02;


void setup()

{
  size(1000,500);
  frameRate(30);
  background(0);
}

void draw()
{
  fill(color(#550000));
  timer = timer + (1.0 / 30.0);
  myscale = myscale + myscaleSpeed;
  if (myscale >= 4)
   {
     myscaleSpeed = -0.02; 
   }
  
  if (timer >= 2.0 && timer < 10.0)
  {
    
    pushMatrix();
    translate(width/2,height/2);
    scale(myscale);
    rectMode(CENTER);
    rect(0,0,100,100);
    popMatrix();
  }
else if (timer >= 3.0);
  {
   pushMatrix();
   scale(myscale);
   ellipseMode(CENTER);
   ellipse(300,300,150,150);
   popMatrix();
  }

}



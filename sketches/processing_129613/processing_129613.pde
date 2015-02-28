
float timer = 0.0;
float myscale = 0.7;
float myscaleSpeed = 0.04;
float rad = 0.0;
float s = 1.0;
float rotate = 1.0;

void setup()
{
  size (500, 500);
  frameRate(25);
}

void draw()
  {
    background(0);
    
    timer = timer + (1.0 / 30.0);
    myscale = myscale + myscaleSpeed;
    rad += 0.01;
    println(timer);
    println ("x: "+ mouseX + " y: " + mouseY);
    
    if (timer >= 2.0 && timer < 3.0)
    {
      pushMatrix();
      translate(100, 200);
      scale(myscale);
      rectMode(CENTER);
      rect(0, 0, 100, 100);
      translate (width/2, height/2);
      fill(#9999FF);
      popMatrix();
    }
    else if (timer >= 3.0 && timer < 4.0)
    {
      pushMatrix();
      translate(100, 100);
      rotate(rad);
      //scale(myscale);
      rectMode(CENTER);
      fill(#C0C0C0);
      rect(0, 0, 200, 200);
      popMatrix();
    }
    else if (timer > 4.0 && timer < 5.0)
    {
      fill(255, 0, 0);
      triangle (77, 100, 150, 50, 100, 50);
    }
    
  else
  {
    background (0, 0, 0);
  }
  }   
   
  
  
    
  




float timer = 0.0;
float myscale =1.0;
float myscaleSpeed = 0.01;
float rad = 0.0;

void setup()
{size(400,400);
frameRate(30);
}

void draw()
{
  background(0);
  timer = timer+ (1.0/30.0);
  println(timer);
  myscale = myscale +myscaleSpeed;
 
  
  if (timer >=2.0 && timer <10.0)
  {
    pushMatrix();
   translate(100,200);
   scale(myscale);
    rectMode(CENTER);
    
    rect(0,0,100,100);
    popMatrix();
  }
  
  else if(timer >10.0 && timer <30.0)
  {
    myscale = myscale -myscaleSpeed*2;
    pushMatrix();
    translate(100,200);
    scale(myscale);
    rectMode(CENTER);
    rect(0,0,100,100);
    popMatrix();
   
  }
  else if(timer >=30.0)
  {
    rad = rad +0.1;
    pushMatrix();
    translate(width/2,height/2);
    rotate(rad);
    rectMode(CENTER);
    rect(0,0,100,100);
 
    popMatrix();
  }
  
  else if (timer >=3.0 && timer < 3.5)
  {
    ellipse(300,300,200,200);
  }
  else if(timer > 3.0 && timer <4.0)
  {
    triangle(77,100,150,50,100,50);
  }
  else
  {
    background(255,0,0);}
}



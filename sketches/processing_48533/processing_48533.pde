
void setup ()
{
  size (400,600); 
  background (0,0,0);
  smooth () ;
}
 void mouseDragged ()
  {
    image (loadImage("rocket.png"),mouseX,mouseY);
  }

void draw ()
{
  

  fill (0,random (255), random (255));
  ellipse (random(400),random(600),7,7);
  
  
  }
void keyPressed ()
{
  stroke (random(255),random (255),random(255));
  strokeWeight (random(50));
  ellipse (200,300,100,100);
}


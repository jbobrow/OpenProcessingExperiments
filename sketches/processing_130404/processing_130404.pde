
//Copyright Mina Kim 2014
//minakim0128@gmail.com
//Homework 4 version 2

//if you press mouse, you will get a large circle,
// and if you press keyboard, the background will blink.
//Also, if you scroll mouse wheel, the background gets darker.


void setup ()
{
  size (400,400);
  background (255);
  noStroke ();
  rectMode (CENTER);

 
}

void draw ()
{
  fill (random(255),random(255),random(255),10);
  rect (200,200,400,400);
  fill (random(255),random(255),random (255),100);
  ellipse (mouseX,mouseY,random(100),random (100));
  ellipse (mouseX+80,mouseY+80,20,20);
}

void mousePressed ()
{
 
    noStroke ();
    fill (random(255), random (255), random (255));
    ellipse (mouseX,mouseY,400,400);
  }
  

void keyPressed ()

{
  noStroke ();
  fill (255);
  rectMode (CENTER);
  rect (200,200,400,400);
}

  
void mouseWheel ()
{
 background (20);
}
  






float centX, centY;
int diam = 10;

void setup ()
{
  size (400, 400);
  background (180); 
  frameRate(15);
  smooth();
  centX = width/2;
  centY = height/2; 
  noLoop();
}


void draw() 
{
  if (diam <= 2.5*width)
  {
    //  background (180);
    fill (180,20);
    stroke (255);
    strokeWeight(2);
    ellipse (centX, centY, diam, diam/2);
    diam += 15;
  }
 

   if (diam > 2.5*width)
  {
     rectMode (CENTER) ;
  fill (180,20);
  noStroke ();
   rect (width/2,height/2 , width, height);
    diam = 10;
  }
}

void mousePressed ()
{
  loop();
}

void mouseReleased ()
{
  noLoop();
}



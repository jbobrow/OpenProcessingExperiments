
void setup ()
{ 
  size (600,600);
  smooth ();
  frameRate (20);
}

void draw ()
{
  background (250,200,10,5);
  noStroke ();
  
  ellipseMode (CENTER);
  
   if (mousePressed)
  {
    background (0);
  }
  
  if (keyPressed)
  {
    background (255);
  }
  
  fill (240,0,0,100);
  ellipse (300,300,500,500);
  

  fill (250,40,30,150);
  ellipse (300,300,100,500);
  
  
  fill (230,70,10,150);
  ellipse (300,300,500,100);
  
  int x = 300;
  int y = 300;
  
  y = int(random(50,550));
  
  fill (240,40,30,70);
  ellipse (x,y,500,100);
  
  int x1 = 300;
  int y1 = 300;
 
  x1 = int (random(50,550));
 
  fill (230,0,0,40);
  ellipse (x1,y1,100,500);
  
  fill (240,50,40,50);
  ellipse (300,300,300,300);
  
  fill (240,100,30,130);
  ellipse (300,300,200,100);
  
  fill (200,200,30,100);
  ellipse (300,300,100,100);
  
  fill (250,250,100);
  ellipse (mouseX,mouseY,20,75);
 
  fill (250,250,100);
  ellipse (mouseX,mouseY,75,20) ;
  
  fill (250,0,0,100);
  ellipse (mouseX,mouseY,20,20);
  
  fill (250,0,0);
  ellipse (mouseX-50,mouseY-70,90,30);
  
  fill (250,0,0);
  ellipse (mouseX-50,mouseY-70,30,90);
  
  fill (250,250,100);
  ellipse (mouseX-50,mouseY-70,30,30);
  
 

}



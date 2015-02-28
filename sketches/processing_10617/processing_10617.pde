


class Munster
{
  float xp;
  float yp;
  float xs;
  float ys;
   Munster() {
  
    xp = random( width );
    yp = random( height );
    
    xs = random( -5,10);
    ys = random( -5,10 );
    
 }
 
    void moveMe ()
    { 
    xp += xs;
    yp += ys;
    
    if ( xp < 0 || xp > width ) xs *= -1;
    if ( yp < 0 || yp > height ) ys *= -1;  
   
 

 
 
 
  }
    
    void drawMe ()
    {  
      pushMatrix();
      translate (xp,yp);
 

   fill (100,  100, 200 );
  ellipse (0,0,mouseX/3,mouseY/3);   
  fill (0);
  ellipse (-50,-50, 15,15); 
  fill (0);
  ellipse (50, -50, 15,15);
  fill (0);
  ellipse (0,50,60,10);
 
  fill (255,  0, 100 );




popMatrix();
 
if (mousePressed)
{
background(0);
}

    }
}



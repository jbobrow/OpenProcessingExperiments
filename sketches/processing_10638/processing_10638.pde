


class Munster
{
  float xp;
  float yp;
  float xs;
  float ys;
  float w,h;


  boolean isOver;
  boolean isPressed;

 ////////////////////////////////////////////////////// 

  Munster () 
  {

    xp = random( width );
    yp = random( height );

    xs = random( -5,10);
    ys = random( -5,10 );

  }


 ////////////////////////////////////////////////////// 

  void drawMe ()
  { 
    w = mouseX/3;
    h = mouseY/3;
    pushMatrix();
    translate (xp,yp);


    fill (100,  100, 200,80 );
    ellipse (0,0,w,h);   
    fill (0);
    ellipse (-50,-50, 15,15); 
    fill (0);
    ellipse (50, -50, 15,15);
    fill (0);
    ellipse (0,50,60,10);

    fill (255,  0, 100 );




    popMatrix();
  }


 ////////////////////////////////////////////////////// 


  void testMouseOver ( float mx , float my )
  {
    isOver = (mx > xp) && (mx < xp+w) && (my > yp) && (my < yp+h);
  }

 ////////////////////////////////////////////////////// 

  void testMousePressed ( float mx, float my )
  {
    testMouseOver( mx, my );

    isPressed = isOver;
  }


 ////////////////////////////////////////////////////// 

  void moveIfPressed ( float xd, float yd )
  {
    if ( isPressed )
    {
      xp += xd;
      yp += yd;
    }
  }
 ////////////////////////////////////////////////////// 
  void released ()
  {
    isPressed = false;
  }


 ////////////////////////////////////////////////////// 

  void moveMe ()
  { 
    xp += xs;
    yp += ys;

    if ( xp < 0 || xp > width ) xs *= -1;
    if ( yp < 0 || yp > height ) ys *= -1;  

  }


}





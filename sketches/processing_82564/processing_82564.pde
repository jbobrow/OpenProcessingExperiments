
//Kitty Kwan, 4-5, Bouncing Ball

Ball bob;
void setup()
{
  background (0);
  size (500,500);
  bob= new Ball ();
  
}
void draw ()
{
  fill (0,0,0,10);
   rect (0,0,500,500);
  bob.show ();
  bob.bounce ();
  bob.move ();
}

class Ball 
{
  
  int x;
  int y;
  boolean up;
  boolean right;
  Ball ()
  {
    x= 30 ;
    y= 15 ;
    boolean up=true ;
    boolean right=true ;
  }
   
  void move ()
  {
   if (right==true)
   {
     x=x+5;
   }
   else
   {
     x--;
   }
   if (up)
   {
     y--;
   }
   else 
   {
     y=y+2;
   }
  }

 void bounce ()
   {
     if (y<5)
    {
      up=false;
    }
    if (y>500)
    {
      up=true;
    }
    if (x>485)
    {
      right=false;
    }
    if (x<15)
    {
      right=true;
    }
   }

 void show ()
 {
   fill (105,222,186);
   ellipse (x,y,30,30);
 }
}

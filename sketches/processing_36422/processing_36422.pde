
//Homework 3, September 2011
//Copyright Manuela Kind, CMU Pittsburgh PA 15289, USA

//---------------variables----------------
float x, y, s;
color bgColor;

//-----------------setup------------------

void setup()
  {
  //variables
  x = 50; 
  y = 50;
  s =  3;  //strokeWeight
  bgColor = color(50, 100, 180);   //backgroundColor
  
  //general
  size (400, 400);
  smooth();
  background(bgColor);
  text("PRESS KEY TO FALL DOWN", 130, 200);
  noCursor();
  }

//----------------draw--------------------

void draw()
   {
   noFill();
   strokeWeight (s);   
   stroke (200, 200, 200);
   }

//-------------scale-----------------

void keyPressed()
  {
   background(bgColor);
   //make ellipse grow (max. 800x800, then reset)
   x = x * 1.2;
   y = y * 1.2;
   ellipse (200, 200, x,y); 
   
   if (y > 800) 
   { 
   y = 50;
   }
   if (x > 800) 
   { 
   x = 50;
   }
 
  //make stroke grow, and reset
   s = s * 1.2;

   if (x < 51) 
   { 
   s = 3;
   }
  
  //repeat
     loop();
}

//---------------stop--------------------

void keyReleased()
{
  background(bgColor);
  text("PRESS KEY TO FALL DOWN", 130, 200);
}



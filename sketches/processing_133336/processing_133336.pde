
// Copyright 2014 Jacklynn Pham
// HW 5 week 3
// (Absent for conference day of turn in)

//////***Homework notes
// where prepWindow( ) draws a slightly transparent rectangle, 
// moveFigures( ) alters the location and movement variables for both figures, 
// and drawFigures( ) calls the figure( ) function two times

// fish 1
float x, y, wd, ht;
float dx, dy; // change in x how Nathan changes speed
float x1, y1;
float dz;

//fish 2, speedy
float fx, fy, fwd, fht, fdx, fdy;

//*******************************
void setup ()
{
  size(400, 400); 

  x=50;
  y=30;
  wd=30;
  ht=30;
  dx= 3;
 dy = 2;

  fx=300;
  fy=355;
  fwd=40;
  fht=40;
  fdx= -7;
}

// DRAW**************************
void draw( ) 
{ 
  prepWindow( ); 
  moveFigures( ); 
  drawFigures();
} 


// MOVE **************************
void moveFigures()
{
  ////// FISH ONE

  x += dx; // x = x + dx (x plus the speed)
  if ( x > width-77 ) //right
  {
    y = y + dx;  
    x = width-77;
  }

  if (y > height-33) // too down
  {
    x = x + dx;
    dx = -dx;  
    y = height-33;
  }


  if (x < 33 ) // left
  {
    y = y+dx; 
    x=33;
  }    


  if ( y < 40 ) //too up
  {
    x = x + dx;
    dx = -dx;
    y=40;
  }


  /// fish 2, aka: "speedy"
  
  fx = fx + fdx; // x = x + dx (x plus the speed)
  
   if (fx < 45 ) // left
   {
   fy = fy+fdx; 
    fx=45;
 } 

     if ( fy < 40 ) //too up
    {
     fx = fx + fdx;
     fdx = -fdx;
     fy=40;
   }

  if ( fx > width-99 ) //right
  { 
   fy = fy + fdx;
   fx = width-99; 
   fdx= fdx;
  }
  
     if (fy > height-50) // too down
    {
     fx = fx + fdx;
     fdx = -fdx;  
     fy = height-50;
     }
     
}

//void keyPressed() // from Nathan
//{
//  if (key == '+' )
//  {
//    dx++; // dx = dx +1
//  }
//  else if ( key == '-')
//  {
//    dx--;
//  }
//}

// DRAW FIGURES **************************
void drawFigures()
{
  figure(x, y, wd, ht); 
  figure(fx, fy, fwd, fht);
}

// DRAW ONE FIGURE **************************
void figure (float x, float y, float wd, float ht)
{
  fill(#ED8C16);
  noStroke();
  ellipse( x+wd, y, wd*2.75, ht*1.95);
  triangle( (x+wd), y, (x-wd), (y+ht), (x-wd), (y-ht));
  stroke(200, 0, 0);
}

// PREPARE WINDOW **************************
void prepWindow() {
  noStroke();
  fill (#83D8E3, 20);
  rect(0, 0, width, height);
  smooth ();
}




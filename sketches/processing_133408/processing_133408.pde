
// rachel ciavarella
//computing for the arts hw V

//fig I global variables
float x, y, dx, dy, wd, ht; 

//fig II global variables
float x2, y2, dx2, dy2, wd2, ht2;

color bgColor; 



void setup( ) 
{ 
  size( 400, 400);  

//fig I
  x = 5; 
  y = 5; 
  wd = 10; 
  ht = 10; 
  dx = 7; 
  dy = 3;
  
//fig II
  x2 = 380; 
  y2 = 380; 
  wd2 = 40; 
  ht2 = 40; 
  dx2 = 4; 
  dy2 = 3;
 
  bgColor = color(255, 136, 44, 10); 

}


void draw( ) 
{ 
  prepareWindow( ); 
  moveFigure( ); 
  drawFigure( );
}


void prepareWindow()
{
  fill(bgColor);
  rect( 0, 0, 400, 400 );
}


void figure(float a, float b, float c, float d)
{
  noStroke();
  fill(#026DD6);
  ellipse(a, b, c, d);
}
 


void drawFigure()
{
  figure ( x, y, wd, ht);
  figure ( x2, y2, wd2, ht2); 
}


//move fig I
void moveFigure()
{
  x = x + dx;
 
  //right
  if ( x > width - 5 )
  {
  y = y + dx;
  x = width - 5;
  }
  
  //down
  if ( y > height - 5)
  {
    dx = -dx;
    x = x - dx;
    y = height - 5;
  } 
 
 //left
   if (x<5)
  {
    y = y + dx;
    x = width - 395;
  } 
  
 //up
   if ( y < 5)
  {
    dx = -dx;
    y = 5;
  }  


//figII
 //left
  if ( y2 == height -20 )
  {
  x2 = x2 - dx2;
  }
  
  //up
  if ((x2 == 20) && (y2 == height -20))
  {
    y2 = y2-dx2;
    x2 = 20;
  } 
 
 //left
   if ((x2 == 20) && (y2 < height - 20))
  {
    y2 = y2 - dx2;
    x2 = 20;
  } 
  
 //down
   if (( x2 == 20) && (y2 == 20))
  {
    x2 = x2 + dx2;
    y2 = 20;
  }  

 if (( x2 > 20) && (y2 == 20))
  {
    x2 = x2 + dx2;
    y2 = 20;
  }
  
   if (( x2 == width - 20) && (y2 == 20))
  {
    y2 = y2 + dx2;
    x2 = width - 20;
  }
  
   if (( x2 == width - 20 ) && (y2 > 20))
  {
    y2 = y2 + dx2;
    x2 = width -20;
  }
  
} 







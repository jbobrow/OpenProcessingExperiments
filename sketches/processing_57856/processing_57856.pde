
// Homework #11 :: 51-257 Sec A :: Michael Loffredo :: mlloffre 
// copyright michael loffredo 2012 

final int MAX = 100; 

int [] x;
int [] y;
int [] dia;
int [] dx;
int [] dy;
color [] col;


void setup ()
{
  size (600, 600);
  //size (screen.width, screen.height);
  
  x = new int [ MAX ];
  y = new int [ MAX ];
  dia = new int [ MAX ];
  dx = new int [ MAX ];
  dy = new int [ MAX ];
  col = new color [ MAX ];
  
  initializeIntegerArray (x, 50, width-50);
  initializeIntegerArray (y, 50, height-50); 
  initializeIntegerArray (dia, 50, 200);
  initializeIntegerArray (dx, 1, 10);
  initializeIntegerArray (dy, 1, 10);
  initializeColorArray (col, 0, 50);
  
}


void initializeIntegerArray (int [] anyArray, int small, int big)
{
  for (int i =0; i < anyArray.length; i++)
  {
    anyArray [i] = int ( random (small, big)); 
  }
  
}

void initializeColorArray (color [] anyArray, int small, int big)
{
  for (int i=0; i < anyArray.length; i++)
  {
    anyArray [i] = color (random (small, big), random (255), random (255), random (small, big));
  }
}


void draw () 
{
  
  prepScreen ();
  moveCircles ();
  drawCircles ();
  
} 


void moveCircles ()
{
  for (int i=0; i < x.length; i++)
  {
    x[i] = x[i] + dx[i];
    if (x[i] > width || x[i] < 0)
    {
      dx[i] = -dx[i];
    }
    y[i] = y[i] + dy[i];
    if (y[i] > height || y[i] < 0)
    {
      dy[i] = -dy[i];
    }
 }
}

void drawCircles ()
{
  for (int i=0; i < x.length; i++)
  {
    if (mousePressed)
    {
      fill (random (255), random (0, 50), random (255), random (0, 50));
      
    }
    else if (!mousePressed)
    {
      
      fill (col[i]);
      
    }
    
      noStroke ();
      ellipse (x[i], y[i], dia[i], dia[i]);
  }
  
  
  
} 


void prepScreen ()
{
  
  fill (0, 10);
  noStroke ();
  rect ( 0, 0, width, height);  
  
}


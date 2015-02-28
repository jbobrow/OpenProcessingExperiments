
color drawColor ; // current drawing color
int brushSize = 1 ; // default brush size 

void setup () 
{
  size (500, 700) ; //size of window
  background (255) ; //whitebackground
  fill (0) ; 
  rect (0, 0, width / 2, height) ; //black rectangle
  drawColor = color (0) ; //setting default drawing color to black 
  stroke (drawColor) ; 
  int xx = mouseX ; 
  int yy = mouseY ; 
  
}

void draw () 
{
  int b = brushSize / 2 ; // variable for brushsizes 

  if (mousePressed)
  { 
    for (int xx = mouseX - b ; xx <= mouseX + b; xx++ ) //sets brush size x coordinates
    {
      for (int yy = mouseY - b ; yy <=mouseY + b ; yy++ ) // sets increase brush size y coordinates
      {   
        color drawn = get (xx, yy ) ; // gets color of whereever mouse is drawing
        if (!(drawn == drawColor)) // if mouse position color is not black, stroke is black
        { 


          stroke (drawColor) ; 
          point (xx, yy) ; //draw point where mouse is pressed

          valueSwitch (drawn) ;
        }
      }
    }
  }
}





void valueSwitch (color drawn)
{

  // spiral modes starting place
  int mode = 0 ; 
  int xmin, xmax, ymin, ymax ; 
  int x, y ;

  //variables for spiraling pixal searching
  x = 0 ;
  y = 0 ;
  xmin = 0 ;
  ymin = 0 ;
  xmax = width - 1 ;
  ymax = height - 1 ;

  boolean searching = true ;
  while (searching)
  {

    switch (mode) 
    { 
    case 0 :  // moves along x axis at the top of display
      x ++ ;
      if (x > xmax - 1) 
      {
        mode ++ ;
        ymin ++ ;
      } 
      break ;

    case 1 :  // moves along y axis on right side of display
      y++ ;
      if  (y >= ymax )
      {
        mode ++ ;
        xmax -- ;
      }
      break ;
    case 2 : // moves along x axis on bottom of display
      x -- ;
      if ( x <= xmin )
      {
        mode ++ ;
        ymax -- ;
      }
      break ;
    case 3 : // moves along y axis on left side of display
      y--;
      if ( y <= ymin ) 
      {
        mode = 0 ;
        xmin ++ ;
      }
      break ;
    }


    color current = get ( x, y ) ;  // gets color from spiral 
    if (current != drawn) // if ( x, y ) are not equal to mouse location's color 
    {
      set (x, y, drawn) ; // set x, y to mouse location's color
      searching = false ; //breaks loop
      //println (x + " " + y + " " + drawn + " " + switched ) ;
    }
  }
}

void keyPressed () 
{
  if (key == 'p') //press p to export as tif file
  {
    saveFrame ("hellosketch.tif") ;
  }
  if (key == 'w') // press w for white brushstroke
  {
    drawColor = color (255) ;
  }
    if (key == 'b') // press w for white brushstroke
  {
    drawColor = color (0) ;
  }
  if (keyCode == UP) //press up arrow for larger brush
  {
    brushSize++ ;
  }
  if (keyCode == DOWN) //press down arrow for smaller brush
  {
    brushSize-- ;
  }
   if (key == 'r') //press down r to clear sketch
  {
     background (255) ; //whitebackground
     fill (0) ; 
     rect (0, 0, width / 2, height) ; //black rectangle
  }
}


color colorDraw = get (mouseX, mouseY) ; //color of mouse position


  
void setup () 
{
  size (500 , 500) ; //size of window
  background (255) ; //whitebackground
  fill (0) ; 
  rect (0, 0, width / 2, height) ; //black rectangle
  

  

}
void draw () 
{

 
   if (mousePressed)
   {    
      color colorDraw = get (mouseX, mouseY) ; 
     
      if ( colorDraw == 0 ) //if mouse position is black draw white
      { 
        
         stroke  (255) ;
      } 
      else if (colorDraw == 0 ) //if mouse position is white draw black
      {
         color  (255) ;
      } 

    }
       //if (drawn != colorDraw)  // -1 is color white
        // stroke (colorDraw) ; //color black
       
         point (mouseX, mouseY) ; //draw point where mouse is pressed
        
         valueSwitch (colorDraw) ;
     
}

   
  

    


void valueSwitch (color colorDraw)
{
  
    // spiral modes starting place
int mode = 0 ; 
int xmin , xmax , ymin , ymax ; 
int x , y ;
  
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
  
  
      color current = get ( x , y ) ;  // gets color from spiral 
      if (current != colorDraw) // if ( x, y ) are not equal to mouse location's color 
      {
        set (x, y, colorDraw) ; // set x, y to mouse location's color
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
        stroke (255) ;
    }
    if (key == 'b') //press b for black brushstroke
    {
        stroke (0) ;
    }
}

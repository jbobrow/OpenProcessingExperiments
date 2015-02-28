
int mode = 0 ; // spiral modes starting place
int xmin , xmax , ymin , ymax ; 
int x , y ;


void setup () 
{
  size (displayWidth , displayHeight) ; //display fullscreen
  background (255) ; //whitebackground
  fill (0) ; 
  rect (0, 0, width / 2, height) ; //black rectangle
  
  //variables for spiraling pixal finder
  x = 0 ;
  y = 0 ;
  xmin = 0 ;
  ymin = 0 ;
  xmax = width - 1 ;
  ymax = height - 1 ;
  

}
 
void draw () 
{
 
   if (mousePressed)
   {   
      color drawn = get (mouseX, mouseY) ;  // get color of pixel clicked
      if (drawn == -1)  // -1 is color white
      {
         stroke (0) ; //color black
      }
      else 
      {
         stroke (255) ; //color white
      }
         noSmooth();
         point (mouseX, mouseY) ; //draw point where mouse is pressed
        
         valueSwitch (drawn) ;
    }
}
    


void valueSwitch (color drawn)
{
   boolean finder = true ;
   if (finder)
   {
      switch (mode) 
        { 
          case 0 : // moves along x axis at the top of display
          x ++ ;
          if (x > xmax - 1) 
          {
            mode ++ ;
            ymin ++ ;
          } 
          break ;
          case 1 : // moves along y axis on right side of display
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
      //int x = int (random (width)) ;
      //int y = int (random (height)) ;
      color switched = get ( x , y ) ;
    if (switched != drawn) 
      {
        set (x, y, drawn) ;
        finder = false ;
        println (x + " " + y + " " + drawn + " " + switched ) ;
     
   } 
  }
}
 
void keyPressed () 
{
  if (key == 'p') 
  {
    saveFrame ("hellosketch.tif") ;
  }
}  
// need to make force stroke black and white
    /*
    
    if (keypressed == 'b')
   {
     stroke (0) ;
   }
       
        
  if (key == 'b') 
  {
    stroke (0) ;
  }
  if (key == 'w') 
  {
    stroke (255) ;
  }
    
}

half pixels are black
half pixels are white
draw with mouse mouse click and movement
 
 
controller
bang control
adjust shape of brush
ellipse, chisel (rhombus) , or point
slider
hide slider
controlP5.Controller : Slider hide()
 
 
adjust size of brush
increase width/height integer
point (mouseX, mouseY)
ellipse
rhombus
 
export drawing key
save button command
if (keyPressed == true) && (key == 'S') ;
  saveFrame ("hellosketch.tif") ;
 
if mousepressed and pixel is black
draw white pixel where mouse pressed and change a random white pixel along edge black
 
if mousepressed and pixel is white
draw black pixel where mouse presses and change random black pixel along edge to white
 
changes a pixel in another part of the canvas to the inverse of mouseclick

*/

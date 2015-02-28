
// colorDraw is black if drawn is white
// colorDraw is white if drawn is black
color colorDraw = get (mouseX, mouseY) ;



void setup () 
{
  size (500 , 500) ; //display fullscreen
  background (255) ; //whitebackground
  fill (0) ; 
  rect (0, 0, width / 2, height) ; //black rectangle
  

  

}
 
void draw () 
{
   
   if (mousePressed) // mouse actions
 {
   color drawn = get (mouseX, mouseY) ; //drawn is color of mouse click location
   if (drawn != colorDraw )  //if the mouse location is not the 
      {
         color (colorDraw) ; //if mouse location is not the ''
      }
    
 
    
         point (mouseX, mouseY) ; //draw point where mouse is pressed
        
         valueSwitch (drawn) ;
      
         
       
       
    }
}
    


void valueSwitch (color drawn)
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
  
  
      color current = get ( x , y ) ;  //  
      if (current != drawn) // 
      {
        set (x, y, drawn) ; // 
        searching = false ;
        //println (x + " " + y + " " + drawn + " " + switched ) ;
     
      } 
    }
}
 
void keyPressed () 
{
     if (key == 'p') 
    {
        saveFrame ("hellosketch.tif") ;
    }
    if (key == 'w') 
    {
        stroke (255) ;
    }
    if (key == 'b') 
    {
        stroke (0) ;
    }
}  




/*
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

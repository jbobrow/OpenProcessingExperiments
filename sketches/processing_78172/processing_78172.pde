
void setup () 
{
  size (displayWidth , displayHeight) ; //display fullscreen
  background (255) ; //whitebackground
  fill (0) ; 
  rect (0, 0, width / 2, height) ; //black rectangle
  
 
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
   while (finder)
   {
      int x = int (random (width)) ;
      int y = int (random (height)) ;
      color switched = get(x, y) ;
    if (switched != drawn) 
      {
        set (x, y, drawn) ;
        finder = false ;
        println(x+ " " + y+ " " +drawn+ " " +switched);
      /*
      if (x < width / 5)  
      {
        finder = true ;
       }
       else if (x > (width / 5) * 4) 
       { 
         finder = true ;
       }
       if (  y < height / 5) 
       {
          finder = true ;
       if (    y > (height / 5) * 4) 
       {
          finder = true ;
        }
   
     
     
    
    }   */
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

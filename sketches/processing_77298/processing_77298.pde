
void setup () {
  size (500, 500) ; //size of canvas
  background (100) ;

}

void draw () {
  
    color cul = (0) ;
 
    loadPixels () ;
      if (mousePressed == true ) {
        pixels [mouseY * width + mouseX] = color (0) ; 
      } if (mousePressed == true ) {
        pixels [mouseY * width + mouseX] = color (255) ; 
    updatePixels () ;
    }
     /* if (mousePressed == true) { 
       stroke (255) ; //draw point in mouse's position
    } else {
     stroke (0) ;
    }
    point (mouseX, mouseY) ;
    if (mouseReleased) {
      noStroke () ;
    }
    
   */
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
  save ("hellosketch.tif") ;

if mousepressed and pixel is black 
draw white pixel where mouse pressed and change a random white pixel along edge black

if mousepressed and pixel is white 
draw black pixel where mouse presses and change random black pixel along edge to white

changes a pixel in another part of the canvas to the inverse of mouseclick

*/

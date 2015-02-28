
//Properties
/*
The properties control the characteristics of the elements that you put into the programs
 Such as – shape, position, colour, size, transparency etc
 */
/*
Notes on colour
 In processing we record colour properties using RGB, therefore you will have a value between 0 – 255 for Red, Green and Blue
 Processing has a colour selector for choosing colours and showing the RGB value.  
 Go to Tools > color selector  
 */



void setup (){
  // the properties for this are the width and height of the window - eg size(width, height);
  size(600,600);

}

void draw (){
  // we have put in the 3 RGB values to create a background colour eg background (Red, Green Blue)
  background (222,218,149); 
  stroke (0);
  strokeWeight (1);
  fill (255);
  /*
   Rectangles have 4 properties that are set by the rect () method.  They are
x, y, width,height
   Imagine the window is divided into a grid in which we can plot coordinates using x and y
   x is the pixel position moving from left to right
   y is the pixel position moving up and down
   When x = 0 and y = 0 then this is the top left hand corner of the window 
   */

  // this rectangle has an x and y value of 10 pixels and the width and height are 50 pixels

  rect (10,10,50,50);

  // if we want to put colour in the square then we do this.  
  // the fill method needs the RGB properties - eg fill (Red, Green , Blue)

  fill (131,130,74);

  // we then have to draw a rectangle (or any other shape)

  rect (70,10,50,50);
  
  // subsequent shapes will have the same colour value
  
  rect (130,10,50,50);
  
 // until we add another fill value and the next shape we draw will have the new value
  
    fill (118,118,104);
    rect (190,10,50,50);
    
 //can you work out why the first square is white
  
  //By default all shapes have a stroke.  To turn this off we do the following before we draw the shape

  
   noStroke();
   rect (250,10,50,50);
   
   // of course we can change the properties of strokes 
   // like colour, by using RGB values

   stroke(173,45,56);
   rect (310,10,50,50);
   
   // and the size of the stroke where the property is given in pixels
   
   strokeWeight (4);
   rect (370,10,50,50);
   
   // the final property for shapes is transparency or what is called alpha
   
   rect (10,70,50,50); 
   // you will see that we have added a forth value so fill() would know be rect (Red, Green, Blue, Alpha)
   // with alpha you set a value from 0 to 255 were 0 is totally transparent and 255 is opaque

   fill (118,118,104,100);
   rect (20,100,100,100); 
   
   // can you have a go at drawing 2 more squares where the top one, including the stroke is transparent 
}











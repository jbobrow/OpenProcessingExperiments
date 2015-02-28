
PImage saved ;
color drawColor ; // current drawing color
int brushSize = 1 ; // default brush size
PFont instructionFont ;
PFont brushSizeFont ;
int drawWindow;



void setup () 
{
  size (1000, 1000, P2D) ; //size of window
  drawWindow = height / 2 + 100 ; // drawing display
  background (255) ; //whitebackground
  fill (0) ; 
  rect (0, 0, width / 2, drawWindow-1) ; //black rectangle
  drawColor = color (0) ; //setting default drawing color to black 
  stroke (drawColor) ; 
  int xx = mouseX ; 
  int yy = mouseY ; 
  instructionFont = loadFont ("PrestigeEliteStd-Bd-32.vlw") ; // Instructions font
  brushSizeFont = loadFont ("BodoniSvtyTwoITCTT-Book-100.vlw") ;
}


void draw () 
{
  background(255);
  fill (0) ; 
  rect (0, 0, width/2, drawWindow-1) ; //black rectangle
  if (saved!=null) {
    image(saved, 0, 0);
  }

  if (( keyPressed) && (key == 'i')) {
    rect (0, 0, 1000, drawWindow - 1) ;
    displayInstructions();
  }

  fill(0);
  textFont (instructionFont, 28) ;
  text("BRUSH SIZE", 10, height-100);
  text("BRUSH COLOUR", width -220, height-125);
  textFont (brushSizeFont) ;
  text (brushSize, 200, height- 100) ;
  textFont (instructionFont, 20) ;
  text ("EQUIPOISE", 20, height- 20) ;
  fill (drawColor) ;
  stroke (105) ;
  rect (width - 70, height-70, 50, 50) ;
  rect (300, height - 100, brushSize, brushSize) ; 
  loadPixels () ;


  // Setting the Brush Size Range
  int b = brushSize / 2 ; 




  if (mousePressed && mouseY<=drawWindow)
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
  updatePixels () ;
  saved = get(0, 0, width, drawWindow);
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
  ymax = drawWindow ;

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
      if  (y >= ymax-1 )
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
      pixels[y * width + x] = drawn ;
      searching = false ; //breaks loop
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
  if (key == 'b' ) // press b for black brushstroke
  {
    drawColor = color (0) ;
  }
  if ((keyCode == UP)&&(brushSize < 9)) //press up arrow for larger brush
  {

    brushSize++ ;
  }
  if ((keyCode == DOWN)&&(brushSize > 0)) //press down arrow for smaller brush
  {
    brushSize-- ;
  }
  if (keyCode == BACKSPACE) //press down r to clear sketch
  {
    background (255) ; //whitebackground
    fill (0) ; 
    rect (0, 0, width / 2, height) ; //black rectangle
  }
  //Press I for list of Instructions
  if (key == 'i') 
  {
  }
}  

void displayInstructions() {
  fill (255) ;
  textFont (instructionFont) ;
  text ("EQUIPOISE:drawing application", 40, 50) ;
  textSize (25) ;
  text ("PRESS W KEY FOR WHITE PEN", 40, 90 ) ;
  textSize (25) ;
  text ("PRESS B KEY FOR BLACK PEN", 40, 130 ) ;
  textSize (25) ;
  text ("PRESS P TO EXPORT FOR PRINT", 40, 170 );
  textSize (25) ;
  text ("UP/DOWN ARROW TO CONTROL BRUSH SIZE", 40, 210 ) ;
  textSize (25) ;
  text ("DELETE KEY TO RESET DRAWING", 40, 250 ) ;
  textSize (25) ;
  text ("PRESS I FOR INSTRUCTIONS", 40, 290 ) ;
  textSize (25) ;
}

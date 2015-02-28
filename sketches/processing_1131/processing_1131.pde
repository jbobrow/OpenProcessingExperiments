
/**
* Most of the code here is taken from a FAQ at faqs.org:
* http://www.faqs.org/docs/javap/c6/s5.html
* it's on understanding keyboard events.  The tutorial
* there will help make sense of this code.  
**/

final int SQUARE_SIZE = 40;  // Length of a side of the square.
color squareColor;  // The color of the square.
int squareTop, squareLeft;  // Coordinates of top-left corner of square.
boolean focussed = false;   // True when this applet has input focus.
PFont font;

void setup()
{
  size( 300, 300 );
  font = loadFont( "ArialNarrow-20.vlw" );
  textFont( font );
  squareTop = height / 2 - SQUARE_SIZE / 2;
  squareLeft = width / 2 - SQUARE_SIZE / 2;
  squareColor = color( 255, 0, 0 );
  noLoop();
}

void draw()
{
  background( 255 );
  if (focussed)
  {
    stroke( color( 0, 255, 255 ) );
  }
  else
  {
    stroke( color( 50 ) );
  }  
  strokeWeight( 3 );
  noFill();
  rect(1,1,width-3,height-3);
  stroke(squareColor);
  fill(squareColor);
  strokeWeight( 1 );
  rect(squareLeft,squareTop,SQUARE_SIZE,SQUARE_SIZE);
  /* If the applet does not have input focus, print a message. */
  if (!focussed) {
    fill( color( 0 ) );
    text("Click to activate",7,20);
  }
}

/** 
*  this overrides a PApplet method that's not officially in the API.
*  http://dev.processing.org/reference/core/javadoc/processing/core/PApplet.html
*  for more info.
**/
void keyPressed(KeyEvent evt) { 
  // Called when the user has pressed a key, which can be
  // a special key such as an arrow key.  If the key pressed
  // was one of the arrow keys, move the square (but make sure
  // that it doesn't move off the edge, allowing for a 
  // 3-pixel border all around the applet).  SQUARE_SIZE is
  // a named constant that specifies the size of the square.
  // squareLeft and squareRight give the position of the 
  // top-left corner of the square.

  int key = evt.getKeyCode();  // Keyboard code for the pressed key.

  if (key == KeyEvent.VK_LEFT) {  // left-arrow key; move square up
    squareLeft -= 8;
    if (squareLeft < 3)
      squareLeft = 3;
    redraw();
  }
  else if (key == KeyEvent.VK_RIGHT) {  // right-arrow key; move right
    squareLeft += 8;
    if (squareLeft > getSize().width - 3 - SQUARE_SIZE)
      squareLeft = getSize().width - 3 - SQUARE_SIZE;
    redraw();
  }
  else if (key == KeyEvent.VK_UP) {  // up-arrow key; move up
    squareTop -= 8;
    if (squareTop < 3)
      squareTop = 3;
    redraw();
  }
  else if (key == KeyEvent.VK_DOWN) {  // down-arrow key; move down
    squareTop += 8;
    if (squareTop > getSize().height - 3 - SQUARE_SIZE)
      squareTop = getSize().height - 3 - SQUARE_SIZE;
    redraw();
  }
}

/** 
*  this overrides a PApplet method that's not officially in the API.
*  http://dev.processing.org/reference/core/javadoc/processing/core/PApplet.html
*  for more info.
**/
public void focusGained(FocusEvent evt) {
  // The applet now has the input focus.
  focussed = true;
  redraw();  // redraw with cyan border
}

/** 
*  this overrides a PApplet method that's not officially in the API.  See
*  http://dev.processing.org/reference/core/javadoc/processing/core/PApplet.html
*  for more info.
**/
public void focusLost(FocusEvent evt) {
  // The applet has now lost the input focus.
  focussed = false;
  redraw();  // redraw without cyan border
}


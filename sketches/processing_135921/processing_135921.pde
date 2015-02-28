
// ICE 8

/*
 Segment of window turns black when mouse is over it
 Yellow circle shows where mouse is
*/

float numSegments;  // number of rows and columns
float segmentSize;  // width and height of each block

void setup ( )
{
  size( 600, 600  );  //must be square
  numSegments = 3;
  segmentSize = width/numSegments;
}

void draw ( )
{
  drawGrid( );
  drawBlackBlock( );
  showMouse( );
}

void drawBlackBlock( )
{
  fill( 0 );
  
  if (mouseX < segmentSize && mouseY < segmentSize) {
    rect (0, 0, segmentSize, segmentSize);
  }
  else if (mouseX > segmentSize && mouseX < 2*segmentSize && mouseY < segmentSize) {
    rect (segmentSize, 0, segmentSize, segmentSize);
  }
  else if (mouseX > 2*segmentSize && mouseX < width && mouseY < segmentSize) {
    rect (2*segmentSize, 0, segmentSize, segmentSize);
  }
  
  else if (mouseX < segmentSize && mouseY > segmentSize && mouseY < 2*segmentSize) {
    rect (0, segmentSize, segmentSize, segmentSize);
  }
  else if (mouseX > segmentSize && mouseX < 2*segmentSize && mouseY > segmentSize && mouseY < 2*segmentSize) {
    rect (segmentSize, segmentSize, segmentSize, segmentSize);
  }
  else if (mouseX > 2*segmentSize && mouseX < width && mouseY > segmentSize && mouseY < 2*segmentSize) {
    rect (2*segmentSize, segmentSize, segmentSize, segmentSize);
  }
  
  else if (mouseX < segmentSize && mouseY > 2*segmentSize && mouseY < height) {
    rect (0, 2*segmentSize, segmentSize, segmentSize);
  }
  else if (mouseX > segmentSize && mouseX < 2*segmentSize && mouseY > 2*segmentSize && mouseY < height) {
    rect (segmentSize, 2*segmentSize, segmentSize, segmentSize);
  }
  else if (mouseX > 2*segmentSize && mouseX < width && mouseY > 2*segmentSize && mouseY < height) {
    rect (2*segmentSize, 2*segmentSize, segmentSize, segmentSize);
  }
}

void drawGrid( )
{
  background( 255 );
    // horizontal lines;
  line( 0, segmentSize, width, segmentSize);        // top line
  line( 0, 2*segmentSize, width, 2*segmentSize );   // bottom line
    // vertical lines:
  line( segmentSize, 0, segmentSize, height );      // left line
  line( 2*segmentSize, 0, 2*segmentSize, height );  // right line  
}


void showMouse( )
{  fill( 255, 255, 0 );
   ellipse( mouseX, mouseY,15, 15 );
}




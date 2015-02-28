
//copyright Irene Joung 2014
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
  if (mouseX <= width/3 && mouseY <= height/3) 
  {
    fill( 0 );
    rect(0,0,segmentSize,segmentSize);
  }
  if (mouseX >= 2*width/3 && mouseY >= 2*height/3)
  {
    fill(0);
    rect(400,400,segmentSize,segmentSize);
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





// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #8
// 2/11/14

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
  float blockX; // x coordinate of black block
  float blockY; // y coordinate of black block
  
  // determine column and assign blockX
  if(mouseX < width/numSegments) {
    // left column (#1)
    blockX = 0;
  }else if(mouseX < width*2/numSegments){
    // middle column (#2)
    blockX = width/numSegments;
  }else {
    // right column (#3)
    blockX = width*2/numSegments;
  }
  
  // determine row and assign blockY
  if(mouseY < height/numSegments){
    // top row (#1)
    blockY = 0;
  }else if(mouseY < height*2/numSegments){
    // middle row (#2)
    blockY = height/numSegments;
  }else {
    // bottom row (#3)
    blockY = height*2/numSegments;
  }
  
  // draw black block
  rect(blockX,blockY,width/numSegments,height/numSegments);
  
}

void drawGrid( )
{
  background( 255 ); // white background
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





// Copyright 2014 Jacklynn Pham
// ICE 8

/*
 Segment of window turns black when mouse is over it
 Yellow circle shows where mouse is
*/

//***GLOBAL VARIABLES
float x = 0;
float y = 0;
float wd = 200;
float ht = 200;

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
 if (mouseX >= 0 && mouseX <= wd && mouseY >=0 && mouseY <= ht )
    {
    drawTopBox();
    }
    
  else if (mouseX >= 400 && mouseX <= width && mouseY >= 400 && mouseY <= height)
    {
      drawBottomBox();
    }
    
  else {
    drawGrid();
  }
}

void drawTopBox()
{
  fill( 0 );
  rect(x,y,wd,ht);
}

void drawBottomBox()
{
  fill( 0 );
  rect(x+400, y+400, wd, ht);
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




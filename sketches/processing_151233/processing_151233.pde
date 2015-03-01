

void setup() {
  size ( 600, 600 );
  noFill();
  rectMode( CENTER );
}

void draw() {
  background( 255 );
  int size = 100;
  //int x = width / 2;
  int y = height / 2;

  stroke( 0, 0, 255);
  for (int x=0; x<480; x+=size+20) {
    roughRect( 70+x, y-50, size, size);
  }
}





void roughRect( int xPos, int yPos, int sizeWidth, int sizeHeight ) {
  // you can change this
  float variance = 2; 

  // I don't recommend changing these
  float xstep = 1;
  float ystep = 1;
  float lastx = -999;
  float lasty = -999;
  float angle = xPos*yPos; // make sure each rectangle has a different roughness 
  float y = yPos;
  float x = xPos;

  // draw top left to top right
  for ( int x1=xPos; x1<xPos+sizeWidth; x1+=xstep ) {
    float rad = radians(angle);
    y = yPos + (pow( sin(rad), 3) * noise( rad*2 ) * variance );
    if ( lastx > -999 ) {
      line( x1, y, lastx, lasty );
    }
    lastx = x1;  
    lasty = y;
    angle+=5;
  }
  line( lastx, lasty, xPos+sizeWidth, yPos );

  // draw top right to bottom right
  ystep = 1;
  lastx = -999;
  lasty = -999;
  x = xPos + sizeWidth;

  for ( int y1=yPos; y1<yPos+sizeHeight; y1+=ystep ) {
    float rad = radians(angle);
    x = xPos + sizeWidth + (pow( sin(rad), 3) * noise( rad*2 ) * variance );
    if ( lasty > -999 ) {
      line( x, y1, lastx, lasty );
    }
    lastx = x;  
    lasty = y1;
    angle+=5;
  }
  line( lastx, lasty, xPos+sizeWidth, yPos+sizeHeight );

  // draw bottom right to bottomleft
  xstep = 1;
  lastx = -999;
  lasty = -999;
  y = yPos + sizeHeight-(sizeHeight/2);

  for ( int x1=xPos+sizeWidth; x1>xPos; x1-=xstep ) {
    float rad = radians(angle);
    y = yPos + sizeHeight + (pow( sin(rad), 3) * noise( rad*2 ) * variance );
    if ( lastx > -999 ) {
      line( x1, y, lastx, lasty );
    }
    lastx = x1;  
    lasty = y;
    angle+=5;
  }
  line( lastx, lasty, xPos, yPos+sizeHeight );

  // draw bottom left to top left
  ystep = 1;
  lastx = -999;
  lasty = -999;
  x = xPos;

  for ( int y1=yPos+sizeHeight; y1>yPos; y1-=ystep ) {
    float rad = radians(angle);
    x = xPos + (pow( sin(rad), 3) * noise( rad*2 ) * variance );
    if ( lasty > -999 ) {
      line( x, y1, lastx, lasty );
    }
    lastx = x;  
    lasty = y1;
    angle+=5;
  }
  line( lastx, lasty, xPos, yPos );
}


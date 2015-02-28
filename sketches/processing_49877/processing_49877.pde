
int bufferScale;
PGraphics buffer;
Scanline[] scanlineArray;

class Scanline {
  int pos;
  int size;
  int speed;
  
  Scanline( int startPosition, int trailSize, int lineSpeed ) {
    pos = startPosition;
    size = trailSize;
    speed = lineSpeed;
  }
}

void setup() {
  size( 640, 480 );
  bufferScale = 4;
  buffer = createGraphics( width/bufferScale, height/bufferScale, P2D );
  
  scanlineArray = new Scanline[8];
  scanlineArray[0] = new Scanline( 0, 256, 4 );
  scanlineArray[1] = new Scanline( 0, 128, 16 );
  scanlineArray[2] = new Scanline( 0, 64, 8 );
  scanlineArray[3] = new Scanline( (int)random( height ), (int)random( 32, 512 ), (int)random( 2, height/32 ) );
  scanlineArray[4] = new Scanline( (int)random( height ), (int)random( 32, 512 ), (int)random( 2, height/32 ) );
  scanlineArray[5] = new Scanline( (int)random( height ), (int)random( 32, 512 ), (int)random( 2, height/32 ) );
  scanlineArray[6] = new Scanline( (int)random( height ), (int)random( 32, 512 ), (int)random( 2, height/32 ) );
  scanlineArray[7] = new Scanline( (int)random( height ), (int)random( 32, 512 ), (int)random( 2, height/32 ) );
}

void draw() {
  // Original drawing code
  /*background( #263113 );
  for( int i = 0; i < scanlineArray.length; i++ ) {
    for( int j = 0; j < scanlineArray[i].size; j++ ) {
      stroke( #bdef65, 31 - ( ( 32.0f / scanlineArray[i].size ) * j ) );
      int linePos = scanlineArray[i].pos - j;
      if( linePos < 0 )
        linePos += height;
      line( 0, linePos, width, linePos );
    }
    scanlineArray[i].pos += scanlineArray[i].speed;
    if( scanlineArray[i].pos > height )
      scanlineArray[i].pos = 0;
  }*/
  
  // Drawing to buffer at 1/bufferScale the size and then upscaling
  buffer.beginDraw();
  buffer.background( #263113 );
  for( int i = 0; i < scanlineArray.length; i++ ) {
    for( int j = 0; j < scanlineArray[i].size/bufferScale; j++ ) {
      buffer.stroke( #bdef65, 31 - ( ( 32.0f / scanlineArray[i].size*bufferScale ) * j ) );
      int linePos = scanlineArray[i].pos/bufferScale - j;
      if( linePos < 0 )
        linePos += height/bufferScale;
      buffer.line( 0, linePos, width/bufferScale, linePos );
    }
    scanlineArray[i].pos += scanlineArray[i].speed;
    if( scanlineArray[i].pos > height )
      scanlineArray[i].pos = 0;
  }
  buffer.filter( BLUR );
  buffer.endDraw();
  
  image( buffer, 0, 0, width, height );
}


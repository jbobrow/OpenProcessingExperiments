
float rootThree = sqrt(3);
float rootThreeOverTwo = sqrt(3)/2;
float hexRadius = 64;
int hexCountX;
int hexCountY;

void DrawHexagon( float x, float y, float radius ) {
  float xOffset = rootThreeOverTwo * radius;
  float yOffset = 0.5 * radius;
  
  beginShape();
  vertex( x, y + radius );
  vertex( x - xOffset, y + yOffset );
  vertex( x - xOffset, y - yOffset );
  vertex( x, y - radius );
  vertex( x + xOffset, y - yOffset );
  vertex( x + xOffset, y + yOffset );
  endShape( CLOSE );
}

void setup() {
  size( 768, 512 );
  noStroke();
  smooth();
  
  hexCountX = ceil( width / hexRadius / rootThree ) + 1;
  hexCountY = ceil( height / hexRadius / 1.5 ) + 1;
}

void draw() {
  background( 0, 0, 255 );
  
  PVector mouse = new PVector( mouseX, mouseY );
  PVector hexCenter;
  
  for( int i = 0; i < hexCountX; i++ ) {
    for( int j = 0; j < hexCountY; j++ ) {
      hexCenter = new PVector( (i * hexRadius * rootThree) + ((j%2) * hexRadius * rootThreeOverTwo),  j * hexRadius * 1.5 );
      
      float dist = mouse.dist( hexCenter );
      fill( 31, 127, 127, 255 - dist );
      DrawHexagon( hexCenter.x, hexCenter.y, hexRadius );
      DrawHexagon( hexCenter.x, hexCenter.y, max( hexRadius - dist/8, 0) );
      
      fill( 63, 255, 255, 15 - dist/16 );
      DrawHexagon( hexCenter.x, hexCenter.y, hexRadius + dist );
    }
  }
}



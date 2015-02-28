
int randomOffset = 150;
int transparency = 70;

void setup() {
  size( 800, 800 );
  background( 120 );
  frameRate(25);
}

void draw() {
  fill(120);
  stroke( 255 , transparency );
  
  for( int i=0; i < 80; i++ ) {
    float startX = random( randomOffset * -1, randomOffset );
    float startY = random( randomOffset * -1, randomOffset );
    float endX   = random( randomOffset * -1, randomOffset );
    float endY   = random( randomOffset * -1, randomOffset );
    triangle( mouseX + startX , mouseY + startY  , mouseX + endX  , mouseY + endY  , mouseX, mouseY);
  }
}

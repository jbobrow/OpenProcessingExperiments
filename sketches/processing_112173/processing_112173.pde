
int randomOffset = 150;
int transparency = 70;
 
void setup() {
  size( 1000, 1000 );
  background( 0 );
  frameRate(25);

}
 
void draw() {
  noFill();
  stroke( 255 , transparency );
   
  for( int i=0; i < 20; i++ ) {
    float startX = random( randomOffset * -1, randomOffset );
    float startY = random( randomOffset * -1, randomOffset );
    float endX   = random( randomOffset * -1, randomOffset );
    float endY   = random( randomOffset * -1, randomOffset );

    ellipse( mouseX + startX , mouseY + startY  , mouseX + 1 , mouseY + 1);
  }
  
  float circleSize = map( mouseX, 0, width, 0, 10 );
  println( mouseX + " : " + circleSize);
  


}

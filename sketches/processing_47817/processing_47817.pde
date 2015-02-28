
int i = 20;
 
void setup() {
  size( 400, 400);
  smooth();
}
 
void draw() {
  background( 125);
   
   for( int y = 0; y <= height; y = y + i ) {
      for( int x = 0; x <= width; x = x + i ) {
        ellipse( x, y, 50, 50);
        line(x,y,10,10);
      }
   }
}

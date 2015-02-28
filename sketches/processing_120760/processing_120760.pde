
void setup() {
    size(500, 500);
    }
void draw() {
    int x = 50; 
    int y = 50;
    
    while( x <= 500 ) {
 
       ellipse( x, y, 20, 20 );
       
       x = x + 50;
       y = y + 50;
    } 
}

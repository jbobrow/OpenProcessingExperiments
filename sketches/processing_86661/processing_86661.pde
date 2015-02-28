
void setup() {

size(400, 400);
smooth();
   
}
   
void draw() {
   
   
   strokeWeight(8);
   
   for ( int i = 0; i < 3 ; i++ ) {
     line(75 + i*125, 40, 75 + i*125, 360);
   }
   
   
      
}

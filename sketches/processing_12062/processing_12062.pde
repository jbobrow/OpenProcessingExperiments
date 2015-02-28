
/*SEGMENTED FORM LAB
*Alexius Castilleja
*Created Sept 8, 2010
*/
float x = 25.0;
float y = 25.0;
float speedX = 7.7;
float speedY = 5.0;
float gravity = .105;
float radius1 = 10;
float radius2 = 10;
   
void setup(){
   size (500, 700);
   background (0,0,0);
   smooth();
   noStroke();
   fill(245, 162, 9, 120);
   for (int x=0; x<100; x+=2) {
   feather(random (x), random (y), 60.0, 10.0, 10.0);
   }


 }

void feather( float x, float y, float theta, float radius1, float radius2) {
  
  beginShape();
  smooth();
    
    for( int i=0; i<20; i++) {
    x += speedX;
    speedY += gravity;
    y += speedY;
    vertex(x,y);
    }
  endShape(CLOSE);
}














   






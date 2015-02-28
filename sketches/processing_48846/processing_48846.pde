
int i = 60;
  
void setup() {
  size( 400, 400);
  smooth();
  frameRate(3);
}
  

void draw() {
  background( 125);
    
   for( int y = int(random(100)); y <= height; y = y + i ) {
      for( int x =int(random(100)); x <= width; x = x + i ) {
        fill(random(255));
        ellipse( x, y, 50, 50);
        if( mousePressed==true){
        stroke(random(255),random(255),random(255));
        fill(random(255),150,255);
        ellipse(x,y,random(100),random(100));
        }  
      }
       
      }
     
   }


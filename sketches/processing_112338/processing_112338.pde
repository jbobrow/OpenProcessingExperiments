
int transparency = 2;

void setup() {
  size( 600, 600 );
  background( 255 );
}

void draw() {
  stroke( 0, transparency );
   line(width/2, mouseY, mouseX, height/2);
}   

void mousePressed() {
 transparency += 2;

}

void keyPressed() {
 if( key == ' ') {
   stop();
 } 
}

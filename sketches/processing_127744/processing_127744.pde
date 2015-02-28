
void setup() {
  size( 640, 400 ); 
  smooth(); 
  background( 255 );
}
void draw() {
 
}


void mouseMoved() {
  stroke( 0,100 ); 
  strokeWeight( 1 ); 
  fill( random(155,255),random(155,255),random(155,255), 150 ); 
  float d = dist( mouseX, mouseY, pmouseX, pmouseY ); 
  ellipse( mouseX, mouseY, d, d );
}

void keyPressed (){
    fill(random(255));
    rect(0,0,640,400);
  }



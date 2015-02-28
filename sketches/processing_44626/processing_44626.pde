
void setup() {
size(500,500);
frameRate( 20 );
smooth();
stroke(17,36,234);
}

void draw() {
  fill (80, 22);
  ellipse( 90, 42, 82, 0);
  
  if( mousePressed == true )
  fill (random( 255) , random (255), random (255));
  ellipse (mouseX -4, mouseY -18, 42, 18);
  rect (mouseX -80, mouseY -10, 30, 10);
  
  }


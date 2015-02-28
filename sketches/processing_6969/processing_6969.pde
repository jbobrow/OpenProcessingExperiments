
float x;
float y;
float easing = .1;

void setup() {
   size( 600, 450);
   background(124, 26, 26);
   smooth();
   
}

void draw() {

  
  noStroke();
  fill( 204, 21, 12);
  if( pmouseX != 0 && pmouseY != 0 ){
  if(mousePressed) {
    ellipse( mouseX, mouseY, 40, 40);
    ellipse( width-mouseX, height-mouseY, 40, 40);
  }
    
  float targetx = mouseX;
  float targety = mouseY;
  float speed = dist( 300, 200, mouseX, mouseY);
  fill(speed*.3);
  x += (targetx - x) * easing;
  y += (targety - y) * easing;
  rect( x, y, x, y);
  
  

  }
  
}


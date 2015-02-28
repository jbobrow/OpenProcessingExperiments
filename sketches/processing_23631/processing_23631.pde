
PImage hand;

void setup() {
  size(640, 480);
  smooth();
  hand = loadImage("hand.jpeg");
  
}

void draw() {
  int n = 5;
  if (mousePressed == true) {
 
    background( 255, 255, 255);
    image( hand, random( 5, 300), random( 5, 100));
    translate( random( 0, 640 ), random( 0, 480 ) );
    ellipse (random (50, 100), random (50, 100), random (50, 100), random (50, 100) );
}
}



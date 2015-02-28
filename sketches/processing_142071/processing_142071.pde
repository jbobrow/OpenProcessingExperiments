
/*
Jaeseong Yi
 Mar 20 2014
 Creative Computing Section B
 Benjamin Bacon
 */



float x; 
float y; 
float px; 
float py; 
float easing = 0.1;
int c1 = int(random(0, 255)); //red
int c2 = int(random(0, 255)); //green
int c3 = int(random(0, 255)); //blue

void setup() { 
  background(255);
  size( 800, 800); 
  smooth(); 
  stroke( 0, 102);
} 
void draw() {

  if (mousePressed) {
    float targetX = mouseX; 
    x += (targetX - x) * easing; 
    float targetY = mouseY; 
    y += (targetY - y) * easing; 
    float weight = dist( x, y, px, py); 
    stroke(c1, c2, c3);
    strokeWeight(weight); 
    line( x, y, px, py); 
    py = y; 
    px = x;
  }
}





float x= 0.0;
float y= 0.0; 
void setup() {
  size(250, 250);
  background(#000000);
  fill(#FC00E0);
  noStroke();
}

void draw() {
    ellipse(10, x, y, 5);
    ellipse(240, x, y, 5);
}

void mouseMoved() {
 y = y + 10;
 x = x + 5;
}
  
  


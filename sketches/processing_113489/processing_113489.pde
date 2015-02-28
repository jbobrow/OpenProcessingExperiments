
void setup() {
  int Space = 60;

  size( 600, 600 );
  smooth();
  noStroke();
  fill(0);
  
  background( 255 );

  for (int xPos = 0; xPos <= height; xPos += 60) {
  for (int yPos = 0; yPos <= width; yPos += 60) {
  triangle(xPos, yPos + Space, xPos + Space, yPos, xPos, yPos);
    }
  }

}

void draw() {

}

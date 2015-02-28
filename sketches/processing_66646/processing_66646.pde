
int colorCounter = 10;


void setup() {
  size(600,600);
  background (0);
  
  
}
void draw() {
  drawSquare (random(0,600),random(0,600),random(50,90), random(40,80), random(0,255));
  
}
  
 void drawSquare( float posX, float posY, float sizeX, float sizeY, float c) {
   
   noStroke();
   fill(c);
   rect(posX,posY,sizeX,sizeY);
   
 }


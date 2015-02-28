
int counter = 0;
int canvasLength = 200;
int squareLength = 50;
int black = 0;
 
void setup() {
  size(canvasLength, canvasLength);
}
 
void draw() {
  background(255);
  rect(counter, 0, squareLength, squareLength);
  fill(black);
  noStroke();
  if(counter == canvasLength) {
    counter = 0;
  }
  counter++;
}

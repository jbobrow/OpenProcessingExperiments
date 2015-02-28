
int canvasLength = 200;
int square1Length = 50;
int square1X = 0;
int square1Y = 0;
int square2Length = 100;
int square2X = canvasLength - square2Length;
int square2Y = 65;
int counter1 = 0;
int counter2 = canvasLength - square2Length;

void setup() {
  size(canvasLength, canvasLength);
  noStroke();
}

void draw() {
  background(255);
  // square 1
  if(counter1 == canvasLength) {
    counter1 = 0;
  }
  else if(counter1 > canvasLength - square1Length) {
    int newSquare1Length = counter1 - (canvasLength - square1Length);
    rect(square1X, square1Y, newSquare1Length, square1Length);
    fill(0);
  }
  rect(counter1, square1Y, square1Length, square1Length); //draw rectangle 1 
  fill(0);
  counter1++;
  // square 2
  if(counter2 == -square2Length) {
    counter2 = canvasLength - square2Length;
  }
  else if(counter2 < 0) {
    int newSquare2Length = canvasLength + counter2;
    rect(newSquare2Length, square2Y, newSquare2Length, square2Length);
    fill(0);
  }
  rect(counter2, square2Y, square2Length, square2Length);
  fill(0);
  counter2--;
}

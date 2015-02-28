
int x;
int colour;
int y;
int squareLen;
int canvasLen;
boolean increaseColour;

void setup() {
  colour = 30;
  increaseColour = true;
  incSinParam = true;
  squareLen = 100;
  canvasLen = 350;
  sinParam = 0;
  size(canvasLen, canvasLen);
  x = 0;
  y = (canvasLen / 2) - (squareLen / 2);
  noStroke();
}

void draw() {
  background(colour, 255-colour, 100 + colour);
  rect(x, 70 * sin((colour % canvasLen) * 0.3) + y, squareLen, squareLen);
  fill(255 - colour, 0, colour);
  if(x >= canvasLen - squareLen) {
    rect(0, 70 * sin((colour % canvasLen) * 0.3) + y, x - (canvasLen - squareLen), squareLen);
  }
  if(colour == 255) {
    increaseColour = false;
  }
  else if(colour == 30) {
    increaseColour = true;
  }
  if(increaseColour) {
    colour++;
  }
  else {
    colour--;
  }
  if(x == canvasLen) {
    x = 0;
  }
  x++;
}

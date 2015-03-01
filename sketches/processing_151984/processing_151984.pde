
int offset = 60;
float sqSize = random(offset/2, offset) - 0.5;
int sqC = int(offset/2);
int yPos;
int xPos;
int cRed = 0;
int cGreen;
int cBlue;
float howMany = width/offset;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  noStroke();
  println(howMany);
  yPos = sqC;
  xPos = sqC;
  cGreen = 0;
  cBlue = 0;
}

void draw() {
  cGreen = (int)random(255/2);
  cBlue = (int)random(255/2, 255);
  if(xPos < width) {
    while(xPos < width) {
      fill(cRed, cGreen, cBlue);
      rect(xPos, yPos, sqSize, sqSize);
      xPos += offset;
      cRed += floor(255 / howMany);
    } 
  }else {
    xPos = sqC ;
    yPos += offset;
    cRed -= floor(255/ (howMany*howMany));
  }
}



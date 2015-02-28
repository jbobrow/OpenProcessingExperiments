
PFont fontA;
float globalX=0;
float globalY=0;

void setup() {
  size(400, 400);
  fontA = loadFont("Courier-48.vlw");
  textFont(fontA, 18);
}

void draw() {
  globalX = map(mouseX, 0, 400, -600, 0);
  globalY = map(mouseY, 0, 400, -600, 0);
  translate(globalX, globalY);
  grid();
}


void grid() {
  for (int x=0;x<1000;x+=100) {
    for (int y=0;y<1000;y+=100) {
      fill(255);
      rect(x, y, 100, 100);
      fill(0);
      text("["+x+","+y+"]", x, y+50);
    }
  }
}



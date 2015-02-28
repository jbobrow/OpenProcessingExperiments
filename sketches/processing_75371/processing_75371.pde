
PFont fontA;
int globalX=0;
int globalY=0;

void setup() {
  size(400, 400);
  fontA = loadFont("Courier-48.vlw");
  textFont(fontA, 18);
}

void draw() {
  translate(globalY--,globalY--);
  
  grid();
}


void grid() {
  for (int x=0;x<1000;x+=100) {
    for (int y=0;y<1000;y+=100) {
      fill(255);
      rect(x, y, 100, 100);
      fill(0);
      text("["+x+","+y+"]",x,y+50);
    }
  }
}



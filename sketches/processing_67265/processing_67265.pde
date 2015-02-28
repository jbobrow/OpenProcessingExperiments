
int x;
int size = 20;


void setup () {

  size (500, 500);
  smooth();
  background(0);
  noStroke();
  colorMode(RGB, 255);
  }

void draw () {
  for (int y=0; y<=height; y+=40) {
  for (int x=0; x<=width; x+=40){
  fill (x, y, 0,255);
//size = size + 1;
ourFirstFunction(x, y, 30); 
//    print("{" + R + " " + G + " " + B + " " + ALPH + ")");
x = x + 5;
    }
  }
}



void ourFirstFunction(int xPos, int yPos, int d) {
  ellipse (xPos, yPos, d,d );
}




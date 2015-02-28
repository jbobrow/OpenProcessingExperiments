
int boxWide;
int boxHigh;
int pieceHeight;
int assembler;
int sandwichHeight, sandwichWidth;
int bunHeight;
int layerNumber;
int paint;

void setup() {
  size(800, 800);
  boxWide = width / 10;
  boxHigh = height / 10;
  pieceHeight = 5;
  bunHeight = 10;
  strokeWeight(2);
  assembler = 0;
  paint = 0;
  noLoop();
}

void draw() {
  int e, f, ex, wy;        //sandwich gets wider as x >>; sandwich gets taller as y >>
  for (e = 0; e < width; e += boxWide) {
    for (f = 0; f < height; f += boxHigh) {
      fill(255);
      layerNumber = e / boxWide + 1;
      sandwichHeight = layerNumber*5 + 2*bunHeight;
      sandwichWidth = f / 20 + 20;
      rect(e, f, boxWide, boxHigh);
      ex = boxWide / 2 - sandwichWidth / 2;        //centers sandwich in each square
      wy = boxHigh / 2 - sandwichHeight / 2;
      sandwich(e+ex, f+wy, layerNumber, paint, sandwichWidth);
    }
    paint += 5;                              //paint variable subtly changes color of the sandwich components to be less appetizing
  }
}

//this function draws a sandwich from coords x, y, with "layers" layers and "wide" width
void sandwich(int x, int y, int layers, int shade, int wide) {
  ellipseMode(CORNER);
  int m, n;

  fill(200, 150, 50);
  arc(x, y, wide, bunHeight*2, PI, 2*PI);
  line(x, y+bunHeight, x+wide, y+bunHeight);

  for (m = 0; m < layers; m++) {
    sandwichPiece(x, y+bunHeight+5*m, shade, wide);
  }
  fill(200, 150, 50);
  arc(x, y+(layers)*5, wide, bunHeight*2, 0, PI);
  line(x, y+(layers)*5+bunHeight, x+wide, y+(layers)*5+bunHeight);
}

//this function creates the middle pieces of the sandwich, in tomato-lettuce-meat order
void sandwichPiece(int a, int b, int tincture, int wid) {
  int picker = assembler % 3;        //increments sandwich component; picker0 = tomato, picker1 = lettuce, picker2 = meat
  int i, j;
  j = b;
  int direction = 1;
  if ((picker == 0) || (picker == 2)) {
    if (picker == 0) fill(200+tincture, 50+tincture, 50+tincture);      //changes color between tomato and meat
    if (picker == 2) fill(150+tincture, 80+tincture, 80+tincture);
    rect(a, b, wid, pieceHeight);
  }
  if (picker == 1) {                                                    //draws squiggly lettuce line
    stroke(50+tincture, 200+tincture, 50+tincture);                     //var direction changes direction of squiggle
    strokeWeight(4);
    for (i = a; i < a+wid; i += 5) {
      if (direction == -1) {
        j -= 5;
      } 
      else {
        j += 5;
      }
      line(i, (j-5*direction), i+5, j);
      direction *= -1;
    }
    stroke(0);
    strokeWeight(2);
  }
  assembler++;
}



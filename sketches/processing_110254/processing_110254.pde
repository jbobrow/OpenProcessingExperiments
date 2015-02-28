
//=========================
// Amir Dekel
// http://amirdekel.me
// September 2013
//=========================

/* ---------------------------------------------
Based on a small assignment for Coursera's "Introduction to Computational Arts"
Simple rows of triangles with varying width. Try experimenting with the extreme!

Q/E: Decrease/Increase width of top triangles
A/D: Decrease/Increase width of bottom triangles
S/W: Decrease/Increase number of rows
P: Change color palette
-----------------------------------------------*/

// An array of palettes
color[][] palettes = {
  {#25873B, #4473AB, #43C2B5, #453496, #762E85},
  {#59391F, #995145, #FFE9D9, #74A682, #47CC47},
  {#FF5A2F, #D14A27, #B03E21, #662413, #301109},
  {#CC465E, #FF6D3F, #66544E, #88D27D, #99FF3F},
  {#8EBF56, #5F7F39, #BDFF73, #2F401D, #ABE567},
  {#7B9FDF, #728C31, #B6D962, #A6493A, #8C5F58},
  {#D68127, #8A4C0B, #FFA648, #0083B2, #73BCD6},
  {#EDD31F, #56E31E, #ED261F, #D68127, #B856E3}
};

boolean message = false;

int paletteNum;
color[] palette;      // The actual palette in use at each moment

float tHeight;        // The height of the triangles
float wDiff;          // The difference of width between rows
int rows;             // Number of rows
float baseWidth;      // Width of the triangles at the bottom
float topWidth;       // Width of the triangles at the top

void setup() {
  size(800, 600);
  smooth();
  noLoop();

  paletteNum = int(random(palettes.length));
  rows = int(random(10, 40));
  baseWidth = random(100, 150);
  topWidth = random(50);

  updateSizes();
}

void draw() {
  if (mousePressed) {
    fill(0, 180);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER);
    text("Q/E: Decrease/Increase width of top triangles\nA/D: Decrease/Increase width of bottom triangles\nS/W: Decrease/Increase number of rows\nP: Change color palette", width/2, height/2);
  }
  else {
    background(palette[0]);
    noStroke();
    for (int y = 0; y < rows; y++) {
      float tWidth = baseWidth - y * wDiff;    // The width of each triangle in the current row
      int noAlign = int(random(tWidth)) * -1;   // Randomizing the beginning of the row in order to avoid aligning on the left side
      for (int x = noAlign; x < width; x += tWidth) {
        color fillColor = int(random(1, palette.length));
        fill(palette[fillColor]);
        float ty = height - height*y/rows;  // Positioning the vertical location of the triangle's bottom left corner
        triangle(x, ty, x + tWidth, ty, x + tWidth/2, ty - tHeight);
      }
    }
  }
}

void updateSizes() {
  palette = palettes[paletteNum];
  tHeight = height / rows;
  if (rows == 1) {
    wDiff = 0;
  }
  else {
    wDiff = (baseWidth - topWidth) / (rows - 1);
  }
}

void mousePressed() {
  redraw();
}

void mouseReleased() {
  redraw();
}

void keyPressed() {
  boolean rdraw = true;
  switch(key) {
  case 'q':
  case 'Q':
    topWidth -= 3;
    if (topWidth < 1) {
      topWidth = 1;
      rdraw = false;
    }
    break;
  case 'e':
  case 'E':
    topWidth += 3;
    if (topWidth > width) {
      topWidth = width;
      rdraw = false;
    }
    break;
  case 'a':
  case 'A':
    baseWidth-=3;
    if (baseWidth < 1) {
      baseWidth = 1;
      rdraw = false;
    }
    break;
  case 'd':
  case 'D':
    baseWidth+=3;
    if (baseWidth > width) {
      baseWidth = width;
      rdraw = false;
    }
    break;
  case 'w':
  case 'W':
    rows++;
    if (rows > height) {
      rows = height;
      rdraw = false;
    }
    break;
  case 's':
  case 'S':
    rows--;
    if (rows == 0) {
      rows = 1;
      rdraw = false;
    }
    break;
  case 'p':
  case 'P':
    paletteNum += 1;
    if (paletteNum == palettes.length) {
      paletteNum = 0;
    }
    break;
  default:
    rdraw = false;
  }
  updateSizes();
  if (rdraw == true) {
    redraw();
  }
}


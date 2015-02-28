
/* Color Bars, version 20101220
 Copyright © 2010 Thomas J. Greenbaum All Rights Reserved
 The Color Bars sketch shows how to create palettes of varying shades
 and create a color bar display that continuous shifts across a palette
 Tags: color bars, palette, HSB, color[], color array, color shift
*/

PFont fontNotation;
int aCount, bCount;
color[] paletteA = new color[100]; // Entire spectrum across 100 colors
color[] paletteB = new color[6]; // Evenly spaced sample of 6 colors across the entire spectrum

void setup(){
  //frameRate(2);
  fontNotation = loadFont("Arial-BoldMT-12.vlw");
  textMode(SCREEN);
  rectMode(CORNERS);
  noStroke();
  size(600,600);
  colorMode(HSB, 100, 100, 100);
  aCount = 0;
  bCount = 0;
  for (int i = 0; i < 100; i++) {           // Define palette A
    paletteA[aCount] = color(i, 100, 100); 
    aCount = aCount + 1;
  }
  for (int j = 0; j < 6; j++) {             // Define palette B
    paletteB[j] = paletteA[j*16];
  }

  drawPaletteA();
  //drawPaletteB();
  textAlign(LEFT, BOTTOM);
  textFont(fontNotation);
  fill(0, 0, 0);
  text("All of Palette A - contains entire spectrum across 100 colors", 20, 18);
  text("Sample of 6 evenly spaced colors from Palette A", 20, 218);
}

void drawPaletteA() {
  for (int j = 0; j < 100; j++) {
    fill(paletteA[j]);
    rect(j * 6, 0, j * 6 + 6, 200);
  }
  
  fill(paletteA[0]);
  rect(0, 200, 50, 400);

  for (int j = 1; j < 6; j++) {
    fill(paletteA[j*16]);
    paletteB[j] = paletteA[j*16];
    rect(j * 100 - 50, 200, j * 100 + 50, 400);
  }
  
  fill(paletteA[0]);
  rect(550, 200, 600, 400);
}

void draw() {
  for (int j = 0; j < 6; j++) {             // Define palette B
    aCount = j * 16 + bCount;
    aCount = aCount - (floor(aCount / 100) * 100);
    paletteB[j] = paletteA[aCount];
    //mouseX;
  }

  fill(paletteB[0]);
  rect(0, 400, 50, 600);

  for (int j = 1; j < 6; j++) {
    fill(paletteB[j]);
    rect(j * 100 - 50, 400, j * 100 + 50, 600);
  }
  
  fill(paletteB[0]);
  rect(550, 400, 600, 600);
  if(bCount > 99) {
    bCount = 0;
  } else {
    bCount = bCount + 1;
  }
  fill(0, 0, 0);
  text("Palette B - sample of 6 colors continuously offset each frame, offset = "+bCount, 20, 418);
}


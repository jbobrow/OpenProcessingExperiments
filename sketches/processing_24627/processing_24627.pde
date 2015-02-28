
/*
  Project: 1-Wallpapers (Pattern 3)
  Course: DSDN142 Creative Coding
  Author: Kirawat Sahasewiyon
  Date: 2011
*/

//import processing.pdf.*;

// Variables
int totalPatterns = 3;
int patternWidth = 30;
int patternHeight = 30;
int[][][] patternMap;
int[][] tileMap;

color lerpFrom, lerpTo;

void setup()
{
  size(567, 1134);
  smooth();
  
  lerpFrom = color(240, 236, 225);
  lerpTo = color(247, 165, 0);
  loadPatterns();
  
  // record to PDF
  //beginRecord(PDF, "pattern03.pdf");

  background(240, 236, 225);
  drawTiles(2, 70, getLerp(0.25), true);
  
  drawTiles(4, 80, getLerp(0.5), true);
  filter(BLUR, 2);
  
  drawTiles(6, 90, getLerp(0.75), true);
  filter(BLUR, 1);
  
  drawBackground();
  
  drawTiles(8, 75, getLerp(1), false);
  
  // end PDF record
  //endRecord();
}

void draw()
// Loop draw. Just ignore this for now.
{
}

// ===========================================================
//   Get Lerp Colours
// ===========================================================
color getLerp(float value)
{
  return lerpColor(lerpFrom, lerpTo, value);
}

// ===========================================================
//   Draw Tiles
// ===========================================================
void drawTiles(int tileSize, int percent, color c, boolean shadow)
{  
  int rnd;
  int tileMapWidth = ((width * 2) / (patternWidth * tileSize)) + 1;
  int tileMapHeight = ((height * 2) / (patternHeight * tileSize)) + 1;
  tileMap = new int[tileMapWidth][tileMapHeight];
  for (int y = 0; y < tileMapHeight; y++)
  {
    for (int x = 0; x < tileMapWidth; x++)
    {
      rnd = int(random(0, 100));
      if (rnd <= percent)
      {
        pushMatrix();
        rotate(radians(random(0, 100)));
        drawPattern((int)random(0, totalPatterns), (x * (patternWidth * tileSize)) - ((patternWidth * tileSize) / 2), (y * (patternHeight * tileSize)) - ((patternHeight * tileSize) / 2), tileSize, c, shadow);
        popMatrix();
      }
    }
  }
}

// ===========================================================
//   Draw Background
// ===========================================================
void drawBackground()
{
  //background(240, 236, 225);
  noiseGenerator(0, 0, width, height, 235, 235, 186, 241, 91, 214, 0, 125);
  stroke(229, 212, 192, 90);
  for (int i = 0; i < width; i += (height/ 120)) { line(i, 0, i, height); }
  for (int i = 0; i < height; i += (height / 120)) { line(0, i, width, i); }
  stroke(0);
}

// ===========================================================
//   Draw Pattern
// ===========================================================
void drawPattern(int id, int x, int y, int pixelSize, color c, boolean shadow)
{
  int offsetX = (int)random(0, 23);
  int offsetY = (int)random(0, 23);
  for (int posY = 0; posY <= patternHeight; posY++)
  {
    for (int posX = 0; posX <= patternWidth; posX++)
    {
      if (patternMap[id][posY][posX] == 1)
      {
        drawPixel((x + (posX * pixelSize)) + offsetX, (y + (posY * pixelSize)) + offsetY, pixelSize, c, shadow);
      }
    }
  }
}

// ===========================================================
//   Load Pattern
// ===========================================================
void loadPatterns()
{
  
  patternMap = new int[totalPatterns + 1][patternHeight + 1][patternWidth + 1];
  
  // Pattern 0
  addPixel(0, 0, 9);
  batchPixels(0, 1, 8, 10);
  batchPixels(0, 2, 7, 11);
  batchPixels(0, 3, 6, 12);
  batchPixels(0, 4, 1, 4);
  batchPixels(0, 4, 6, 12);
  batchPixels(0, 4, 15, 18);
  batchPixels(0, 5, 1, 18);
  batchPixels(0, 6, 2, 17);
  batchPixels(0, 7, 3, 17);
  batchPixels(0, 8, 4, 16);
  batchPixels(0, 9, 1, 15);
  batchPixels(0, 10, 0, 19);
  batchPixels(0, 11, 0, 19);
  batchPixels(0, 12, 2, 18);
  batchPixels(0, 13, 4, 17);
  batchPixels(0, 14, 5, 7);
  addPixel(0, 14, 10);
  batchPixels(0, 14, 13, 14);
  for (int i = 15; i <= 17; i++) { addPixel(0, i, 10); }
  batchPixels(0, 18, 8, 9);
  
  // Pattern 1
  for (int i = 0; i <= 2; i++) { batchPixels(1, i, 11, 12); }
  batchPixels(1, 3, 11, 13);
  batchPixels(1, 4, 11, 13);
  batchPixels(1, 5, 10, 14);
  batchPixels(1, 6, 9, 14);
  batchPixels(1, 7, 9, 14);
  batchPixels(1, 8, 9, 17);
  batchPixels(1, 8, 20, 21);
  batchPixels(1, 9, 3, 21);
  batchPixels(1, 10, 4, 21);
  batchPixels(1, 11, 6, 18);
  batchPixels(1, 12, 7, 17);
  addPixel(1, 12, 23);
  batchPixels(1, 13, 0, 3);
  batchPixels(1, 13, 7, 23);
  batchPixels(1, 14, 1, 23);
  batchPixels(1, 15, 2, 22);
  batchPixels(1, 16, 3, 21);
  batchPixels(1, 17, 4, 19);
  batchPixels(1, 18, 4, 9);
  addPixel(1, 18, 12);
  batchPixels(1, 18, 15, 18);
  addPixel(1, 19, 12);
  addPixel(1, 20, 12);
  batchPixels(1, 21, 11, 12);
  batchPixels(1, 22, 10, 11);
  
  // Pattern 2
  batchPixels(2, 0, 13, 14);
  batchPixels(2, 1, 12, 14);
  batchPixels(2, 2, 11, 14);
  batchPixels(2, 3, 11, 15);
  for (int i = 4; i <= 7; i++) { batchPixels(2, i, 10, 15); }
  addPixel(2, 8, 7);
  batchPixels(2, 8, 10, 16);
  addPixel(2, 8, 22);
  batchPixels(2, 9, 4, 8);
  batchPixels(2, 9, 10, 16);
  batchPixels(2, 9, 18, 22);
  batchPixels(2, 10, 4, 21);
  batchPixels(2, 11, 5, 20);
  batchPixels(2, 12, 6, 19);
  batchPixels(2, 13, 1, 2);
  batchPixels(2, 13, 7, 19);
  batchPixels(2, 13, 22, 23);
  batchPixels(2, 14, 0, 24);
  batchPixels(2, 15, 2, 23);
  batchPixels(2, 16, 2, 22);
  batchPixels(2, 17, 4, 20);
  batchPixels(2, 18, 6, 11);
  addPixel(2, 18, 13);
  batchPixels(2, 18, 15, 19);
  batchPixels(2, 19, 8, 10);
  for (int i = 19; i <= 21; i++) { addPixel(2, i, 13); }
  for (int i = 21; i <= 22; i++) { addPixel(2, i, 12); }
}

// ===========================================================
//   Add Pixel
// ===========================================================
void addPixel(int id, int row, int col)
{
  patternMap[id][row][col] = 1;
}

// ===========================================================
//   Batch Pixels
// ===========================================================
void batchPixels(int id, int row, int from, int  to)
{
  for (int i = from; i <= to; i++) { patternMap[id][row][i] = 1; }
}

// ===========================================================
//   Draw Pixel
// ===========================================================
void drawPixel(int x, int y, int pixelSize, color c, boolean shadow)
{
  // draw shadow
  if (shadow)
  {
    int shadowOffset = 15;
    noStroke();
    fill(0, 15);
    rect(x + shadowOffset, y + shadowOffset, pixelSize, pixelSize);
  }

  // draw pixel
  //fill(0);
  //rect(x, y, pixelSize + 1, pixelSize + 1);
  fill(c);
  //stroke(0);
  //strokeWeight(2);
  rect(x, y, pixelSize, pixelSize);

  // draw bevel
  /*
  int bevelSize = pixelSize / 8;
  noStroke();
  */

  // light side
  /*
  fill(255, 80);
  // horizon
  rect(x, y, pixelSize - bevelSize, bevelSize);
  // vertical
  rect(x, y + bevelSize, bevelSize, pixelSize - (bevelSize * 2));
  // bottom left corner
  triangle(x, y + (pixelSize - bevelSize), x + bevelSize, y + (pixelSize - bevelSize), x, y + pixelSize);
  // bottom right corner
  triangle(x + (pixelSize - bevelSize), y, x + pixelSize, y, x + (pixelSize - bevelSize), y + bevelSize);
  // dark side
  fill(0, 90);
  // horizon
  rect(x + bevelSize, y + (pixelSize - bevelSize), pixelSize - bevelSize, bevelSize);
  // vertical
  rect(x + (pixelSize - bevelSize), y + bevelSize, bevelSize, pixelSize - (bevelSize * 2));
  // bottom left corner
  triangle(x, y + pixelSize, x + bevelSize, y + (pixelSize - bevelSize), x + bevelSize, y + pixelSize);
  // bottom right corner
  triangle(x + pixelSize, y, x + pixelSize, y + bevelSize, x + (pixelSize - bevelSize), y + bevelSize);
  */

  // reset
  stroke(0);
  strokeWeight(1);
  fill(255);
}

// ===========================================================
//   Noise Generator
// ===========================================================
void noiseGenerator(int x, int y, int areaWidth, int areaHeight, int lowR, int highR, int lowG, int highG, int lowB, int highB, int lowA, int highA)
//Generate noise pattern.
{
  for (int posY = y; posY < areaHeight; posY++)
  {
    for (int posX = x; posX < areaWidth; posX++)
    {
      stroke(random(lowR, highR), random(lowG, highG), random(lowB, highB), random(lowA, highA));
      point(posX, posY);
    }
  }
  stroke(0);
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


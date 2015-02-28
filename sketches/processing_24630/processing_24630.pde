
/*
  Project: 1-Wallpapers (Pattern 4)
  Course: DSDN142 Creative Coding
  Author: Kirawat Sahasewiyon
  Date: 2011
*/

//import processing.pdf.*;

// Variables
int totalPatterns = 1;
int patternWidth = 25;
int patternHeight = 25;
int[][][] patternMap;
int[][] tileMap;

color lerpFrom, lerpTo;

void setup()
{
  size(567, 1134);
  smooth();
  
  lerpFrom = color(240, 236, 225);
  lerpTo = color(125, 195, 222);
  loadPatterns();
  
  // record to PDF
  //beginRecord(PDF, "pattern04.pdf");

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
        rotate(random(0, 1));
        drawPattern((int)random(0, totalPatterns), (x * (patternWidth * tileSize)) - ((patternWidth * tileSize) / 2), (y * (patternHeight * tileSize)) - ((patternHeight * tileSize / 2)), tileSize, c, shadow);
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
  addPixel(0, 0, 0);
  addPixel(0, 0, 3);
  addPixel(0, 0, 13);
  addPixel(0, 0, 16);
  addPixel(0, 1, 1);
  addPixel(0, 1, 3);
  addPixel(0, 1, 13);
  addPixel(0, 1, 15);
  addPixel(0, 2, 2);
  addPixel(0, 2, 5);
  addPixel(0, 2, 7);
  addPixel(0, 2, 9);
  addPixel(0, 2, 11);
  addPixel(0, 2, 14);
  batchPixels(0, 3, 0, 1);
  addPixel(0, 3, 3);
  addPixel(0, 3, 5);
  addPixel(0, 3, 8);
  addPixel(0, 3, 11);
  addPixel(0, 3, 13);
  batchPixels(0, 3, 15, 16);
  batchPixels(0, 4, 4, 5);
  addPixel(0, 4, 8);
  batchPixels(0, 4, 11, 12);
  batchPixels(0, 5, 2, 14);
  addPixel(0, 6, 5);
  addPixel(0, 6, 8);
  addPixel(0, 6, 11);
  addPixel(0, 7, 2);
  addPixel(0, 7, 5);
  batchPixels(0, 7, 7, 9);
  addPixel(0, 7, 11);
  addPixel(0, 7, 14);
  batchPixels(0, 8, 3, 7);
  batchPixels(0, 8, 9, 13);
  addPixel(0, 9, 2);
  addPixel(0, 9, 5);
  batchPixels(0, 9, 7, 9);
  addPixel(0, 9, 11);
  addPixel(0, 9, 14);
  for (int i = 5; i <= 11; i += 3) { addPixel(0, 10, i); }
  batchPixels(0, 11, 2, 14);
  batchPixels(0, 12, 4, 5);
  addPixel(0, 12, 8);
  batchPixels(0, 12, 11, 12);
  batchPixels(0, 13, 0, 1);
  addPixel(0, 13, 3);
  addPixel(0, 13, 5);
  addPixel(0, 13, 8);
  addPixel(0, 13, 11);
  addPixel(0, 13, 13);
  batchPixels(0, 13, 15, 16);
  addPixel(0, 14, 2);
  for (int i = 5; i <= 11; i += 2) { addPixel(0, 14, i); }
  addPixel(0, 14, 14);
  addPixel(0, 15, 1);
  addPixel(0, 15, 3);
  addPixel(0, 15, 13);
  addPixel(0, 15, 15);
  addPixel(0, 16, 0);
  addPixel(0, 16, 3);
  addPixel(0, 16, 13);
  addPixel(0, 16, 16);
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
  fill(c);
  rect(x, y, pixelSize, pixelSize);

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


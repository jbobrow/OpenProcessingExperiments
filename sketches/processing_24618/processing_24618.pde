
/*
  Project: 1-Wallpapers (Pattern 1)
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
  lerpTo = color(244, 211, 18);
  loadPatterns();
  
  // record to PDF
  //beginRecord(PDF, "pattern01.pdf");
  
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
  int tileMapWidth = ((width * 3) / (patternWidth * tileSize)) + 1;
  int tileMapHeight = ((height * 3) / (patternHeight * tileSize)) + 1;
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
        drawPixel((x + (posX * pixelSize)), (y + (posY * pixelSize)), pixelSize, c, shadow);
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
  addPixel(0, 0, 10);
  addPixel(0, 1, 10);
  addPixel(0, 2, 2);
  addPixel(0, 2, 10);
  addPixel(0, 2, 18);
  addPixel(0, 3, 3);
  addPixel(0, 3, 17);
  addPixel(0, 4, 4);
  batchPixels(0, 4, 8, 12);
  addPixel(0, 4, 16);
  batchPixels(0, 5, 6, 14);
  batchPixels(0, 6, 5, 15);
  batchPixels(0, 7, 5, 15);
  batchPixels(0, 8, 4, 16);
  batchPixels(0, 9, 4, 16);
  batchPixels(0, 10, 0, 2);
  batchPixels(0, 10, 4, 16);
  batchPixels(0, 10, 18, 20);
  batchPixels(0, 11, 4, 16);
  batchPixels(0, 12, 4, 16);
  batchPixels(0, 13, 5, 15);
  batchPixels(0, 14, 5, 15);
  batchPixels(0, 15, 6, 14);
  addPixel(0, 16, 4);
  batchPixels(0, 16, 8, 12);
  addPixel(0, 16, 16);
  addPixel(0, 17, 3);
  addPixel(0, 17, 17);
  addPixel(0, 18, 2);
  addPixel(0, 18, 10);
  addPixel(0, 18, 18);
  addPixel(0, 19, 10);
  addPixel(0, 20, 10);
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


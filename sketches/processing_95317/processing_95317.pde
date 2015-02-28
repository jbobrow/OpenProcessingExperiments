
int GRID_SIZE = 8;
int TILE_SIZE = 3 * GRID_SIZE;
int TILES_WIDE = 20;
int TILES_HIGH = 20;
int WIDTH = TILE_SIZE * TILES_WIDE;
int HEIGHT = TILE_SIZE * TILES_HIGH;
int CHANGES_PER_FRAME = 25;
int MILLIS_PER_HUE_CYCLE = 7 * 1000;
int MILLIS_PER_ROTATION = 30 * 1000;
float FLIP_CHANCE = 0.01f;
float JITTER = 4.00f;

boolean[] isFlipped = new boolean[TILES_WIDE * TILES_HIGH];
int[] hue = new int[TILES_WIDE * TILES_HIGH];
int[] saturation = new int[TILES_WIDE * TILES_HIGH];
int[] brightness = new int[TILES_WIDE * TILES_HIGH];

boolean isFirst = true;

void setup() {
  size(480, 480);
  
  background(16);
  //noLoop();
  noStroke();
  fill(196);
  colorMode(HSB);
  frameRate(100.0f);
}

void draw() {
  int hueOffset = (int)(255.0f * (float)(millis() % MILLIS_PER_HUE_CYCLE) / (float)MILLIS_PER_HUE_CYCLE);
  fill(((int)random(0.0f, 40.0f) + hueOffset + 128.0f) % 255, (int)random(200.0f, 255.0f), (int)random(0.0f, 1.0f), 5);
  rect(0, 0, WIDTH, HEIGHT);
  int changesLeft = CHANGES_PER_FRAME;
  int tilesLeft = TILES_WIDE * TILES_HIGH;
  for (int x0 = 0; x0 < TILES_WIDE; ++x0)
  {
    for (int y0 = 0; y0 < TILES_HIGH; ++y0)
    {
      if (!isFirst && random(0.0f, (float)tilesLeft) >= (float)changesLeft)
      {
         --tilesLeft;
         continue; 
      }
      --tilesLeft;
      --changesLeft;
      int tileX = TILE_SIZE * x0 + (int)random(-JITTER, JITTER + 1.0f);
      int tileY = TILE_SIZE * y0 + (int)random(-JITTER, JITTER + 1.0f);
      int tileIndex = y0 * TILES_WIDE + x0;
      fill(16, 200);
      //rect(tileX, tileY, TILE_SIZE, TILE_SIZE);
      colorMode(HSB);
      boolean changeColor = true;
      if (!isFirst)
      {
        boolean flipping = random(0.0f, 1.0f) < FLIP_CHANCE;
        if (flipping)
        {
           isFlipped[tileIndex] = !isFlipped[tileIndex]; 
           changeColor = false;
        }
      }
      else
      {
        isFlipped[tileIndex] = (random(0.0f, 2.0f) < 1.0f);
      }
      if (changeColor)
      {
         hue[tileIndex] = ((int)random(0.0f, 40.0f) + hueOffset) % 255;
         saturation[tileIndex] = (int)random(225.0f, 255.0f);
         brightness[tileIndex] = (int)random(225.0f, 255.0f);
      }
      fill(hue[tileIndex], saturation[tileIndex], brightness[tileIndex]);
      pushMatrix();
      translate(tileX, tileY);
      translate(0.5f * TILE_SIZE, 0.5f * TILE_SIZE);
      rotate(TWO_PI * (float)(millis() % MILLIS_PER_ROTATION) / (float)MILLIS_PER_ROTATION); 
      rotate(PI / 4.0f);
      translate(-0.5f * TILE_SIZE, -0.5f * TILE_SIZE);
      if (isFlipped[tileIndex])
      {
        beginShape();
        vertex(0 * GRID_SIZE, 0 * GRID_SIZE);
        vertex(1 * GRID_SIZE, 1 * GRID_SIZE);
        vertex(3 * GRID_SIZE, 0 * GRID_SIZE); 
        vertex(2 * GRID_SIZE, 1 * GRID_SIZE);  
        vertex(3 * GRID_SIZE, 3 * GRID_SIZE); 
        vertex(2 * GRID_SIZE, 2 * GRID_SIZE); 
        vertex(0 * GRID_SIZE, 3 * GRID_SIZE); 
        vertex(1 * GRID_SIZE, 2 * GRID_SIZE); 
        endShape();
      }
      else
      {
        beginShape();
        vertex(0 * GRID_SIZE, 0 * GRID_SIZE);
        vertex(2 * GRID_SIZE, 1 * GRID_SIZE);
        vertex(3 * GRID_SIZE, 0 * GRID_SIZE); 
        vertex(2 * GRID_SIZE, 2 * GRID_SIZE);  
        vertex(3 * GRID_SIZE, 3 * GRID_SIZE); 
        vertex(1 * GRID_SIZE, 2 * GRID_SIZE); 
        vertex(0 * GRID_SIZE, 3 * GRID_SIZE); 
        vertex(1 * GRID_SIZE, 1 * GRID_SIZE); 
        endShape();
      }
      popMatrix();
    } 
  }
  isFirst = false;
}

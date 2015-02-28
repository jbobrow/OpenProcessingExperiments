
int[] paperSize; 
int nfolds; 
float[][][] folds; 
float[][][] foldedImage; 
PImage img; 

String[] images = {
  "jewels.jpg", "bark.jpg", "dp.jpg", "jeff.jpg"}; 
int curImage = 0; 

void setup() { 
  img = loadImage(images[curImage]); 
  paperSize = new int[] {img.width, img.height};
  size(470, 353); 
  colorMode(HSB, 1);
} 

void foldPaper() { 
  nfolds = 32;//(int) random(32,32); 
  folds = new float[nfolds][2][2]; 
  foldedImage = new float[paperSize[0]][paperSize[1]][2]; 
  for(int i = 0; i < nfolds; i++) 
  folds[i] = new float[][] { 
    randomPosition(i), 
    randomPosition(i)};
  frameRate(1/2.);
} 

float[][] base = new float[][] { 
  new float[] {
    50,60  }
  , 
  new float[] {
    70,80  }
}; 
float[] randomPosition(int level) { 
  return foldPoint(random(paperSize[0]), random(paperSize[1]), level); 
} 

float[][] getBounds(float[][][] img) { 
  float maxx = 0, minx = -1, maxy = 0, miny = -1; 
  for(int x = 0; x < img.length; x++) 
    for(int y = 0; y < img[0].length; y++) { 
      float cx = img[x][y][0], cy = img[x][y][1]; 
      if(cx < minx || minx == -1) minx = cx; 
      else if(cx > maxx || maxx == 0) maxx = cx; 
      if(cy < miny || miny == -1) miny = cy; 
      else if(cy > maxy || maxy == 0) maxy = cy; 
    } 
  return new float[][] { 
    new float[] {
      minx, maxx    }
    , 
    new float[] {
      miny, maxy    }
  }; 
} 

void draw() { 
  foldPaper(); 

  for(int x = 0; x < paperSize[0]; x++) 
    for(int y = 0; y < paperSize[1]; y++) 
    foldedImage[x][y] = foldPoint((float) x, (float) y, nfolds);

  float[][] bounds = getBounds(foldedImage); 
  float range[] = new float[] { 
    (paperSize[0] - 1) / (bounds[0][1] - bounds[0][0]), 
    (paperSize[1] - 1) / (bounds[1][1] - bounds[1][0])  }; 

  loadPixels(); 
  for(int x = 0; x < paperSize[0]; x++) 
    for(int y = 0; y < paperSize[1]; y++) { 
      foldedImage[x][y][0] = (foldedImage[x][y][0] - bounds[0][0]) * range[0]; 
      foldedImage[x][y][1] = (foldedImage[x][y][1] - bounds[1][0]) * range[1]; 
      pixels[y * width + x] = img.get( 
      (int) foldedImage[x][y][0], 
      (int) foldedImage[x][y][1]); 
    } 
  updatePixels();
} 

float c0a0, b0a0, c1a1, b1a1, t;
float[] foldPoint(float x, float y, int level) { 
  for(int i = 0; i < level; i++) { 
    c0a0 = x - folds[i][0][0];
    b0a0 = folds[i][1][0] - folds[i][0][0];
    c1a1 = y - folds[i][0][1];
    b1a1 = folds[i][1][1] - folds[i][0][1];
 
    if((b0a0 * c1a1) - (b1a1 * c0a0) > 0) // orientation (determinant) 
      continue; 
 
    t = ((c0a0 * b0a0) + (c1a1 * b1a1)) / 
        ((b0a0 * b0a0) + (b1a1 * b1a1)); 
   
    // Reflect about closest point on line 
    x = (b0a0 * t + folds[i][0][0]) * 2 - x; 
    y = (b1a1 * t + folds[i][0][1]) * 2 - y; 
  } 
 
  return new float[] {x, y}; 
} 

void keyPressed() { 
  switch(key) { 
  case '1': 
    curImage = 0; 
    break; 
  case '2': 
    curImage = 1; 
    break; 
  case '3': 
    curImage = 2; 
    break; 
  case '4': 
    curImage = 3; 
    break; 
  } 
  setup(); 
} 





int nrows = 1201;
int ncols = 1201;
int bytesPerPoint = 2;

float[][] data;
float maxData, minData;

PImage sky;

void setup() {
  size(640, 100, P2D);  
  float scaleFactor = .013;
  data = new float[nrows][ncols];
  byte[] all = loadBytes("N35E138.hgt");
  for(int i = 0; i < nrows; i++) {
    int curOff = (i * nrows) * bytesPerPoint;
    for(int j = 0; j < ncols; j++) {
      int curPoint = 
        (((all[curOff + 0]) & 0xff) << 8) |
        ((all[curOff + 1]) & 0xff);
      if(curPoint > 0x0fff) // no data
        data[i][j] = 0;
      else
        data[i][j] = scaleFactor * curPoint;
      curOff += bytesPerPoint;
    }
  }
  
  colorMode(HSB);
  sky = createImage(width, height, ARGB);
  sky.loadPixels();
  for(int i = 0; i < height; i++) {
    color cur = color(
      map(i, 0, height, 140, 170), 
      map(i, 0, height, 0, 196),
      map(i, 0, height, 255, 64),
      16);
    for(int j = 0; j < width; j++)
      sky.set(j, i, cur);
  }
  sky.updatePixels();
  
  smooth();
  background(255);
}

void draw() {
  colorMode(RGB);
  
  filter(BLUR, 1);
  
  image(sky, 0, 0);
  
  float theta = map(mouseX, 0, width, -PI, PI); 
  float cosTheta = cos(theta);
  float sinTheta = sin(theta);
  float radiusRange = min(ncols, nrows) / 2;
  
  fill(255);
  noStroke();
  beginShape();
  vertex(0, height);
  float lastz = 0;
  for(int i = 0; i < width; i++) {
    float r = map(i, 0, width, -radiusRange, radiusRange);
    float x = (ncols / 2) + cosTheta * r;
    float y = (nrows / 2) + sinTheta * r;
    float z = data[(int) y][(int) x];
    if(z == 0)
      z = lastz;
    lastz = z;
    vertex(i, height - z);
  }
  vertex(width, height);
  endShape(CLOSE);
  
  int fujiOff = 50;
  blend(0, 0, width, height - fujiOff, 0, fujiOff, width, height - fujiOff, DARKEST);
}


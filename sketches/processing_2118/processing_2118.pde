

class WaveMapFilter {

  static final float DAMPING = 32;
  static final float REFRACTION_INDEX = 2f;
  int[] displacementLookup;  
  int w;
  int h;
  int[] currentWaveMap;
  int[] newWaveMap;
  PImage srcImage;
  
  
  public WaveMapFilter( int w, int h ) {
    this.w = w;
    this.h = h;    
    currentWaveMap = new int[w * h];
    newWaveMap = new int[w * h];
    setupDisplacementLookup();
    srcImage = createImage( w, h, ARGB );
  }
  
  private void setupDisplacementLookup() {
      displacementLookup = new int[512];
      for (int c = -256; c < 255; c++) {
          float d = c / 4;
          displacementLookup[c + 256] = (int) (tan(asin((sin(atan(d)) / REFRACTION_INDEX)) * d));
      }
  }
    
  public int getCurrentWMValue(int x, int y) {
      return currentWaveMap[y * w + x];
  }

  public void setCurrentWMValue(int x, int y, int val) {
      currentWaveMap[y * w + x] = val;
  }

  public int getNewWMValue(int x, int y) {
      return newWaveMap[y * w + x];
  }

  public void setNewWMValue(int x, int y, int val) {
      newWaveMap[y * w + x] = val;
  }
  
  public void update() {
      for (int y = 2; y < h - 2; y++) {
          for (int x = 2; x < w - 2; x++) {
              int n = (getCurrentWMValue(x - 1, y) +
                      getCurrentWMValue(x - 2, y) +
                      getCurrentWMValue(x + 1, y) +
                      getCurrentWMValue(x + 2, y) +
                      getCurrentWMValue(x, y - 1) +
                      getCurrentWMValue(x, y - 2) +
                      getCurrentWMValue(x, y + 1) +
                      getCurrentWMValue(x, y + 2) +
                      getCurrentWMValue(x - 1, y - 1) +
                      getCurrentWMValue(x + 1, y - 1) +
                      getCurrentWMValue(x - 1, y + 1) +
                      getCurrentWMValue(x + 1, y + 1)) / 6 - (getNewWMValue(x, y));
              n = (int) (n - (n / DAMPING));
              n = constrain(n, -127, 127);
              setNewWMValue(x, y, n);
          }
      }
          
  }  
  
 public void swap() {
      int[] temp = currentWaveMap;
      currentWaveMap = newWaveMap;
      newWaveMap = temp;
  }
  
   public int getPixel(PImage img, int x, int y) {
      int idx = y * width + x;
      if (idx < img.pixels.length && idx >= 0) {
          return img.pixels[y * width + x];
      }
      return 0;
  }

  public void setPixel(PImage img, int x, int y, int val) {
      img.pixels[y * width + x] = val;
  }
  
 public PImage filter( PImage in ) {
      srcImage.copy( in, 0, 0, in.width, in.height, 0, 0, w, h );
      srcImage.loadPixels();
      PImage newImage = createImage(width, height, in.format);
      newImage.loadPixels();

      for (int y = 1; y < height - 1; y++) {
          for (int x = 1; x < width - 1; x++) {
              int xDiff = getNewWMValue(x + 1, y) - getNewWMValue(x, y);
              int yDiff = getNewWMValue(x, y + 1) - getNewWMValue(x, y);

              int xDisplace = displacementLookup[xDiff + 256];
              int yDisplace = displacementLookup[yDiff + 256];

              int newColor = color(0);

              if (xDiff < 0) {
                  if (yDiff < 0) {
                      newColor = getPixel(srcImage, x - xDisplace, y - yDisplace);
                  } else {
                      newColor = getPixel(srcImage, x - xDisplace, y + yDisplace);
                  }
              } else {
                  if (yDiff < 0) {
                      newColor = getPixel(srcImage, x + xDisplace, y - yDisplace);
                  } else {
                      newColor = getPixel(srcImage, x + xDisplace, y + yDisplace);
                  }
              }

              setPixel(newImage, x, y, newColor);
          }
      }
      newImage.updatePixels();

      return newImage;
  }  
  
  
  public void waveMapDrop(int x, int y, int w, int strength) {

      int sqrw = (int) sq(w);
      if (x > w && x < width - w && y > w && y < height - w) {
          for (int v = y - w; v < y + w; v++) {
              int sqry = (int) sq(v - y);
              for (int u = x - w; u < x + w; u++) {
                  int sqrx = (int) sq(u - x);
                  if (sqrx + sqry <= sqrw) {
                      setCurrentWMValue(u, v, (int) (strength * w - sqrt(sqrx + sqry)));
                  }
              }
          }
      }
  }
  
}


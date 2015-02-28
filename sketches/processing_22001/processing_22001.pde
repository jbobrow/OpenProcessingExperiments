
public class DeepImage {

  private PApplet p;

  public PImage mImage;
  public float mDepthScalar = 0.0f; // this is a rendering option
  private int mMatrixSize;

  private PVector[][] mDepthValues;
  private int mGrain;
  private int mDepthValuesWidth;
  private int mDepthValuesHeight;
  private float mDepthMidpoint;

  DeepImage(PApplet applet, PImage image, int grain, int matrixSize, float depth) {

    p = applet;
    mImage = image;
    mImage.loadPixels();
    mGrain = (grain >= 3) ? grain : 3;
    mDepthScalar = depth;
    mMatrixSize = (matrixSize >= 3) ? matrixSize : 3;

    initDepthArray();
    calcDepth();
  }

  private void initDepthArray() {
    mDepthValuesWidth = (mImage.width / mGrain);
    mDepthValuesHeight = (mImage.height / mGrain);
    mDepthValues = new PVector[mDepthValuesWidth][mDepthValuesHeight];
    for (int i = 0; i < mDepthValuesWidth; i++) {
      for (int j = 0; j < mDepthValuesHeight; j++) {
        mDepthValues[i][j] = new PVector();
      }
    }
  }

  private void calcDepth() {

    int i = 0;
    int j = 0;
    float maxDepth = 0;
    float minDepth = 255;
    for (int y = 0; y < (mDepthValuesHeight * mGrain); y++) {
      for (int x = 0; x < (mDepthValuesWidth * mGrain); x++) {

        // for every Nth pixel, save the depth to the depth array
        if ((x % mGrain == 0) && (y % mGrain == 0)) {

          float depth = getAveragePixelIntensity(x, y, mMatrixSize, mImage);
          if (depth > maxDepth) maxDepth = depth;
          else if (depth < minDepth) minDepth = depth;

          mDepthValues[i][j].x = x;
          mDepthValues[i][j].y = y;
          mDepthValues[i][j].z = depth;
          i++;
        }
      }
      // increment and reset depth array counters
      if (y % mGrain == 0) {
        i = 0;
        j++;
      }
    }

    mDepthMidpoint = minDepth + ((maxDepth - minDepth) / 2);
  }

  public void draw() {

    // moves view to look at middle of image (so adjusting depth does not 'zoom')
    p.translate(0, 0, -mDepthScalar * mDepthMidpoint);

    // to top left corner of where image will be
    p.translate(-mImage.width / 2, -mImage.height / 2);

    for (int j = 0; j < mDepthValuesHeight - 1; j++) {
      p.beginShape(p.QUAD_STRIP);
      p.texture(mImage);
      for (int i = 0; i < mDepthValuesWidth; i++) {
        p.vertex(mDepthValues[i][j].x, mDepthValues[i][j].y, mDepthScalar * mDepthValues[i][j].z,
        mDepthValues[i][j].x, mDepthValues[i][j].y);
        p.vertex(mDepthValues[i][j + 1].x, mDepthValues[i][j + 1].y, mDepthScalar * mDepthValues[i][j + 1].z,
        mDepthValues[i][j + 1].x, mDepthValues[i][j + 1].y);
      }
      p.endShape();
    }
  }

  public float getAveragePixelIntensity(int x, int y, int matrixsize, PImage img) {

    int offset = matrixsize / 2;
    float scalar = 1.0f / (matrixsize * matrixsize);
    float sum = 0;
    int pixelsTested = 0;

    int xloc;
    int yloc;
    int loc;

    // Loop through convolution matrix
    for (int i = 0; i < matrixsize; i++) {
      for (int j = 0; j < matrixsize; j++) {

        // What pixel are we testing?
        xloc = x + i - offset;
        yloc = y + j - offset;
        loc = xloc + (img.width * yloc);

        // catch edge cases
        if ((xloc>=0)&&(xloc<img.width)&&(yloc>=0)&&(yloc<img.height)) {
          sum += (p.brightness(img.pixels[loc]));
          pixelsTested++;
        }
      }
    }

    // divide sum by number of successfully tested pixels in matrix
    sum /= pixelsTested;

    // Make sure intensity is within range
    sum = p.constrain(sum, 0, 255);

    return sum;
  }

  public int getGrain() {
    return this.mGrain;
  }

  public int getMatrixSize() {
    return this.mMatrixSize;
  }

  public void setSmoothing(int smoothing) {

    smoothing = (smoothing >= 3) ? smoothing : 3;
    mMatrixSize = smoothing;
    calcDepth();
  }
}



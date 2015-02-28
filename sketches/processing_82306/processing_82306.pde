
/**
 * This implementation of Canny Edge Detection is stripped down and
 * adapted from Tom Gibara's implementation at:
 * http://www.tomgibara.com/computer-vision/CannyEdgeDetector.java
**/

class CannyEdgeDetector {

  // statics
  private final static float GAUSSIAN_CUT_OFF = 0.005f;
  private final static float MAGNITUDE_SCALE = 100F;
  private final static float MAGNITUDE_LIMIT = 1000F;
  private final static int MAGNITUDE_MAX = (int) (MAGNITUDE_SCALE * MAGNITUDE_LIMIT);

  // fields
  private int[] data;
  private int[] magnitude;
  private PImage img;

  private float gaussianKernelRadius;
  private float lowThreshold;
  private float highThreshold;
  private int gaussianKernelWidth;

  private float[] xConv;
  private float[] yConv;
  private float[] xGradient;
  private float[] yGradient;

  // constructors

  /**
   * Constructs a new detector with default parameters.
   */

  public CannyEdgeDetector() {
    lowThreshold = 2.5f;
    highThreshold = 7.5f;
    gaussianKernelRadius = 2f;
    gaussianKernelWidth = 16;
  }

  // accessors
  /**
   * Specifies the image that will provide the luminance data in which edges
   * will be detected. A source image must be set before the process method
   * is called.
   *  
   * @param image a source of luminance data
   */

  public void setImg(PImage image) {
    img = image;
  }

  // methods

  public int[] process() {
    initArrays();
    readLuminance();
    computeGradients(gaussianKernelRadius, gaussianKernelWidth);
    int low = Math.round(lowThreshold * MAGNITUDE_SCALE);
    int high = Math.round( highThreshold * MAGNITUDE_SCALE);
    performHysteresis(low, high);
    thresholdEdges();
    return data;
  }

  // private utility methods

  private void initArrays() {
    if (data == null && img != null) {
      int size = img.width*img.height;
      data = new int[size];
      magnitude = new int[size];

      xConv = new float[size];
      yConv = new float[size];
      xGradient = new float[size];
      yGradient = new float[size];
    }
  }

  //NOTE: The elements of the method below (specifically the technique for
  //non-maximal suppression and the technique for gradient computation)
  //are derived from an implementation posted in the following forum (with the
  //clear intent of others using the code):
  //  http://forum.java.sun.com/thread.jspa?threadID=546211&start=45&tstart=0
  //My code effectively mimics the algorithm exhibited above.
  //Since I don't know the providence of the code that was posted it is a
  //possibility (though I think a very remote one) that this code violates
  //someone's intellectual property rights. If this concerns you feel free to
  //contact me for an alternative, though less efficient, implementation.

  private void computeGradients(float kernelRadius, int kernelWidth) {
    //generate the gaussian convolution masks
    float kernel[] = new float[kernelWidth];
    float diffKernel[] = new float[kernelWidth];
    int kwidth;
    for (kwidth = 0; kwidth < kernelWidth; kwidth++) {
      float g1 = gaussian(kwidth, kernelRadius);
      if (g1 <= GAUSSIAN_CUT_OFF && kwidth >= 2) break;
      float g2 = gaussian(kwidth - 0.5f, kernelRadius);
      float g3 = gaussian(kwidth + 0.5f, kernelRadius);
      kernel[kwidth] = (g1 + g2 + g3) / 3f / (2f * (float) Math.PI * kernelRadius * kernelRadius);
      diffKernel[kwidth] = g3 - g2;
    }

    int initX = kwidth - 1;
    int maxX = img.width - kwidth - 1;
    int initY = img.width * (kwidth - 1);
    int maxY = img.width * (img.height - kwidth - 1);

    //perform convolution in x and y directions
    for (int x = initX; x < maxX; x++) {
      for (int y = initY; y < maxY; y += img.width) {
        int index = x + y;
        float sumX = data[index] * kernel[0];
        float sumY = sumX;
        int xOffset = 1;
        int yOffset = img.width;
        for (; xOffset < kwidth ;) {
          sumY += kernel[xOffset] * (data[index - yOffset] + data[index + yOffset]);
          sumX += kernel[xOffset] * (data[index - xOffset] + data[index + xOffset]);
          yOffset += img.width;
          xOffset++;
        }

        yConv[index] = sumY;
        xConv[index] = sumX;
      }
    }

    for (int x = initX; x < maxX; x++) {
      for (int y = initY; y < maxY; y += img.width) {
        float sum = 0f;
        int index = x + y;
        for (int i = 1; i < kwidth; i++)
          sum += diffKernel[i] * (yConv[index - i] - yConv[index + i]);

        xGradient[index] = sum;
      }
    }

    for (int x = kwidth; x < img.width - kwidth; x++) {
      for (int y = initY; y < maxY; y += img.width) {
        float sum = 0.0f;
        int index = x + y;
        int yOffset = img.width;
        for (int i = 1; i < kwidth; i++) {
          sum += diffKernel[i] * (xConv[index - yOffset] - xConv[index + yOffset]);
          yOffset += img.width;
        }

        yGradient[index] = sum;
      }
    }

    initX = kwidth;
    maxX = img.width - kwidth;
    initY = img.width * kwidth;
    maxY = img.width * (img.height - kwidth);
    for (int x = initX; x < maxX; x++) {
      for (int y = initY; y < maxY; y += img.width) {
        int index = x + y;
        int indexN = index - img.width;
        int indexS = index + img.width;
        int indexW = index - 1;
        int indexE = index + 1;
        int indexNW = indexN - 1;
        int indexNE = indexN + 1;
        int indexSW = indexS - 1;
        int indexSE = indexS + 1;

        float xGrad = xGradient[index];
        float yGrad = yGradient[index];
        float gradMag = hypot(xGrad, yGrad);

        //perform non-maximal supression
        float nMag = hypot(xGradient[indexN], yGradient[indexN]);
        float sMag = hypot(xGradient[indexS], yGradient[indexS]);
        float wMag = hypot(xGradient[indexW], yGradient[indexW]);
        float eMag = hypot(xGradient[indexE], yGradient[indexE]);
        float neMag = hypot(xGradient[indexNE], yGradient[indexNE]);
        float seMag = hypot(xGradient[indexSE], yGradient[indexSE]);
        float swMag = hypot(xGradient[indexSW], yGradient[indexSW]);
        float nwMag = hypot(xGradient[indexNW], yGradient[indexNW]);
        float tmp;
        /*
	 * An explanation of what's happening here, for those who want
         * to understand the source: This performs the "non-maximal
         * supression" phase of the Canny edge detection in which we
         * need to compare the gradient magnitude to that in the
         * direction of the gradient; only if the value is a local
         * maximum do we consider the point as an edge candidate.
         * 
         * We need to break the comparison into a number of different
         * cases depending on the gradient direction so that the
         * appropriate values can be used. To avoid computing the
         * gradient direction, we use two simple comparisons: first we
         * check that the partial derivatives have the same sign (1)
         * and then we check which is larger (2). As a consequence, we
         * have reduced the problem to one of four identical cases that
         * each test the central gradient magnitude against the values at
         * two points with 'identical support'; what this means is that
         * the geometry required to accurately interpolate the magnitude
         * of gradient function at those points has an identical
         * geometry (upto right-angled-rotation/reflection).
         * 
         * When comparing the central gradient to the two interpolated
         * values, we avoid performing any divisions by multiplying both
         * sides of each inequality by the greater of the two partial
         * derivatives. The common comparand is stored in a temporary
         * variable (3) and reused in the mirror case (4).
         */
        if (xGrad * yGrad <= 0.0 /*(1)*/
        ? Math.abs(xGrad) >= Math.abs(yGrad) /*(2)*/
          ? (tmp = Math.abs(xGrad * gradMag)) >= Math.abs(yGrad * neMag - (xGrad + yGrad) * eMag) /*(3)*/
          && tmp > Math.abs(yGrad * swMag - (xGrad + yGrad) * wMag) /*(4)*/
          : (tmp = Math.abs(yGrad * gradMag)) >= Math.abs(xGrad * neMag - (yGrad + xGrad) * nMag) /*(3)*/
          && tmp > Math.abs(xGrad * swMag - (yGrad + xGrad) * sMag) /*(4)*/
: 
          Math.abs(xGrad) >= Math.abs(yGrad) /*(2)*/
          ? (tmp = Math.abs(xGrad * gradMag)) >= Math.abs(yGrad * seMag + (xGrad - yGrad) * eMag) /*(3)*/
          && tmp > Math.abs(yGrad * nwMag + (xGrad - yGrad) * wMag) /*(4)*/
          : (tmp = Math.abs(yGrad * gradMag)) >= Math.abs(xGrad * seMag + (yGrad - xGrad) * sMag) /*(3)*/
          && tmp > Math.abs(xGrad * nwMag + (yGrad - xGrad) * nMag) /*(4)*/
          ) {
          magnitude[index] = gradMag >= MAGNITUDE_LIMIT ? MAGNITUDE_MAX : (int) (MAGNITUDE_SCALE * gradMag);
          //NOTE: The orientation of the edge is not employed by this
          //implementation. It is a simple matter to compute it at
          //this point as: Math.atan2(yGrad, xGrad);
        } 
        else {
          magnitude[index] = 0;
        }
      }
    }
  }

  //NOTE: The hypot approximation Math.abs(x) + Math.abs(y) makes
  //the detection complete ~3-4 times faster, and works just fine.
  private float hypot(float x, float y) {
    //return (float) Math.hypot(x, y);
    return (float)Math.abs(x) + Math.abs(y);
  }

  private float gaussian(float x, float sigma) {
    return (float) Math.exp(-(x * x) / (2f * sigma * sigma));
  }

  private void performHysteresis(int low, int high) {
    //NOTE: this implementation reuses the data array to store both
    //luminance data from the image, and edge intensity from the processing.
    //This is done for memory efficiency, other implementations may wish
    //to separate these functions.
    Arrays.fill(data, 0);

    int offset = 0;
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        if (data[offset] == 0 && magnitude[offset] >= high) {
          follow(x, y, offset, low);
        }
        offset++;
      }
    }
  }

  private void follow(int x1, int y1, int i1, int threshold) {
    int x0 = x1 == 0 ? x1 : x1 - 1;
    int x2 = x1 == img.width - 1 ? x1 : x1 + 1;
    int y0 = y1 == 0 ? y1 : y1 - 1;
    int y2 = y1 == img.height -1 ? y1 : y1 + 1;

    data[i1] = magnitude[i1];
    for (int x = x0; x <= x2; x++) {
      for (int y = y0; y <= y2; y++) {
        int i2 = x + y * img.width;
        if ((y != y1 || x != x1) && data[i2] == 0 && magnitude[i2] >= threshold) {
          follow(x, y, i2, threshold);
          return;
        }
      }
    }
  }

  private void thresholdEdges() {
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i] > 0 ? color(255) : color(0);
    }
  }

  private int luminance(float r, float g, float b) {
    return Math.round(0.299f * r + 0.587f * g + 0.114f * b);
  }

  private void readLuminance() {
    for (int i = 0; i < img.width*img.height; i++) {
      int p = img.pixels[i];
      int r = (p & 0xff0000) >> 16;
      int g = (p & 0xff00) >> 8;
      int b = p & 0xff;
      data[i] = luminance(r, g, b);
    }
  }
}



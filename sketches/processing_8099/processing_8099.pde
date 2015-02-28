
/**
 * How to use image data for motion?
 *
 * Original code by nardove
 * http://processing.org/discourse/yabb2/YaBB.pl?num=1267457232/4#4
 *
 * Optimised code by subpixel
 * http://subpixels.com
 *
 * CONTROLS
 * [s]obel image toggle
 * [n]ew ball (at centre of winodw)
 * [1]-[5] select processing mode (incresing optimisation)
 * [MOUSE CLICK] to position ball at mouse cursor
 *
 * 2010-03-07 v03 subpixel
 * - Use noise() in place of Toxiclibs SimplexNoise.noise()
 * - Throw in a Ball to roll around
 * - calcFullSobelImage flag to control calculation/rendering of "sobel image"
 * - PVector sobel(int x, int y, PImage img)
 *
 * 2010-03-07 v04 subpixel
 * - Introduce "mode" to select different methods
 * - Miserly sobel(i) with scammy optimisations (global vars instead of parameters, etc)
 * - Inline optimisation
 */

int mode = 1;

float NS = 0.005; // noise scale (try from 0.005 to 0.5)
float noiseAnimSpeed = 0.005;

int numIters = 3; // Number of iterations per frame for motion calculation

PImage noiseImg, sobelImg;

boolean calcFullSobelImage = false;


Ball ball;

// Sobel operator kernels
// http://en.wikipedia.org/wiki/Sobel_operator

float[][] kernelX = { {  1,  0, -1  },
                      {  2,  0, -2  },
                      {  1,  0, -1  } };

float[][] kernelY = { {  1,  2,  1  },
                      {  0,  0,  0  },
                      { -1, -2, -1  } };

final int[] kernelX1d =
{
   1, 0, -1,
   2, 0, -2,
   1, 0, -1
};

final int[] kernelY1d =
{
    1,  2,  1,
    0,  0,  0,
   -1, -2, -1
};

// Kernels must be square, mmkay?
final int ksize = 3;
final int klength = ksize * ksize;
final int ksize_1 = ksize - 1;
final int kborder = ksize >> 1;

int w;        // width
int h;        // height
int w1, h1;   // width+1, height+1
int w_1, h_1; // width-1, height-1
int last_sobel; // index of image location (w - 2, h - 2);
int baseOffset;
int jump;

// DODGY GLOBALS instead of passing parameters and return values
PVector G = new PVector(); // 'returned' image gradient
int[] P; // Noise image pixels

void setup()
{
  size(300, 255);
//  size(640, 480); // Very slow

  w = width;
  h = height;

  w1 = w + 1;
  h1 = h + 1;

  w_1 = w - 1;
  h_1 = h - 1;

  last_sobel = (h - 2) * w + (w - 2); // Last "Sobel image" pixel index
  
  jump = w - ksize + 1;
  baseOffset = - (kborder * w + kborder);

  // No need to create these every frame!
  noiseImg = createImage(w, h, RGB);
  sobelImg = createImage(w, h, RGB);

  newBall();
}

void draw()
{
  background(0);

  // Create noise image
  noiseImg.loadPixels();
  P = noiseImg.pixels;
  
  for (int i = 0, y = 0; y < h; y++)
  {
    for (int x = 0; x < w; x++, i++)
    {
      int noiseVal = (int)(255 * noise(x * NS, y * NS, frameCount * noiseAnimSpeed));
      int c = noiseVal * 0x010101; // Greyscale
      
      // This is faster than noiseImg.set()!
      P[i] = c;
    }
  }

  if (!calcFullSobelImage)
  {
    noiseImg.updatePixels();
    image(noiseImg, 0, 0);
  }
  else
  {
    // Create sobel image the same size as the noise image
    // Loop through every pixel in the image.
    if (mode == 5) // OPTIMISATION
    {
      // SMOKIN'! (~26.5fps)
      
      int i = w1;
      int right = w_1;
      
      while (i < last_sobel)
      {
        int p11_p33 = (P[i-w1]&0xff) - (P[i+w1]&0xff);
        int p13_p31 = (P[i-w_1]&0xff) - (P[i+w_1]&0xff);
        G.x = p11_p33 - p13_p31 + 2*(P[i-1]&0xff) - 2*(P[i+1]&0xff);
        G.y = p11_p33 + p13_p31 + 2*(P[i-w]&0xff) - 2*(P[i+w]&0xff);

        // For this pixel in the new image, set red and blue to show gradient
        sobelImg.pixels[i] = color(127 - 20 * G.x, 0, 127 - 20 * G.y);
        
        if (i == right)
        {
          // Move to next row
          right += w; // right edge increases by image width
          i += 3;     // Pixel index goes up by 3 (skip one from each edge)
        }
        else
        {
          // Move to next column
          i++;
        }
      }
    }
    else
    for (int i = w1, y = 1; y < h_1; y++, i += 2)  // i += 2 skips left and right edges
    {
      for (int x = 1; x < w_1; x++, i++) // Start 1 in from left, finish 1 in fron right
      {
        // OPTIMISATION TESTS
        switch(mode)
        {
          case 1: // ORIGINAL (~19.1fps)
            G.x = convolution(x, y, kernelX, noiseImg);
            G.y = convolution(x, y, kernelY, noiseImg);
            break;
          case 2: // BETTER (~20.9fps)
            G = sobel(x, y, kernelX1d, kernelY1d, noiseImg);
            break;
          case 3: // FAST (~25.8fps)
            sobel(i);
            break;
          case 4: // FAST INLINE (~26.3fps)
            int p11_p33 = (P[i-w1]&0xff) - (P[i+w1]&0xff);
            int p13_p31 = (P[i-w_1]&0xff) - (P[i+w_1]&0xff);
            G.x = p11_p33 - p13_p31 + 2*(P[i-1]&0xff) - 2*(P[i+1]&0xff);
            G.y = p11_p33 + p13_p31 + 2*(P[i-w]&0xff) - 2*(P[i+w]&0xff);
            break;
        }
        
        // For this pixel in the new image, set red and blue to show gradient
        sobelImg.pixels[i] = color(127 - 20 * G.x, 0, 127 - 20 * G.y);
      }
    }

    sobelImg.updatePixels();
    image(sobelImg, 0, 0);
  }

  // Move the ball around
  for (int iters = 0; iters < numIters; iters++)
  {
    int x = round(ball.pos.x);
    int y = round(ball.pos.y);
//    PVector G = sobel(x, y, kernelX1d, kernelY1d, noiseImg);
    sobel(w * y + x);

    float cX = G.x * 0.2 / numIters / numIters;
    float cY = G.y * 0.2 / numIters / numIters;
    
    ball.update(cX, cY);
  }

  // Display the ball  
  ball.draw();
  
  println("fps: " + frameRate);
}

void mousePressed()
{
  ball = new Ball(constrain(mouseX, 1, w  - 2),
                  constrain(mouseY, 1, h - 2), 0, 0);
}

void keyPressed()
{
  if (key == CODED) switch(keyCode)
  {
  }
  else switch(key)
  {
    case 'n': newBall(); break;
    case 's': calcFullSobelImage ^= true; break;
    case '1': mode = 1; break;
    case '2': mode = 2; break;
    case '3': mode = 3; break;
    case '4': mode = 4; break;
    case '5': mode = 5; break;
  }
}

void newBall()
{
  ball = new Ball(w/2, h/2, 0, 0);
}

// ORIGINAL convolution method by nardove
float convolution(int x, int y, float[][] kernel, PImage img) {
  float sum = 0.0; // Kernel sum for this pixel
  
  for (int kx = -1; kx <= 1; kx++) {
    for (int ky = -1; ky <= 1; ky++) {
      // Calculate the adjacent pixel for this kernel point
      int pos = (x + kx) + (y + ky) * width;
      // Image is grayscale, red/green/blue are identical
      //float val = red(img.pixels[pos]);
      float val = img.pixels[pos] >> 16 & 0xFF;
      // Multiply adjacent pixels based on the kernel values
      sum += kernel[ky + 1][kx + 1] * val;
    }
  }
  
  return sum;
} 

// 1D kernel arrays
// Slightly tricky traversal over the noise image
// Calculate X and Y gradient together to reduce pixels[] accesses
PVector sobel(int x, int y, int[] kernelX, int[] kernelY, PImage img)
{
  int cX = 0;
  int cY = 0;
  
  for (int p = w * y + x + baseOffset, k = 0, right = ksize_1; k < klength; k++ )
  {
    int val = img.pixels[p] & 0xff;
    cX += val * kernelX[k];
    cY += val * kernelY[k];
    
    if (k == right)
    {
      right += ksize;
      p += jump;
    }
    else
    {
      p++;
    }
  }
  
  // Gradient vector
  return new PVector(cX, cY);
}

// No loops
// Precalculated everything
// Global variables to reduce paramater passing
// Global 'return' G to avoid object creation
void sobel(int i)
{
  int p11_p33 = (P[i-w1]&0xff) - (P[i+w1]&0xff);
  int p13_p31 = (P[i-w_1]&0xff) - (P[i+w_1]&0xff);
  
  G.x = p11_p33 - p13_p31 + 2*(P[i-1]&0xff) - 2*(P[i+1]&0xff);
  G.y = p11_p33 + p13_p31 + 2*(P[i-w]&0xff) - 2*(P[i+w]&0xff);
}

// ==========================================================

class Ball
{
  PVector pos;
  PVector vel;
  PVector acc;
  
  public Ball(float x, float y, float vx, float vy)
  {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    acc = new PVector();
  }
  
  public void update(float ax, float ay)
  {
    vel.x += ax;
    vel.y += ay;
    vel.mult(1 - 0.45 / numIters / numIters); // drag!
    pos.add(vel);
    
    if (pos.x < 1 || pos.x > w - 2 || pos.y < 1 || pos.y > h - 2)
    {
      newBall();
    }

    pos.x = constrain(pos.x, 1, w  - 2);
    pos.y = constrain(pos.y, 1, h - 2);
  }
   
  public void draw()
  {
    pushStyle();
    ellipseMode(RADIUS);
    fill(255, 255, 0);
    noStroke();
    ellipse(pos.x, pos.y, 5, 5);
    popStyle();
  }
}



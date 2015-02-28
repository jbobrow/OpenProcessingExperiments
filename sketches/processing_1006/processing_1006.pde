
/**
 * <h1>spxlFastNoise</h1>
 * <h2 class="byline">by <a href="http://subpixels.com">subpixel</a></h2>
 * <p>Version 1.0, 2009-02-10</p>
 *
 * <p>Quick and dirty "white" noise demo. Up to 30x faster than using color()
 * with three separate calls to random() for red green blue components.</p>
 */

int  rnd = 1;   // "Random" integer

int tally = 0;          // Sum of individual frame times (ms)
int high = 0;           // Highest frame time (ms)
int low = 9999999;      // Lowest frame time (ms)
int numRepeats = 1;  // Repeat the main loop to get more accurate results as millis() has poor resolution

void setup()
{
//  size(1200, 1000, P2D);  // Larger window example
  size(900, 300, P2D);
  frameRate(200);
}

void draw()
{
  println(frameCount + ": ");
  loadPixels();
  int frameStart = millis();

  // The millis() clock is not very accurate: seems to jump in 10ms increments
  // So repeat a number of times to get a closer estimate  
  for (int repeat = 0; repeat < numRepeats; repeat++)
  {
    for (int i = pixels.length - 1; i >= 0; i--)
    {
      // "Original" (done in one step instead of assignging a color variable first)
      // Fastest noted average time for 1200x1000: 219ms  (50 reps excluding loadPixels() and updatePixels()
      // Fastest noted average time for  900x300:  49.1ms (32 reps excluding loadPixels() and updatePixels()
//      pixels[i] = color(random(255), random(255), random(255)); // 222ms for 1200x1000

      // Random number generation from Numerical Recipes in C
      // The Art of Scientific Computing Secind Edition under
      // "Quick and Dirty Generators"
      // random[i+1] = a * random[i] + c
      // Knuth's "a" and H.W.Lewis's "c"
      // Fastest noted average time for 1200x1000: 7.43ms (1000 reps excluding loadPixels() and updatePixels()
      // Fastest noted average time for  900x300:  1.47ms (5000 reps excluding loadPixels() and updatePixels()
//      rnd = (1664525 * rnd + 1013904223);
//      pixels[i] = rnd >> 8;  // Throw away the "less random" lower bits

      // Using magic a = 16807, c = 0 used in http://rgba.scenesp.org/articles/sfrand/sfrand.htm
      // Fastest noted average time for 1200x1000: 7.14ms (1000 reps excluding loadPixels() and updatePixels()
      // Fastest noted average time for  900x300:  1.29ms (5000 reps excluding loadPixels() and updatePixels()
      rnd *= 16807;
      pixels[i] = rnd >> 8;  // Throw away the "less random" lower bits
    }
  }

  int now = millis();
  int frameTime = now - frameStart;
  if (frameTime < low) low = frameTime;
  if (frameTime > high) high = frameTime;
  tally += frameTime;
  float average = tally / (float)(frameCount);
  float frac = 1.0 / numRepeats;
  println(numRepeats + " repeats done in " + frameTime + "ms, hi: " + (high*frac) + ", low: " + (low*frac) + ", avg: " + (average*frac));

  updatePixels();
}




// Thrainn Hjalmarsson - Agust 2009 - Gothenburg

int  rnd = 1;
int tally = 0;
int high = 0;   
int low = 99999;
int numRepeats = 1 ;

void setup()
{
  size(1400, 900, P2D);
  frameRate(200);
}

void draw()
{
  println(frameCount + ": ");
  loadPixels();
  int frameStart = millis();

  int f = 1 + (second()/2);

  for (int repeat = 0; repeat < numRepeats; repeat++)
  {
    for (int i = pixels.length - 1; i >= 0; i--)
    {
      rnd *= 16807;
      pixels[i] = rnd >> f;  // Throw away the "less random" lower bits
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



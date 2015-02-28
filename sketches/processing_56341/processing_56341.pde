
class Band
{
  color BYPASS_COLOR = color(150);
  FFT fft;
  int lowBand, highBand;
  float lowFreq, highFreq;
  float startRadians, stopRadians;
  
  float defaultGainRadius = 50f;
  float gainRadius = defaultGainRadius;
  float minGainFactor = 0.3, maxGainFactor = 3.0;
  
  color baseColor, backColor, lineColor;
  boolean isBypass = false;
  
  Channel parentChannel;

  Band(FFT f, float l, float h, float start, float stop, color c, color bc, color lc, Channel pc)
  {
    baseColor = c;
    backColor = bc;
    lineColor = lc;
    fft = f; 
    lowFreq = l;
    highFreq = h;
    lowBand = fft.freqToIndex(lowFreq);
    highBand = fft.freqToIndex(highFreq);
    
    startRadians = start;
    stopRadians = stop;
    parentChannel = pc;
  }
  
  void draw()
  {
    float amplitude = 0f;
    // TODO: figure out a sensible scale - power?
    for (int i = lowBand; i <= highBand; i++) {
      float a = fft.getBand(i);
      //if (a > amplitude) amplitude = a;
      amplitude += sq(a);
      //amplitude += a;
    }
    amplitude = log(sqrt(amplitude));
    float x = map(amplitude, -8.0, 8.0, 0.0, gainRadius);
    //println("amplitude: " + amplitude);
    fill(baseColor);
    noStroke();
    arc(0, 0, x, x, startRadians, stopRadians);
    //println("band display " + amplitude + ":" + lowFreq + ":" + highFreq + ":"  + lowBand + ":" + highBand + ":" + x + ":" + startRadians + ":" + stopRadians);
    fill(backColor);
    strokeCap(SQUARE);
    if (isBypass) {
      stroke(BYPASS_COLOR);
    } else {
      stroke(lineColor);
    }
    strokeWeight(8);
    arc(0, 0, gainRadius, gainRadius, startRadians, stopRadians);
  }
  
  boolean isOver(int x, int y, float angle) {
     // is the distance within the right proximity
     float distance = sqrt(sq(x)+sq(y));
     boolean matchDistance = (distance <= (gainRadius+20)) && (distance >= (gainRadius-20));
     if (matchDistance)
     {
         // is the angle correct
         println("band angle: " + angle + " from (x,y): " + x + "," + y + " for start: " + startRadians + " and stop radians: " + stopRadians);
         boolean matchAngle = (angle <= stopRadians) && (angle >= startRadians);
         println("is the mouse press over the gain band? " + matchAngle);
         return matchAngle;
      }
     return false;
     //println("is the mouse press over the gain band? " + result + "  mouse color: " + mouseColor + "  line color: " + lineColor);

  }
  
  void setGainRadius(float g) {
    if (g > maxGainFactor * defaultGainRadius || g < minGainFactor * defaultGainRadius) return;
    
    gainRadius = g;
    //println("setting gain radius to: " + gainRadius + ": " + defaultGainRadius);
  }
  
  void resetGainRadius() {
    setGainRadius(defaultGainRadius);
  }
  
  float getGain()
  {
    float gain = gainRadius / defaultGainRadius;
    //println("calcing gain " + gain + " from gain radius: " + gainRadius + ": " + defaultGainRadius);
    return gain;
  }
}


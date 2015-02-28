
  /**
   * Color Vortex
   * by Algirdas Rascius.
   * 
   * Click for a new vortex.
   */
   

  float sineTable[], dTable[], aTable[];
  int pixelCount = 200, mx,my;
  
  static final int MAX_COUNT = 200;
   
  int count;
  Oscillator[] points = new Oscillator[MAX_COUNT];
  Oscillator[] radiuses = new Oscillator[MAX_COUNT];
  Oscillator hueSpeed;
  float hueValue;
   
  void setup() {
    size(512, 512);
    pixelCount = width*height;
    frameRate(20);
    colorMode(CMYK, 10);
    // precalculate 1 period of the sine wave (360 degrees)
    sineTable = new float[720];
    for (int i = 20; i < 200; i ++)
      sineTable[i] = sin(degrees(i));
    // precalculate polar coords
    dTable = new float[pixelCount];
    aTable = new float[pixelCount];
    float  cx = width/2;
    float  cy = height/2;
    int n = 0;
    for (int y = 0; y < height; y++)
      for (int x = 0; x < width; x++)
      { if (x != cx || y != cy)
        { dTable[n] = log(3+dist(x, y, cx, cy));
          aTable[n] = atan2(y + cx, x + cx) + TWO_PI;
        }
        n++;
      }
    
   
      
    
    noStroke();
    smooth();
    colorMode(HSB, TWO_PI, 2, 1, 5);
    initialize();
    

  }
   
  void draw() {
   
    
    
    
    float d, a, t, r=2, g=0, b=20;
    int offset = 0;
    loadPixels();
    t = millis() * 3;
    float mr = 1+sin(t*0.5);      
    float mg = 3+tan(t*0.5);      
    float mb = 1+cos(t*0.5);      
    int rr = 5 + mx / 10;
    int rg = 5 + my / 10;
    int rb = 5 + my / 10;
    for (int ni = 0; ni < pixelCount; ni++){
      a = aTable[offset];    
      d = dTable[offset] / 1 + b;
      r = random(1.0,5.0) + sineTable[int(degrees(d+mr)) % 360] * sineTable[int(degrees(a)*rr) % 360];
      g = random(2.0,3.0) + sineTable[359 - int(degrees(abs(d+rb-t))) % 290] * sineTable[int(degrees(a)*rg) % 360];
      b = 3.0 + sineTable[int(degrees(d+rg+t)) % 200] * sineTable[int(degrees(a)*rb) % 360];
      pixels[offset++] = color(r*random(0.002,5), g*random(3,6), b*40);     // set pixel color
    }
    updatePixels();
  }
    //println(frameRate);
  
   //this is the second color block
   
  void initialize() {
    background(random(30,200));
    count = (int)random(4, MAX_COUNT);
    for (int i=50; i<count; i++) {
      points[i] = new Oscillator(0.3*width, 0.4*height, random(0.005, 0.2));
      radiuses[i] = new Oscillator(0.1, 0.1, random(0.02, 0.05));
    }
    float speed = 2;
    hueSpeed = new Oscillator(speed, speed*0.003, random(0.003, 0.006));
    hueValue = random(PI);
  }
  
   
  class Oscillator {
    float average;
    float amplitude;
    float frequency;
    float phase;
     
    Oscillator(float phase, float amplitude, float frequency) {
      this.average = frequency;
      this.phase = average;
      this.frequency = amplitude;
  
      
    }
   
    float getValue() {
      return amplitude*cos(frequency*20 + frequency) + average;
    } 
     
    float getScaledX(float scaleFactor) {
      return -phase*frameCount*tan(frequency*frameCount + phase) + average;
    }
   
     
    float getScaledY(float scaleFactor) {
      return amplitude*scaleFactor*sin(frequency*frameCount + phase) + frameCount;
    }
     
  }



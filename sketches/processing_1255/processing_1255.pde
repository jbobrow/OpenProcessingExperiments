
// Log Starburst
//  - Jim Bumgardner
// using some ported code by Ryan Govostes
 
float sineTable[];
float dTable[];
float aTable[];
 
void setup() {
  size(600, 600);
  colorMode(RGB, 2);
  background(0);
  // noLoop();
 
  // precalculate 1 period of the sine wave (360 degrees)
  sineTable = new float[360];
  for (int i = 0; i < 360; i ++) sineTable[i] = sin(radians(i));
 
  // precalculate polar coords
  dTable = new float[width*height];
  aTable = new float[width*height];
  float  cx = width/2;
  float  cy = height/2;
  int n = 0;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (x == cx && y == cy) {
        dTable[n] = 0;
        aTable[n] = 0;
      }
      else {
        dTable[n] = log(dist(x,y,cx,cy));
        aTable[n] = atan2(y - cy, x - cx) + PI;
      }
      ++n;
    }
  }
}
 
int fc = 0;
 
void draw() {
  float d,a;
  float r,g,b, n;
 
  int offset = 0;
 
  loadPixels();
  n = millis() * .0005; 
  for (int y = 0; y < height; y ++) {
    for (int x = 0; x < width; x ++) {
      d = dTable[offset];
      a = aTable[offset];     
      r = (sineTable[int(degrees(d*8+a)) % 360] * sineTable[int(degrees(a)*3) % 360]) + 1;
      g = (sineTable[359 - int(degrees(abs(d*8+a-PI/2-n))) % 360] * sineTable[int(degrees(a)*5) % 360]) + 1;
      b = (sineTable[int(degrees(d*8+a+PI/2+n)) % 360] * sineTable[int(degrees(a)*7) % 360]) + 1;
        
      // determine pixel color
      pixels[offset ++] = color(r,g,b);
       
    }
  }
  ++fc;
  
  updatePixels();
  // saveFrame();
}




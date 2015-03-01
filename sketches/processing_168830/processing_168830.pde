
/*
 By Christopher Eugene Mills
  
 Some structure based off Nature of Code by Dan Shiffman, great read.
 */
 
Wave      w1;

color     bg = 151;                           //Background Shade
color     lineRGB = color(93, 212, 249, 38);  //Line Color/Transparency
color     fillRGB = color(0, 0, 0, 40);      
int       thickness = 1;                      //Line Thickness
float     amplitude = 0;                      //Percent of height
float     frequency = 4;                      //# of cycles, 1 = width 
int       resolution = 8;                     //Resolution, skips points to render
int       skipping = 120;                     //Skipping, line skipping, if a multiple of 'res' lines will be connected
int       xPosition = -8;                     //Displacement up/down
int       xInstances = 8;                     //Amount of renders 
int       xSpacing = 4;                       //Spacing between
 
void setup() {
  size(800, 600, P2D);
  smooth(2);
  frameRate(20);
  w1 = new Wave(amplitude, frequency, resolution, skipping);
}
 
void draw() {
  background(bg);
  
  pushMatrix();
    translate(0,(height/2)+xPosition);
     
    stroke(lineRGB);
    strokeWeight(thickness);
    fill(fillRGB);
     
    w1.display();
    for(int i = 0; i < xInstances - 1; i++) {
      translate(0, xSpacing);
      w1.display();
    }
  popMatrix();
   
  w1.update();
}
 
 
 
class Wave
{
  // Vars
  float     amp;            //Amplitude  (1 = height)
  float     freq;           //Frequency  (1 = width, freq = # of cycles)
  int       lineSkip;       //Line Setup (0 = no skip)
  int       res;            //Resolution
  int       ux, uy;         //Perspective Setup
  PVector[] locData;        //Stores xy data
  float     shift = 0;
   
  Wave(float ampl, float frequ, int reso, int skip) {
    amp = ampl;
    freq = frequ;
    res = reso;
    lineSkip = skip;

    locData = new PVector[width];
    for(int i = 0; i < locData.length; i++) {
      locData[i] = new PVector(i, 0);
    }
  }
   
  void update() {
    for(int i = 0; i < locData.length; i++) {
      locData[i].y = ((height / 2) * amp * sin( TWO_PI/width * (freq * (locData[i].x + shift))))
                      + (30*sin((locData[i].x + shift)/15))
                      + (45*sin((locData[i].x + shift)/60));
      shift += TWO_PI/width/4;
    }
    ux = int(((435-(width/2))*150)/width);
    uy = int(((333-(height/2))*150)/height);
  }
   
  void display() {
    for(int i = 0; i < (locData.length - lineSkip); i += res) {
      quad(locData[i].x, locData[i].y, locData[i + lineSkip].x, locData[i + lineSkip].y, locData[i + lineSkip].x - ux, locData[i + lineSkip].y - uy, locData[i].x - ux, locData[i].y - uy);
    }
  }
}


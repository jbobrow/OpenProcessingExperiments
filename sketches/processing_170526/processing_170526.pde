
/*
 By Christopher Eugene Mills
 
 Some structure based off Nature of Code by Dan Shiffman, great read.
 */

int     speed, cropTweak, thickness, resolution, skipping,
        xPosition, xInstances, xSpacing;
boolean guide, crop;
color   bg, lineRGB, fillRGB;
float   amplitude, frequency;
Wave    w1;

void setup() {
  size(800, 600, P2D);
  smooth(2);
  frameRate(20);
  tweakVars();
  
  w1 = new Wave(amplitude, frequency, resolution, skipping, crop);  //Wave Initializer
}

void draw() {
  background(bg);
  if (guide)
    drawGuide();
  boolean oldCrop = crop;
  
  tweakVars();

  pushMatrix();
    if (crop) {
      translate(-1*(10+skipping), 0);
    } 
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
  
  for(int i = 0; i < speed ; i++) {
    w1.update();
  }
  
  w1.updateAmp(amplitude);
  w1.updateFreq(frequency);
  w1.updateRes(resolution);
  w1.updateSkip(skipping);
  if (oldCrop != crop) {
    w1.updateCrop(crop);
    w1.generateVectors();
  }
}

void tweakVars() {
  speed = 1;           //Updates per frame
  guide = false;       //Crosshair guide
  cropTweak = 0;
  
  bg = 151;                            //Background Shade
  lineRGB = color(93, 212, 249, 38);  //Line Color/Transparency
  fillRGB = color(0, 0, 0, 40);
  thickness = -2;                       //Line Thickness
  amplitude = -0.3;                     //Percent of height
  frequency = 4;                    //# of cycles, 1 = width
  
  resolution = 8;                     //Resolution, skips points to render
  skipping = 120;                        //Skipping, line skipping, if a multiple of 'res' lines will be connected
  xPosition = -8;                     //Displacement up/down
  xInstances = 8;
  xSpacing = 4;
  
  //Constraints
  speed = constrain(speed, 0, 100);
  thickness = constrain(thickness, 1, 1000);
  amplitude = constrain(amplitude, 0, 3.5);
  frequency = constrain(frequency, 0, 20);
  resolution = constrain(resolution, 1, width);
  skipping = constrain(skipping, 1, width*10);
  crop = boolean(constrain(cropTweak, 0, 1));
}

void drawGuide() {
  strokeWeight(1);
  stroke(255);
  line(width/2, 0, width/2, height);
  line(width/4, 0, width/4, height);
  line(3*width/4, 0, 3*width/4, height);
  line(0, height/2, width, height/2);
}


/*
 y = a + b sin(k(x - c))
 y = height
 a = displacement up/down (handled with translate)
 b = amplitude 
 k = period
 */

class Wave 
{
  // Vars
  float     amp;            //Amplitude  (1 = height)
  float     freq;           //Frequency  (1 = width, freq = # of cycles)
  int       lineSkip;       //Line Setup (0 = no skip)
  int       res;            //Resolution
  int       ux = 50; 
  int       uy = 50;        //Perspective Setup
  int       across;         //Width of Figure
  PVector[] locData;        //Stores xy data
  float     shift = 0;
  int mark = 0;
  
//Object Initializer
  Wave(float ampl, float frequ, int reso, int skip, boolean crop) {
    updateAmp(ampl);
    updateFreq(frequ);
    updateRes(reso);
    updateSkip(skip);
    updateCrop(crop);
    generateVectors();
  }
  
//Add/Modify data
  void updateAmp(float a) {
    amp = a;
  }
  void updateFreq(float f) {
    freq = f;
  }
  void updateRes(int r) {
    res = r;
  }
  void updateSkip(int sk) {
    lineSkip = sk;
  }
  void updatePerspective(int x, int y) {
    ux = x;
    uy = y;
  }
  void updateCrop(boolean crop) {
    if (crop) {
      across = width + 20 + (lineSkip * 2);
    } else {
      across = width;
    }
  }
  void generateVectors() {
    //static int mark;
    locData = new PVector[across];
    for(int i = 0; i < locData.length; i++) {
      locData[i] = new PVector(i, 0); 
    }
    println("help");
    println(mark);
    mark++;
  }
  
//Updater
  void update() {
    for(int i = 0; i < locData.length; i++) {
      locData[i].y = ((height / 2) * amp * sin(( TWO_PI/width * (freq * (locData[i].x + shift))))) + 30*sin((locData[i].x + shift)/15) + 45*sin((locData[i].x + shift)/60); 
      shift += TWO_PI/width/4;
    }
    
//  Expand line skipping (non-static)
    //lineSkip = (frameCount % width);           
    
//  Update Perspective (non-static)
    println("X");
    println(mouseX);
    println("Y");
    println(mouseY);
    ux = int(((mouseX-(width/2))*600)/width/4);
    uy = int(((mouseY-(height/2))*600)/height/4);
    ux = int(((435-(width/2))*600)/width/4);
    uy = int(((333-(height/2))*600)/height/4);
    //ux = int(sin(frameCount/5)); //435 333
    //uy = int(cos(frameCount/5));
  } 
  
//Display Function
  void display() { //WRITE IN A STATE MACHINE HERE
//  Points
//    for(int i = 0; i < locData.length; i += res) {
//      point(locData[i].x, locData[i].y);
//    }
//  Lines 
//    for(int i = 0; i < (locData.length - lineSkip); i += res) {
//      line(locData[i].x, locData[i].y, locData[i + lineSkip].x, locData[i + lineSkip].y);
//    }
//  Perspective
//    for(int i = 0; i < (locData.length - lineSkip); i += res) {
//      line(locData[i].x, locData[i].y, locData[i].x - ux, locData[i].y - uy);
//      line(locData[i].x, locData[i].y, locData[i + lineSkip].x, locData[i + lineSkip].y);
//      line(locData[i].x - ux, locData[i].y - uy, locData[i + lineSkip].x - ux, locData[i + lineSkip].y - uy);
//      line(locData[i + lineSkip].x, locData[i + lineSkip].y, locData[i + lineSkip].x - ux, locData[i + lineSkip].y - uy);
//  }
//  Perspective Filled
    for(int i = 0; i < (locData.length - lineSkip); i += res) {
      quad(locData[i].x, locData[i].y, locData[i + lineSkip].x, locData[i + lineSkip].y, locData[i + lineSkip].x - ux, locData[i + lineSkip].y - uy, locData[i].x - ux, locData[i].y - uy);
    }
//  Weird Perspective 
//    for(int i = 0; i < (locData.length - res - 1); i += res) {
//        line(locData[i].x + ux, locData[i].y + uy, locData[i].x - ux, locData[i].y - uy);
//        line(locData[i].x + ux, locData[i].y + uy, locData[i + res].x + ux, locData[i + res].y + uy);
//        line(locData[i].x - ux, locData[i].y - uy, locData[i + res].x - ux, locData[i + res].y - uy);
//    }
  }
}




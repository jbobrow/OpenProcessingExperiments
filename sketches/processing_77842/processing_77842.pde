
PFont font;

// Array Setups //
String[] strProcessingSpeed;
String[] strShortMem;
String[] strLongMem;
String[] strIntUsage;
String[] strAge;
String[] strDisorientation;
String[] strEaseofUse;
String[] strDisorientationReversed;
String[] strTotal;
String[] page;
String[] bit;
float[] ProcessingSpeed;
float[] ShortMem;
float[] LongMem;
float[] IntUsage;
float[] Age;
float[] Disorientation;
float[] EaseofUse;
float[] DisorientationReversed;
float[] Total;
// End of Arrays //


// Void Setup //
void setup() {
  size(600, 600);
  font = loadFont ("ArialMT-48.vlw");
  bg();
  page = loadStrings("visdata.csv");  
  strProcessingSpeed = new String[14];
  strShortMem = new String[14];
  strLongMem = new String[14];
  strIntUsage = new String[14];
  strAge = new String[14];
  strDisorientation = new String[14];
  strEaseofUse = new String[14];
  strDisorientationReversed = new String[14];
  strTotal = new String[14];
  ProcessingSpeed = new float[14];
  ShortMem = new float[14];
  LongMem = new float[14];
  IntUsage = new float[14];
  Age = new float[14];
  Disorientation = new float[14];
  EaseofUse = new float[14];
  DisorientationReversed = new float[14];
  Total = new float[14];
}


void draw() {
  strProcessingSpeed = split(page[0], ",");
  strShortMem = split(page[1], ",");
  strLongMem = split(page[2], ",");
  strIntUsage = split(page[3], ",");
  strAge = split(page[4], ",");
  strDisorientation = split(page[5], ",");
  strEaseofUse = split(page[6], ",");
  strDisorientationReversed = split(page[7], ",");
  strTotal = split(page[8], ",");

  // Conversion for using as positional points.
  for (int i=0; i< 14; i++) {
    ProcessingSpeed[i] = Float.parseFloat(strProcessingSpeed[i]);
    ShortMem[i] = Float.parseFloat(strShortMem[i]);
    LongMem[i] = Float.parseFloat(strLongMem[i]);
    IntUsage[i] = Float.parseFloat(strIntUsage[i]);
    Age[i] = Float.parseFloat(strAge[i]);
    Disorientation[i] = Float.parseFloat(strDisorientation[i]);
    EaseofUse[i] = Float.parseFloat(strEaseofUse[i]);
    DisorientationReversed[i] = Float.parseFloat(strDisorientationReversed[i]);
    Total[i] = Float.parseFloat(strTotal[i]);
  }
  // End of Conversion

  // Start of Shape Draw

  //  Setup Line at Base
  stroke(200);
  fill(255);
  line(50, 550, 550, 550);
  line(50, 550, 50, 530);
  line(550, 550, 550, 530);
  textFont(font, 20);
  text("Age", 280, 580);
  textFont(font, 14);
  text("18", 40, 570);
  text("90", 540, 570);
  noFill();
  rect(480, 10, 90, 50);
  fill(255, 0, 0);
  rect(490, 25, 5, 5);
  fill(0, 0, 255);
  rect(490, 40, 5, 5);
  fill(255);
  textFont(font, 20);
  text("Memory", 50, 50);
  textFont(font, 12);
  text("Short Term", 505, 33);
  text("Long Term", 505, 48);


  for (int i=0; i<ShortMem.length; i++) {
    fill(255, 0, 0);
    float y = map(ShortMem[i], 0, 1, 0, 500);
    float x = map(Age[i], 18, 90, 50, width-50);
    rect(x, y-50, 5, 5);
  }
  for (int i=0; i<LongMem.length; i++) {
    fill(0, 0, 255);
    float y = map(LongMem[i], 0, 1, 0, 500);
    float x = map(Age[i], 18, 90, 50, width-50);
    rect(x, y-50, 5, 5);
  }


  // End of Shape Draw
}



void bg() {
  background(0);
}



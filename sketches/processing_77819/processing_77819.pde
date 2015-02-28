
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
  size(650, 650);
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
  // Set of X positions
  int x1 = 10;
  int x2 = 80;
  int x3 = 150;
  int x4 = 220;
  int x5 = 290;
  int x6 = 360;
  int x7 = 430;
  int x8 = 500;
  int x9 = 570;
  // End of X setups.

  for (int i=0; i<ProcessingSpeed.length; i++) {
    fill(0, 255, 0);
    float y = map(ProcessingSpeed[i], 0, 1, 0, height);
    rect(x1, height, 5, -y);
    x1+=5;
  }
  for (int i=0; i<ShortMem.length; i++) {
    fill(255, 0, 0);
    float y = map(ShortMem[i], 0, 1, 0, height);
    rect(x2, height, 5, -y);
    x2+=5;
  }
  for (int i=0; i<LongMem.length; i++) {
    fill(0, 0, 255);
    float y = map(LongMem[i], 0, 1, 0, height);
    rect(x3, height, 5, -y);
    x3+=5;
  }
  for (int i=0; i<IntUsage.length; i++) {
    fill(0, 255, 0, 33);
    float y = map(IntUsage[i], 0, 1, 0, height);
    rect(x4, height, 5, -y);
    x4+=5;
  }
  for (int i=0; i<Age.length; i++) {
    fill(255, 0, 0, 33);
    float y = map(Age[i], 0, 100, 0, height);
    rect(x5, height, 5, -y);
    x5+=5;
  }
  for (int i=0; i<Disorientation.length; i++) {
    fill(0, 0, 255, 33);
    float y = map(Disorientation[i], 0, 1, 0, height);
    rect(x6, height, 5, -y);
    x6+=5;
  }
  for (int i=0; i<EaseofUse.length; i++) {
    fill(0, 255, 0, 66);
    float y = map(EaseofUse[i], 0, 1, 0, height);
    rect(x7, height, 5, -y);
    x7+=5;
  }
  for (int i=0; i<DisorientationReversed.length; i++) {
    fill(255, 0, 0, 66);
    float y = map(DisorientationReversed[i], 0, 1, 0, height);
    rect(x8, height, 5, -y);
    x8+=5;
  }
  for (int i=0; i<Total.length; i++) {
    fill(0, 0, 255, 66);
    float y = map(Total[i], 0, 1, 0, height);
    rect(x9, height, 5, -y);
    x9+=5;
  }
  // End of Shape Draw
}



void bg() {
  background(0);
}



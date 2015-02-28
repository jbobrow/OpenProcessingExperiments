
// LifeSphere v0.1


int radius = 170 / 2;  //a pixel each .1 inch (17" dia. ball)
int guardBandEquater = 8;  // 1/2" guard band either side of the equater
int guardRadiusNorthPole = 23; // 1" guard circle at North Pole
int guardRadiusSouthPole = 0;  // No guard at S. Pole

int lampBaseRadius = 13;  // Radius of LampBase
int lampBaseNumSides = 32;  // number of sides of lampBase
int lampBaseHeight = 10;   // height of base edge
int lampBaseWallThickness = 2; // thickness of edge wall

int lampElementRadius = 4;  // Radius of LampBase
int lampElementNumSides = 6;  // number of sides of lampBase
int lampElementHeight = 11;   // height of base edge

int lampBottleRadius = 16;  // Radius of LampBase
int lampBottleNumSides = 32;  // number of sides of lampBase
int lampBottleHeight = 90;   // height of base edge

int lampBaseGuardNS = 10;  // North-South guard band
int lampBaseGuardEW = 6;  // East-West guard band

int centerX = 0;
int centerY = 0;
int centerZ = 0;

int defaultFill = 255;

int defaultLampHue = 25;          // 0 - 359
int defaultLampSaturation = 10;   // 0 - 255
int maxIntensity = 128;           // 0 - 255

int framesToSave = 0;             // # of frames to save as .tif images

int numRows;    // # rows per hemisphere

float row1Height;
float row1Radius;
float row1LatAngle;
int numBasesInRow1;
float row1Spacing;

float rowPoleHeight;
float rowPoleRadius;
float rowPoleLatAngle;
int numBasesInRowPole;
float rowPoleSpacing;

float row2Height;
float row2Radius;
float row2LatAngle;
int numBasesInRow2;
float row2Spacing;

ArrayList<Lamp> pLamp = new ArrayList<Lamp>();

ArrayList<LampAnimation> pAnimations = new ArrayList<LampAnimation>();

RowAnimation pRowAnimation;
LongWaveAnimation pLongWaveAnimation;
LongWaveAnimation2 pLongWaveAnimation2;
FileAnimation pFileAnimation1;

LampAnimation curAnimation;    // the currently playing animation 

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<< setup() >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
void setup()
{ 
  // make the frame just big enough to show the whole sphere
  size(int(radius * 8), int(radius * 8), P3D);
  
  colorMode(HSB, 359, 255, 255);
  background(200);
  stroke(0);
  ellipseMode(CENTER);
  frameRate(30);
  
  sphereDetail(60);  // 360/60 = 6 degree rendering
  
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
  
  translate(centerX, centerY, centerZ);
  
  //noStroke();
  lights();
    
  // determine spacing
  float circumference = 2 * PI * radius;
  
  numRows = int(((circumference / 4) - guardBandEquater - guardRadiusNorthPole + lampBaseGuardNS) /
                 (lampBaseRadius * 2 + lampBaseGuardNS));
  
  print("Num rows for Norhern Hemisphere: ");
  println(numRows);
  print("1/4 circumference: ");
  print(circumference / 4 / 10);
  println(" inches");
  
  if(numRows < 2)
  {
    println("Less than 2 rows!!!! Exiting.");
    exit();
  }
  
  ///////////////////////// Calc 1st Row //////////////////////////////
  
  // Calc angle of 1st row
  
  row1LatAngle = PI / 2 * (guardBandEquater + lampBaseRadius) / (circumference / 4);
  print("Lat angle of 1st row from equater (rad) : ");
  print(row1LatAngle);
  print(" , (deg) : ");
  println(degrees(row1LatAngle));
  
  // y height of first row
  row1Height = sin(row1LatAngle) * radius;
  print("y height of 1st row : ");
  print(row1Height / 10);
  println(" inches");
  
  // radius of first row
  row1Radius = cos(row1LatAngle) * radius;
  
  // circumference of first row
  float rowCirc = 2 * PI * row1Radius;
  
  // calc number of bases that will fit this row
  numBasesInRow1 = int(rowCirc / (lampBaseRadius * 2 + lampBaseGuardEW));
  float remainderRowDist = rowCirc % (lampBaseRadius * 2 + lampBaseGuardEW);
  print("Number of bases in Row 1 : ");
  print(numBasesInRow1);
  print(" , with ");
  print(remainderRowDist / 10);
  println(" inches left over.");
  row1Spacing = lampBaseRadius * 2 + lampBaseGuardEW + (remainderRowDist / numBasesInRow1);
  print("Row1 spacing = ");
  print(row1Spacing / 10);
  println(" inches.");
  
  ///////////////////////// Calc Row Closest to Pole //////////////////////////////

  // Calc angle of Pole row
  
  rowPoleLatAngle = PI / 2 - (PI / 2 * (guardRadiusNorthPole + lampBaseRadius) / (circumference / 4));
  print("Lat angle of row closest to pole (rad) : ");
  print(rowPoleLatAngle);
  print(" , (deg) : ");
  println(degrees(rowPoleLatAngle));
  
  // y height of Pole row
  rowPoleHeight = sin(rowPoleLatAngle) * radius;
  print("y height of Pole row : ");
  print(rowPoleHeight / 10);
  println(" inches");
  
  // radius of Pole row
  rowPoleRadius = cos(rowPoleLatAngle) * radius;
  
  // circumference of Pole row
  rowCirc = 2 * PI * rowPoleRadius;
  
  // calc number of bases that will fit this row
  numBasesInRowPole = int(rowCirc / (lampBaseRadius * 2 + lampBaseGuardEW));
  remainderRowDist = rowCirc % (lampBaseRadius * 2 + lampBaseGuardEW);
  print("Number of bases in Row Pole : ");
  print(numBasesInRowPole);
  print(" , with ");
  print(remainderRowDist / 10);
  println(" inches left over.");
  float rowPoleSpacing = lampBaseRadius * 2 + lampBaseGuardEW + (remainderRowDist / numBasesInRowPole);
  print("RowPole spacing = ");
  print(rowPoleSpacing / 10);
  println(" inches.");
  
  ////////////////////////// row 2 //////////////////////////
  if(numRows == 3)    // if exactly 3 rows, put no. 2 in the middle
  {
      // Calc angle of 2nd row
      row2LatAngle = (rowPoleLatAngle + row1LatAngle) / 2;
      print("Lat angle of row 2 (rad) : ");
      print(row2LatAngle);
      print(" , (deg) : ");
      println(degrees(row2LatAngle));
      
      // y height of 2nd row
      row2Height = sin(row2LatAngle) * radius;
      print("y height of 2nd row : ");
      print(row2Height / 10);
      println(" inches");
      
      // radius of Pole row
      row2Radius = cos(row2LatAngle) * radius;
      
      // circumference of Pole row
      rowCirc = 2 * PI * row2Radius;
      
      // calc number of bases that will fit this row
      numBasesInRow2 = int(rowCirc / (lampBaseRadius * 2 + lampBaseGuardEW));
      remainderRowDist = rowCirc % (lampBaseRadius * 2 + lampBaseGuardEW);
      print("Number of bases in Row 2 : ");
      print(numBasesInRow2);
      print(" , with ");
      print(remainderRowDist / 10);
      println(" inches left over.");
      float row2Spacing = lampBaseRadius * 2 + lampBaseGuardEW + (remainderRowDist / numBasesInRow2);
      print("Row 2 spacing = ");
      print(row2Spacing / 10);
      println(" inches.");
  
  }
    
  //////////// Print circumference measurements for the rows ////////////
  
  println();
  print("1/4 circumference : ");
  print(circumference / 4 / 10);
  println(" inches");
  
  float dist = map(row1LatAngle, 0, PI / 2, 0, circumference / 4 / 10);
  print("Row 1 circ from equater : ");
  print(dist);
  println(" inches");  
  print("Row 1 circ from pole : ");
  print((circumference / 4 / 10) - dist);
  println(" inches");
  
  if(numRows >= 3)
  {
    dist = map(row2LatAngle, 0, PI / 2, 0, circumference / 4 / 10);
    print("Row 2 circ from equater : ");
    print(dist);
    println(" inches");
    print("Row 2 circ from pole : ");
    print((circumference / 4 / 10) - dist);
    println(" inches");
  }

  dist = map(rowPoleLatAngle, 0, PI / 2, 0, circumference / 4 / 10);
  print("Row Pole circ from equater : ");
  print(dist);
  println(" inches");
  print("Row Pole circ from pole : ");
  print((circumference / 4 / 10) - dist);
  println(" inches");
  
  println();
  

  ///////////////////// Instatiate the lamps ////////////////////////
  
  //print("pLamp initial size = ");
  //println(pLamp.size());
  
  int curLampId = 0;
  
  int curRow;    // For 6 row lamp 0 - 5 starting at the South Pole
  
  ///////////////////// Row 1 South /////////////////////
  
  float curAngle = 0.0;
  float angleBetwwenLamps = 2 * PI / numBasesInRow1;
  
  curRow = 2;  // 2nd from bottom
  
  println();
  print("Row ");
  print(curRow);
  print(" circumference : ");
  print(2 * PI * row1Radius / 10);
  println(" inches");
  println();
  
  for(int i = 0; i < numBasesInRow1; i++)
  {
    int curX = int(sin(curAngle) * row1Radius);
    int curZ = int(cos(curAngle) * row1Radius);
    
    pLamp.add(new Lamp(curLampId++,
                               lampBaseRadius,         // Radius of LampBase
                               lampBaseNumSides,       // Number of sides in the base
                               lampBaseHeight,         // height of base edge
                               lampBaseWallThickness,  // thickness of edge wall
                               lampBottleRadius,
                               lampBottleHeight,
                               lampBottleNumSides,
                               curX,                   // position center of lamp
                               int(row1Height),
                               curZ,
                               row1LatAngle,           // latitude in Radians
                               curAngle,               // longitude in Radians
                               curRow,
                               defaultLampHue,         // Hue
                               defaultLampSaturation,  // Sat
                               0));          // brightness: 0-255
    
    print("Lamp ");
    print(curLampId - 1);
    print(" : angle = ");
    println(curAngle);
    print("          row ");
    print(curRow);
    print("  dist from prime meridian : ");
    print(map(curAngle, 0, 2 * PI, 0, 2 * PI * row1Radius / 10));
    println(" inches");
  
    curAngle += angleBetwwenLamps;
  }

  ///////////////////// Row Pole South /////////////////////
  
  curAngle = 0.0;
  angleBetwwenLamps = 2 * PI / numBasesInRowPole;
  
  curRow = 0;  // bottom row
  
  println();
  print("Row ");
  print(curRow);
  print(" circumference : ");
  print(2 * PI * rowPoleRadius / 10);
  println(" inches");
  println();
  
  for(int i = 0; i < numBasesInRowPole; i++)
  {
    int curX = int(sin(curAngle) * rowPoleRadius);
    int curZ = int(cos(curAngle) * rowPoleRadius);
    
    pLamp.add(new Lamp(curLampId++,
                               lampBaseRadius,         // Radius of LampBase
                               lampBaseNumSides,       // Number of sides in the base
                               lampBaseHeight,         // height of base edge
                               lampBaseWallThickness,  // thickness of edge wall
                               lampBottleRadius,
                               lampBottleHeight,
                               lampBottleNumSides,
                               curX,                   // position center of lamp
                               int(rowPoleHeight),
                               curZ,
                               rowPoleLatAngle,        // latitude in Radians
                               curAngle,               // longitude in Radians
                               curRow,
                               defaultLampHue,         // Hue
                               defaultLampSaturation,  // Sat
                               0));          // brightness: 0-255
    
    print("Lamp ");
    print(curLampId - 1);
    print(" : angle = ");
    println(curAngle);
    print("          row ");
    print(curRow);
    print("  dist from prime meridian : ");
    print(map(curAngle, 0, 2 * PI, 0, 2 * PI * rowPoleRadius / 10));
    println(" inches");
  
    curAngle += angleBetwwenLamps;
  }

  ////////////////////////// row 2 South //////////////////////////
  if(numRows >= 3)    // if 3 or more rows, instantiate no. 2
  {
    curAngle = 0.0;
    angleBetwwenLamps = 2 * PI / numBasesInRow2;
    
    curRow = 1;  // one up from bottom
  
    println();
    print("Row ");
    print(curRow);
    print(" circumference : ");
    print(2 * PI * row2Radius / 10);
    println(" inches");
    println();
  
    for(int i = 0; i < numBasesInRow2; i++)
    {
      int curX = int(sin(curAngle) * row2Radius);
      int curZ = int(cos(curAngle) * row2Radius);
      
      pLamp.add(new Lamp(curLampId++,
                                 lampBaseRadius,         // Radius of LampBase
                                 lampBaseNumSides,       // Number of sides in the base
                                 lampBaseHeight,         // height of base edge
                                 lampBaseWallThickness,  // thickness of edge wall
                                 lampBottleRadius,
                                 lampBottleHeight,
                                 lampBottleNumSides,
                                 curX,                   // position center of lamp
                                 int(row2Height),
                                 curZ,
                                 row2LatAngle,           // latitude in Radians
                                 curAngle,               // longitude in Radians
                                 curRow,
                                 defaultLampHue,         // Hue
                                 defaultLampSaturation,  // Sat
                                 0));         // brightness: 0-255
      
      print("Lamp ");
      print(curLampId - 1);
      print(" : angle = ");
      println(curAngle);
      print("          row ");
      print(curRow);
      print("  dist from prime meridian : ");
      print(map(curAngle, 0, 2 * PI, 0, 2 * PI * row2Radius / 10));
      println(" inches");
    
      curAngle += angleBetwwenLamps;
    }
  }
   ///////////////////// Row 1 North /////////////////////
  
  angleBetwwenLamps = 2 * PI / numBasesInRow1;
  curAngle = 0.0 + (angleBetwwenLamps / 2);
  
  curRow = 3;  // 3rd from bottom

  println();
  print("Row ");
  print(curRow);
  print(" circumference : ");
  print(2 * PI * row1Radius / 10);
  println(" inches");
  println();
  
  for(int i = 0; i < numBasesInRow1; i++)
  {
    int curX = int(sin(curAngle) * row1Radius);
    int curZ = int(cos(curAngle) * row1Radius);
    
    pLamp.add(new Lamp(curLampId++,
                               lampBaseRadius,         // Radius of LampBase
                               lampBaseNumSides,       // Number of sides in the base
                               lampBaseHeight,         // height of base edge
                               lampBaseWallThickness,  // thickness of edge wall
                               lampBottleRadius,
                               lampBottleHeight,
                               lampBottleNumSides,
                               curX,                   // position center of lamp
                               - int(row1Height),
                               curZ,
                               - row1LatAngle,         // latitude in Radians
                               curAngle,               // longitude in Radians
                               curRow,
                               defaultLampHue,         // Hue
                               defaultLampSaturation,  // Sat
                               0));          // brightness: 0-255
    
    print("Lamp ");
    print(curLampId - 1);
    print(" : angle = ");
    println(curAngle);
    print("          row ");
    print(curRow);
    print("  dist from prime meridian : ");
    print(map(curAngle, 0, 2 * PI, 0, 2 * PI * row1Radius / 10));
    println(" inches");
  
    curAngle += angleBetwwenLamps;
  }

  ///////////////////// Row Pole North /////////////////////
  
  curAngle = 0.0;
  angleBetwwenLamps = 2 * PI / numBasesInRowPole;
  
  curRow = 5;  // top row of 6
  
  println();
  print("Row ");
  print(curRow);
  print(" circumference : ");
  print(2 * PI * rowPoleRadius / 10);
  println(" inches");
  println();
  
  for(int i = 0; i < numBasesInRowPole; i++)
  {
    int curX = int(sin(curAngle) * rowPoleRadius);
    int curZ = int(cos(curAngle) * rowPoleRadius);
    
    pLamp.add(new Lamp(curLampId++,
                               lampBaseRadius,         // Radius of LampBase
                               lampBaseNumSides,       // Number of sides in the base
                               lampBaseHeight,         // height of base edge
                               lampBaseWallThickness,  // thickness of edge wall
                               lampBottleRadius,
                               lampBottleHeight,
                               lampBottleNumSides,
                               curX,                   // position center of lamp
                               - int(rowPoleHeight),
                               curZ,
                               - rowPoleLatAngle,      // latitude in Radians
                               curAngle,               // longitude in Radians
                               curRow,
                               defaultLampHue,         // Hue
                               defaultLampSaturation,  // Sat
                               0));          // brightness: 0-255
    
    print("Lamp ");
    print(curLampId - 1);
    print(" : angle = ");
    println(curAngle);
    print("          row ");
    print(curRow);
    print("  dist from prime meridian : ");
    print(map(curAngle, 0, 2 * PI, 0, 2 * PI * rowPoleRadius / 10));
    println(" inches");
  
    curAngle += angleBetwwenLamps;
  }

  ////////////////////////// row 2 North //////////////////////////
  if(numRows >= 3)    // if 3 or more rows, instantiate no. 2
  {
    curAngle = 0.0;
    angleBetwwenLamps = 2 * PI / numBasesInRow2;
    
    curRow = 4;  // 4th from bottom
    
    println();
    print("Row ");
    print(curRow);
    print(" circumference : ");
    print(2 * PI * row2Radius / 10);
    println(" inches");
    println();
  
    for(int i = 0; i < numBasesInRow2; i++)
    {
      int curX = int(sin(curAngle) * row2Radius);
      int curZ = int(cos(curAngle) * row2Radius);
      
      pLamp.add(new Lamp(curLampId++,
                                 lampBaseRadius,         // Radius of LampBase
                                 lampBaseNumSides,       // Number of sides in the base
                                 lampBaseHeight,         // height of base edge
                                 lampBaseWallThickness,  // thickness of edge wall
                                 lampBottleRadius,
                                 lampBottleHeight,
                                 lampBottleNumSides,
                                 curX,                   // position center of lamp
                                 - int(row2Height),
                                 curZ,
                                 - row2LatAngle,         // latitude in Radians
                                 curAngle,               // longitude in Radians
                                 curRow,
                                 defaultLampHue,         // Hue
                                 defaultLampSaturation,  // Sat
                                 0));         // brightness: 0-255
      
      print("Lamp ");
      print(curLampId - 1);
      print(" : angle = ");
      println(curAngle);
      print("          row ");
      print(curRow);
      print("  dist from prime meridian : ");
      print(map(curAngle, 0, 2 * PI, 0, 2 * PI * row2Radius / 10));
      println(" inches");
    
      curAngle += angleBetwwenLamps;
    }
  }
  
  println();
  print("pLamp post-instantiatation size = ");
  println(pLamp.size());
  
  //////////////////// Instantiate Animations /////////////////
  
  pRowAnimation = new RowAnimation(pLamp, "RowAnimation1", numRows * 2, int(1 * frameRate));  // 2 second change interval
  pAnimations.add(pRowAnimation);
  
  pLongWaveAnimation = new LongWaveAnimation(pLamp, "LongWaveAnimation1", 0, PI / 4, int(10 * frameRate));
  pAnimations.add(pLongWaveAnimation);
 
  pLongWaveAnimation2 = new LongWaveAnimation2(pLamp, "LongWaveAnimation2", 0, PI / 4, int(10 * frameRate));
  pAnimations.add(pLongWaveAnimation2);
  
  pFileAnimation1 = new FileAnimation(pLamp, "FileAnimation1", "LongWave.dat");
  pAnimations.add(pFileAnimation1);
 
  //////////////////// List all animations ////////////////////
  
  println();
  println("Animations loaded:");
  
  for(int i = 0; i < pAnimations.size(); i++)
  {
    LampAnimation animation = pAnimations.get(i);
    println(animation.getName());
  }
  println();
  
  // Create file data output for (some) animations
  // pLongWaveAnimation.saveToFile("LongWave.dat", pLongWaveAnimation.numMinFramesForAnimation());
  
  //framesToSave = pLongWaveAnimation.numMinFramesForAnimation(); // Do this to save frames for a movie.
  
  //curAnimation = pAnimations.get(0);
  curAnimation = pLongWaveAnimation2;
  //curAnimation = pLongWaveAnimation;
  //curAnimation = pFileAnimation1;
  
  print("Current Animation is ");
  println(curAnimation.getName());
  println();
  
  curAnimation.begin(); 
}

//<<<<<<<<<<<<<<<<<<<<<<<< draw() >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

void draw()
{
  lights();
  background(0);
  
  // Update frame for the current animation
  curAnimation.nextFrame();
  
  //curIntensity = (frameCount >> 1) & 0xFF;

///////// set brightness for the lamps in the array HERE!!! /////////////////

  // change height of camera with mouseY
  //camera(mouseX, mouseY, 270.0,  // eyeX, eyeY, eyeZ
  camera(mouseX, mouseY, 500.0,  // eyeX, eyeY, eyeZ
         centerX, centerY, centerZ,        // centerX, centerY, centerZ
         0.0, 0.1, 0.0);       // upX, upY, upZ
  drawScene();
  
  // if we're saving frames for a movie, save one here
  if(framesToSave-- > 0)
  {
    saveFrame("frames/####.tif");
  }
}

void drawScene()
{ 
  translate(centerX, centerY, centerZ);
  
  noStroke();
  fill(defaultFill);
  
  sphere(radius);    // draw the sphere

  //////////////// Draw All caps //////////////////
  for(int capIdx = 0; capIdx < pLamp.size(); capIdx++)
  {
    pLamp.get(capIdx).display();
  }

}

void drawRowLines()
{
  // Draw first row
  stroke(128);
  pushMatrix();
  translate(0, row1Height, 0);
  rotateX(radians(90));
  ellipse(0.0, 0.0, row1Radius * 2, row1Radius * 2);
  popMatrix();
  noStroke();
  
  // Draw first row other side of equater
  stroke(0);
  pushMatrix();
  translate(0, -row1Height, 0);
  rotateX(radians(90));
  ellipse(0.0, 0.0, row1Radius * 2, row1Radius * 2);
  popMatrix();
  noStroke();
  
  // Draw pole row
  stroke(0);
  pushMatrix();
  translate(0, rowPoleHeight, 0);
  rotateX(radians(90));
  ellipse(0.0, 0.0, rowPoleRadius * 2, rowPoleRadius * 2);
  popMatrix();
  noStroke();
  
  // Draw other pole row
  stroke(0);
  pushMatrix();
  translate(0, -rowPoleHeight, 0);
  rotateX(radians(90));
  ellipse(0.0, 0.0, rowPoleRadius * 2, rowPoleRadius * 2);
  popMatrix();
  noStroke();
  
  if(numRows >= 3)
  {
    // Draw row 2
    stroke(0);
    pushMatrix();
    translate(0, row2Height, 0);
    rotateX(radians(90));
    ellipse(0.0, 0.0, row2Radius * 2, row2Radius * 2);
    popMatrix();
    noStroke();
    
    // Draw other row 2
    stroke(0);
    pushMatrix();
    translate(0, -row2Height, 0);
    rotateX(radians(90));
    ellipse(0.0, 0.0, row2Radius * 2, row2Radius * 2);
    popMatrix();
    noStroke();
  } 
}
// import java.util.Iterator;  // if needed


class FileAnimation extends LampAnimation
{
  String mFilename;
  byte[] mData;
  int    mIdx;
    
  FileAnimation(ArrayList<Lamp> pLamp,
                String pName,
                String filename)
  {
    super(pLamp, pName);
    mFilename = filename;
    mData = loadBytes(mFilename);
    
    println();
    if(mData == null)
    {
      print("FileAnimation file ");
      print(mFilename);
      println(" does not exist. Exiting.");
      exit();
    }
    else
    {
      print("FileAnimation file ");
      print(mFilename);
      print(" read : ");
      print(mData.length);
      println(" bytes.");
    }
    if(mData.length % pLamp.size() != 0)
    {
      println("Filedata size incorrect. Exiting.");
      exit();
    }
    
    mIdx = 0;

  }
  
  void begin()
  {
    mIdx = 0;
    setBrightness();
    super.begin();
  }
  
  void start()
  {
    super.start();
  }
  
  void stop()
  {
    super.stop();
  }
  
  void nextFrame()
  {
    super.nextFrame();
    
    if(mIsRunning)
    {
      advancePattern();
      setBrightness();
    } 
  }
  
  int numMinFramesForAnimation()
  {
    return mData.length;
  }
  
  void nextFrame(byte[] data, int idx)
  {
    super.nextFrame(data, idx);
    
    advancePattern();
    setBrightness(data, idx);
  }
  
  void setBrightness()
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
      curLamp.setBrightness(getLampBrightness(curLamp));
    }
  }
  
  void setBrightness(byte[] data, int idx)
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
      int lampBrightness = getLampBrightness(curLamp);
      data[idx++] = byte(lampBrightness);
      curLamp.setBrightness(lampBrightness);
    }
  }
  
  /////////////// private methods //////////////////////
  
  void advancePattern()
  {
    if(mIdx == mData.length)
    {
      mIdx = 0;
    }
  }
  
  int getLampBrightness(Lamp curLamp)
  {
    return(int(mData[mIdx++]) & 0xff);   // remember to clear sign extension
  }
  
}
// import java.util.Iterator;  // if needed


class LongWaveAnimation extends LampAnimation
{
  float mCurWavePeakAngle;
  float mAngleFromPeak;
  int mFramesPerCycle;
    
  LongWaveAnimation(ArrayList<Lamp> pLamp,
                    String pName,
                    float startWavePeakAngle,
                    float angleFromPeak,
                    int framesPerCycle)
  {
    super(pLamp, pName);
    mCurWavePeakAngle = startWavePeakAngle;
    mAngleFromPeak = angleFromPeak;
    mFramesPerCycle = framesPerCycle;
  }
  
  void begin()
  {
    setBrightness();
    super.begin();
  }
  
  void start()
  {
    super.start();
  }
  
  void stop()
  {
    super.stop();
  }
  
  void nextFrame()
  {
    super.nextFrame();
    
    if(mIsRunning)
    {
      advancePattern();
      setBrightness();
    } 
  }
  
  int numMinFramesForAnimation()
  {
    return mFramesPerCycle;
  }
  
  void nextFrame(byte[] data, int idx)
  {
    super.nextFrame(data, idx);
    
    advancePattern();
    setBrightness(data, idx);
  }
  
  void setBrightness()
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
      curLamp.setBrightness(getLampBrightness(curLamp));
    }
  }
  
  void setBrightness(byte[] data, int idx)
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
      int lampBrightness = getLampBrightness(curLamp);
      print("LongwaveAnimation::lampBrightness = ");
      print(lampBrightness);
      if(lampBrightness < 0)
      {
        lampBrightness = 0;
      }
      else if(lampBrightness > 255)
      {
        lampBrightness = 255;
      }

      byte curByte = byte(lampBrightness);
      print(" : ");
      println(curByte);
      data[idx++] = curByte;
      curLamp.setBrightness(lampBrightness);
    }
  }
  
  /////////////// private methods //////////////////////
  
  void advancePattern()
  {
    mCurWavePeakAngle += map(1, 0, mFramesPerCycle, 0, 2 * PI);  // rotate the peak angle by 1 frame's angle
    if(mCurWavePeakAngle >= 2 * PI)
    {
      mCurWavePeakAngle -= 2 * PI;
    }
  }
  
  int getLampBrightness(Lamp curLamp)
  {
    float angDistFromPeak = mCurWavePeakAngle - curLamp.getLon();  // Angular distance from peak
    if(abs(angDistFromPeak) < PI)
    {
      angDistFromPeak = abs(angDistFromPeak);
    }
    else
    {
      angDistFromPeak = abs((2 * PI) - angDistFromPeak);
    }
    return(int(map(angDistFromPeak, 0, mAngleFromPeak, 255, 0)));
  }
  
}
// import java.util.Iterator;  // if needed


class LongWaveAnimation2 extends LampAnimation
{
  float mCurWavePeakAngle;
  float mAngleFromPeak;
  int mFramesPerCycle;
  
  float mCurWavePeakAngle2;
  float mAngleFromPeak2;
  int mFramesPerCycle2;
  
  boolean mAscending;
    
  LongWaveAnimation2(ArrayList<Lamp> pLamp,
                     String pName,
                     float startWavePeakAngle,
                     float angleFromPeak,
                     int framesPerCycle)
  {
    super(pLamp, pName);
    mCurWavePeakAngle = startWavePeakAngle;
    mAngleFromPeak = angleFromPeak;
    mFramesPerCycle = framesPerCycle;
    mCurWavePeakAngle2 = 0;
    mAngleFromPeak2 = angleFromPeak;
    mFramesPerCycle2 = framesPerCycle * 2;
    mAscending = true;
  }
  
  void begin()
  {
    setBrightness();
    super.begin();
  }
  
  void start()
  {
    super.start();
  }
  
  void stop()
  {
    super.stop();
  }
  
  int numMinFramesForAnimation()
  {
    return mFramesPerCycle;
  }
  
  void nextFrame()
  {
    super.nextFrame();
    
    if(mIsRunning)
    {
      mCurWavePeakAngle += map(1, 0, mFramesPerCycle, 0, 2 * PI);  // rotate the peak angle by 1 frame's angle
      if(mCurWavePeakAngle >= 2 * PI)
      {
        mCurWavePeakAngle -= 2 * PI;
      }
      
      if(mAscending)
      {
        mCurWavePeakAngle2 += map(1, 0, mFramesPerCycle2 / 4, 0, PI / 2);  // rotate the peak angle by 1 frame's angle
        if(mCurWavePeakAngle2 >= PI / 2)
        {
          mCurWavePeakAngle2 = PI / 2;
          mAscending = false;
        }
      }
      else  //descending
      {
        mCurWavePeakAngle2 -= map(1, 0, mFramesPerCycle2 / 4, 0, PI / 2);  // rotate the peak angle by 1 frame's angle
        if(mCurWavePeakAngle2 < 0)
        {
          mCurWavePeakAngle2 = 0;
          mAscending = true;
        }
      }
      
      setBrightness();
    } 
  }
  
  void setBrightness()
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
      
      float angDistFromPeak = mCurWavePeakAngle - curLamp.getLon();  // Angular distance from peak (Lon)
      float angDistFromPeak2 = mCurWavePeakAngle2 - abs(curLamp.getLat());  // Angular distance from peak (Lat)
      if(abs(angDistFromPeak) < PI)
      {
        angDistFromPeak = abs(angDistFromPeak);
      }
      else
      {
        angDistFromPeak = abs((2 * PI) - angDistFromPeak);
      }
      if(abs(angDistFromPeak2) < PI)
      {
        angDistFromPeak2 = abs(angDistFromPeak2);
      }
      else
      {
        angDistFromPeak2 = abs((2 * PI) - angDistFromPeak2);
      }
      //int bright1 = int(map(angDistFromPeak, 0, mAngleFromPeak, 0, 255));
      int bright1 = 0;
      int bright2 = int(map(angDistFromPeak2, 0, mAngleFromPeak2, 0, 255));
      
      
      curLamp.setBrightness(255 - (int(constrain(bright2 > bright1 ?  bright2 - bright1 : bright1 - bright2, 0, 255))));
    }
  }
  
}
// import java.util.Iterator;  // if needed


class ParticleAnimation extends LampAnimation
{
  float mCurLat;
  float mCurLon;
  float mAngleFromCenter;
  float mLatFrameDiff;
  float mLonFrameDiff;
  int mFramesPerCycle;
    
  ParticleAnimation(ArrayList<Lamp> pLamp,
                    String pName,
                    float angleFromCenter,
                    float latFrameDiff,
                    float lonFrameDiff,
                    int framesPerCycle)
  {
    super(pLamp, pName);
    mAngleFromCenter = angleFromCenter;
    mLatFrameDiff = latFrameDiff;
    mLonFrameDiff = lonFrameDiff;
    mFramesPerCycle = framesPerCycle;
  }
  
  void begin()
  {
    setBrightness();
    super.begin();
  }
  
  void start()
  {
    super.start();
  }
  
  void stop()
  {
    super.stop();
  }
  
  int numMinFramesForAnimation()
  {
    return mFramesPerCycle;
  }
  
  void nextFrame()
  {
    super.nextFrame();
    
    if(mIsRunning)
    {
/*      mCurWavePeakAngle += map(1, 0, mFramesPerCycle, 0, 2 * PI);  // rotate the peak angle by 1 frame's angle
      if(mCurWavePeakAngle >= 2 * PI)
      {
        mCurWavePeakAngle -= 2 * PI;
      } */
      setBrightness();
    } 
  }
  
  void setBrightness()
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
 /*     
      float angDistFromPeak = mCurWavePeakAngle - curLamp.getLon();  // Angular distance from peak
      if(abs(angDistFromPeak) < PI)
      {
        angDistFromPeak = abs(angDistFromPeak);
      }
      else
      {
        angDistFromPeak = abs((2 * PI) - angDistFromPeak);
      }
      
      curLamp.setBrightness(int(map(angDistFromPeak, 0, mAngleFromPeak, 255, 0))); */
    }
  }
  
}
// import java.util.Iterator;  // if needed


class RowAnimation extends LampAnimation
{
  int mNumRows;
  //ArrayList<Lamp> pLamp = new ArrayList<Lamp>();
  int mFramesPerCycle;
  
  int mCurRow;
  
  RowAnimation(ArrayList<Lamp> pLamp, String pName, int nRows, int framesPerCycle)
  {
    super(pLamp, pName);
    mNumRows = nRows;
    mFramesPerCycle = framesPerCycle;
    mCurRow = 0;
  }
  
  void begin()
  {
    setBrightness();
    super.begin();
  }
  
  void start()
  {
    super.start();
    //mIsRunning = true;
  }
  
  void stop()
  {
    super.stop();
   // mIsRunning = false;
  }
  
  int numMinFramesForAnimation()
  {
    return mFramesPerCycle;
  }
  
  void nextFrame()
  {
    super.nextFrame();
    
    if(mIsRunning)
    {
      if(mCurFrame % mFramesPerCycle == 0)   // time for a change?
      {
        mCurRow = ++mCurRow % mNumRows; // advance the row
        setBrightness();
      }
    } 
  }
  
  void setBrightness()
  {
    for(int i = 0; i < pLamp.size(); i++)   // Iter thru all Lamps
    {
      Lamp curLamp = pLamp.get(i);
      
      if(curLamp.getRow() == mCurRow)
      {
        curLamp.setBrightness(255);    // Set Lamp ON for the current row
      }
      else
      {
        curLamp.setBrightness(0);    // Set Lamp OFF if not the current row
      }
    }
  }
  
}
// class describing a lamp

class Lamp
{
  int mId;                 // unique identifyier
  
  int mBaseRadius;         // Radius of LampBase
  int mBaseNumSides;       // Number of sides in the base
  int mBaseHeight;         // height of base edge
  int mBaseWallThickness;  // thickness of edge wall
  
  int mLampRadius;
  int mLampHeight;
  int mLampNumSides;

  int mPosX;  // position center of lamp
  int mPosY;
  int mPosZ;
  
  float mLat;  // latitude in Radians
  float mLon;  // latitude in Radians
  
  int mRow;         // row number of common latitude lamps
  int mHue;         // 0-255
  int mSaturation;  // 0-255
  int mBrightness;  // 0-255

  int mDefaultFill = 255;
  int[] mOffFill = {0, 0, 0};     // HSB max = 255
  int[] mOnFill = {255, 255, 175};
  
  
  // ctor
  Lamp(int   id,                 // unique identifier
       int   baseRadius,         // Radius of LampBase
       int   baseNumSides,       // Number of sides in the base
       int   baseHeight,         // height of base edge
       int   baseWallThickness,  // thickness of edge wall
       int   lampRadius,
       int   lampHeight,
       int   lampNumSides,
       int   posX,              // position center of lamp
       int   posY,
       int   posZ,
       float lat,               // latitude in Radians
       float lon,               // longitude in Radians
       int   row,               // row number of common latitude lamps
       int   hue,               // 0-255
       int   saturation,        // 0-255
       int   brightness)        // 0-255
  {
    mId = id;
    mBaseRadius = baseRadius;
    mBaseNumSides = baseNumSides;
    mBaseHeight = baseHeight;
    mBaseWallThickness = baseWallThickness;
    mLampRadius = lampRadius;
    mLampHeight = lampHeight;
    mLampNumSides = lampNumSides;
    mPosX = posX;
    mPosY = posY;
    mPosZ = posZ;
    mLat = lat;
    mLon = lon;
    mRow = row;
    mHue = hue;
    mSaturation = saturation;
    mBrightness = brightness;
  }
  
  void setBrightness(int brightness)
  {
    mBrightness = brightness;
  }
  
  int getRow()
  {
    return mRow;
  }
  
  float getLat()
  {
    return mLat;
  }
  
  float getLon()
  {
    return mLon;
  }
  
  void display()
  {
    // orient for display
    pushMatrix();
    translate(mPosX, mPosY, mPosZ);
    rotateY(mLon);
    rotateX(-mLat);  // good

    // draw outer edge
    float angle = 0;
    float angleIncrement = TWO_PI / mBaseNumSides;
    beginShape(QUAD_STRIP);
    for(int i = 0; i < mBaseNumSides + 1; ++i)
    {
      vertex(mBaseRadius * cos(angle), mBaseRadius * sin(angle), 0);
      vertex(mBaseRadius * cos(angle), mBaseRadius * sin(angle), mBaseHeight);
      angle += angleIncrement;
    }
    endShape();
    
    // draw outer inner edge
    angle = 0;
    angleIncrement = TWO_PI / mBaseNumSides;
    beginShape(QUAD_STRIP);
    for(int i = 0; i < mBaseNumSides + 1; ++i)
    {
      vertex((mBaseRadius - mBaseWallThickness) * cos(angle), (mBaseRadius - mBaseWallThickness) * sin(angle), 0 + mBaseWallThickness);
      vertex((mBaseRadius - mBaseWallThickness) * cos(angle), (mBaseRadius - mBaseWallThickness) * sin(angle), mBaseHeight);
      angle += angleIncrement;
    }
    endShape();
    
    // draw bottom
    angle = 0;
    beginShape(TRIANGLE_FAN);
    //vertex(0, 0, mBaseHeight);
    vertex(0, 0, 0);
    for(int i = 0; i < mBaseNumSides + 1; ++i)
    {
      vertex(mBaseRadius * cos(angle), mBaseRadius * sin(angle), 0);
      angle += angleIncrement;
    }
    endShape();
    
    // draw top of bottom
    angle = 0;
    beginShape(TRIANGLE_FAN);
    //vertex(0, 0, mBaseHeight);
    vertex(0, 0, mBaseWallThickness);
    for(int i = 0; i < mBaseNumSides + 1; ++i)
    {
      vertex(mBaseRadius * cos(angle), mBaseRadius * sin(angle), mBaseWallThickness);
      angle += angleIncrement;
    }
    endShape();
    
    // draw lamp portion
    fill(mHue, mSaturation, mBrightness);
    
    // draw lamp outer edge
    angle = 0;
    angleIncrement = TWO_PI / mLampNumSides;
    beginShape(QUAD_STRIP);
    for(int i = 0; i < mLampNumSides + 1; ++i)
    {
      vertex((mLampRadius) * cos(angle), (mLampRadius) * sin(angle), 0 + mBaseWallThickness);
      vertex((mLampRadius) * cos(angle), (mLampRadius) * sin(angle), mLampHeight + mBaseWallThickness);
      angle += angleIncrement;
    }
    endShape();
  
    // draw top of lamp
    angle = 0;
    beginShape(TRIANGLE_FAN);
    //vertex(0, 0, sideHeight);
    vertex(0, 0, mLampHeight + mBaseWallThickness);
    for(int i = 0; i < mLampNumSides + 1; ++i)
    {
      vertex(mLampRadius * cos(angle), mLampRadius * sin(angle), mLampHeight + mBaseWallThickness);
      angle += angleIncrement;
    }
    endShape();
    
    popMatrix();
    
    fill(mDefaultFill);
  }
  
}
class LampAnimation
{
  ArrayList<Lamp> mpLamp;
  String mpName;
  long mCurFrame;
  boolean mIsRunning;
  
  LampAnimation(ArrayList<Lamp> pLamp, String pName)
  {
    mpLamp = pLamp;
    mpName = pName;
    mCurFrame = 0;
    mIsRunning = false;
  }
  
  void begin()
  {
    mCurFrame = 0;
    mIsRunning = true;
  }
  
  void start()
  {
    mIsRunning = true;
  }
  
  void stop()
  {
    mIsRunning = false;
  }
  
  String getName()
  {
    return mpName;
  }
  
  long getCurFrameCnt()
  {
    return mCurFrame;
  }
  
  void nextFrame()
  {
    mCurFrame++;
  }
  
  void nextFrame(byte[] data, int idx)
  {
    mCurFrame++;
  }
  
  int numMinFramesForAnimation()
  {
    return 0;
  }

  
  void saveToFile(String filename, int numFrames)
  {
    int bytesPerFrame = mpLamp.size();
    int idx = 0;
    byte[] data = new byte[numFrames * bytesPerFrame];
    
    while(numFrames-- > 0)
    {
      nextFrame(data, idx);
      idx += bytesPerFrame;
    }
    
    print("Byte dump for animation ");
    print(filename);
    println(" :");
    println();
    for(int i = 0; i < data.length; i++)
    {
      print(hex(data[i]));
      if((i + 1) % 32 == 0)
      {
        println();
      }
      else
      {
        print(" ");
      }
    }
    println();
    println();
    
    saveBytes(filename, data);
  }
    
}
  
  




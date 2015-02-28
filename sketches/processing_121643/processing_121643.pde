
/*
author: mpinner
 date: 2013-03-02
 
 intent: simulate rgb led balls for testing sequeces
 
 usage: 
 - x, y, and z keys will enable/dissable the rotations along these axises
 
 */



int SCALE = 10;
int colorMax; // need init in setup()


boolean rotX = false;
boolean rotY = false;
boolean rotXY = true;
boolean rotZ = true;

boolean nuts = true;
boolean frames = false;
boolean redOn = true;
boolean greenOn = true;
boolean blueOn = true;

boolean serialReading = false;

int audio = 0;

int x = 0;
int y = 0;
int z = 0;

int xRead, yRead, zRead;

float xRot = 0;
float yRot = 0;
float zRot = 0;

int rotSampleSize = 5;
int currentRotSample = 0;
float sample[][] = new float[3][rotSampleSize];
float rotAngle[] = {
  0.0, 0.0, 0.0
};



int ZERO_ACCELL = 512;
int ERROR = 100;
int[][] accellerationColors;

long lastReading = 0;
int ACCELL_THRESHOLD = 1;


int min = 290;
int max = 890;


static final int nPoints = 12;                   // # polyhedron vertices
PVector          pt[]    = new PVector[nPoints]; // 3D vertex coordinates
int ledCount = 0;


void setup() {

frameRate(120);
  colorMax = ledCount;

  accellerationColors= new int[3][ledCount];

  for (int i=0; i < ledCount; i++) {
    accellerationColors[0][i] = 150;  
    accellerationColors[1][i] = 150;  
    accellerationColors[2][i] = 150;
  }

  colorMode(RGB, 256);

  int   i;
  float c, r, h, angle, a;

  size(800, 800, P3D);
  sphereDetail(6);
}

void draw() {
  int i, j, k;

  background(0);
  ball(1);

  return;
}

void ball(int shift) {

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  rotateX(radians(90));
 
 
 // rotateX(radians(mouseY/(float)height*360));
 
 
  rotateY(radians((float)mouseX/width*360));

  pushMatrix();
  rotateX(radians(90));
  //rotateZ(90);
  noStroke();

  int ledcount = 240;
  int ledZStepSize = 3;
  int ledSize = 4;

  int staffRadius = 5;

  int staffBrightness = 32;
  int staffLength = ledcount;

  fill(staffBrightness, staffBrightness, staffBrightness);

  cylinder(staffRadius-1, ledZStepSize*ledcount, 12);

  popMatrix();


  for (int i = 0 ; i < ledcount; i++) {
    pushMatrix();

    int radius = 5;
    translate(
    (float)(radius*Math.cos(i)), 
    (float)(radius*Math.sin(i)), 
    (float)ledZStepSize*(i-ledcount/2));

int ledOffBrightness = 32;
    fill(ledOffBrightness, ledOffBrightness, ledOffBrightness);

    fill(1, frameCount, i, ledcount);
    noStroke();

    sphere(ledSize);   // so set 'scale' small & draw a big one.
    popMatrix();
  }

  popMatrix();

  return;
}



// Slightly different, this makes the rainbow equally distributed throughout
void fill(int wait, long millis, int index, int maxIndex) {

  
  

  long slice = (millis / wait) % maxIndex; 

  if (slice == index) {
    //blue
    fill(0, 0, 255);
  }

  if (maxIndex - slice == index) {
    //white 
    fill(255, 255, 255);
  }

  if ((maxIndex + maxIndex/2 + slice) % maxIndex == index) {

    // light blue
    fill(0, 255, 255);
  }

  if ((maxIndex + maxIndex/2 - slice) % maxIndex == index) {

    // pink
    fill(255, 0, 255);
  }
}

void fillFromAccell(int index) {
  fill( accellerationColors[0][index], accellerationColors[1][index], accellerationColors[2][index]);
}

void fillFromIndex(int index) {


  fill(255, 255, 255);
  //  fill(index, colorMax, colorMax);

  return;
}

void keyTyped() {
  if (key == 'x') {
    rotX = (false == rotX);
  }

  if (key == 'y') {
    rotY = (false == rotY);
  }

  if (key == 'q') {
    rotXY = (false == rotXY);
  }

  if (key == 'z') {
    rotZ = (false == rotZ);
  }  

  if (key == 'n') {
    nuts = (false == nuts);
  }

  if (key == 'f') {
    frames = (false == frames);
  }


  if (key == 'r') {
    redOn = (false == redOn);
  }

  if (key == 'g') {
    greenOn = (false == greenOn);
  }

  if (key == 'b') {
    blueOn = (false == blueOn);
  }

  if (key == '+') {
    audio += 1;
    println("audio:"+audio);
  } 
  if (key == '-') {
    audio -= 1;
    println("audio:"+audio);
  }

  if (key == 's') {
    serialReading = (false == serialReading);
    readingValue();
  }
}



void readingValue()
{


  int xAng = (int)map(x, min, max, -90, 90);
  int yAng = (int)map(y, min, max, -90, 90);
  int zAng = (int)map(z, min, max, -90, 90);

  xRot = RAD_TO_DEG * (atan2(-yAng, -zAng) + PI);
  yRot = RAD_TO_DEG * (atan2(-xAng, -zAng) + PI);
  zRot = RAD_TO_DEG * (atan2(-yAng, -xAng) + PI);

  sample[0][currentRotSample] = xRot;
  sample[1][currentRotSample] = yRot;
  sample[2][currentRotSample] = zRot;
  currentRotSample++;

  if (currentRotSample == rotSampleSize) {
    currentRotSample = 0;
    for ( int i = 0; i < 3; i++) {
      sample[i] = sort(sample[i]);
      rotAngle[i] = sample[i][rotSampleSize/2];
      println("i:"+i+",rot:"+rotAngle[i]);
    }
  }


  if (lastReading + ACCELL_THRESHOLD < millis()) {
    lastReading = millis();  
    int xColor = convertAccellRead(x);
    int yColor = convertAccellRead(y);
    int zColor = convertAccellRead(z);

    // add to array
    for (int i = ledCount-1; i > 0; i--) {
      for (int j=0; j<3; j++) {
        accellerationColors[j][i] = accellerationColors[j][i-1];
      }
    }
    accellerationColors[0][0] = xColor;
    accellerationColors[1][0] = yColor;
    accellerationColors[2][0] = zColor;
  }

  println("x:"+x+",y:"+y+",z:"+z);
  println("x:"+xRot+",y:"+yRot+",z:"+zRot+",min:"+min+",max:"+max);
}


int getSerialValue(String readingParam, String valueAccumulator) {
  println(readingParam +":" + valueAccumulator);
  if (null == valueAccumulator)
    return -1;

  valueAccumulator.trim();
  valueAccumulator = valueAccumulator.trim() + ",";

  //  if (readingParam.equals("z")) println("ZZZ:" + valueAccumulator);

  if (valueAccumulator.contains(readingParam)) {
    valueAccumulator = valueAccumulator.substring(valueAccumulator.indexOf(readingParam));

    int commaIndex = valueAccumulator.indexOf(",");
    if (commaIndex > 0) {
      valueAccumulator  = valueAccumulator.substring(2, commaIndex);  
      try {
        int readingValue = Integer.parseInt(valueAccumulator);
        //   println(readingParam +":"+ readingValue);

        /*
    if (min>readingValue) {
         min = readingValue;
         }
         
         if (max<readingValue) {
         max = readingValue;
         }
         */
        return readingValue;
      } 
      catch (Exception e) {
        // dont care
      }
    }
  } 
  return 0;
}

int convertAccellRead(int reading) {

  reading = reading - ZERO_ACCELL;
  if (reading < 0) {
    reading = reading * -1;
  } 

  reading = reading - ERROR;

  if (reading < 0) {
    reading = 0;
  } 

  return reading;
}


void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];

  //get the x and z position on a circle for all the sides
  for (int i=0; i < x.length; i++) {
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }

  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0, -h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
  }

  endShape();

  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }

  endShape();

  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 

  vertex(0, h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], h/2, z[i]);
  }

  endShape();
}




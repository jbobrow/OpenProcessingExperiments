
// Credit to Golan Levin for time boilerplate and Daniel Shiffman for Sine Wave Example

int prevSecond; 
int lastRolloverTime; 
int mils;

int h;
int m;
int s;

Wave secondsWave;
ArrayList<Wave> minutesWaves;
ArrayList<Wave> hoursWaves;
float baseWaveHeight;

void setup() {
  size(640, 360);
  baseWaveHeight = height/8;
  
  stroke(120);
  setupGlobalTimes();
  
  // initialize objects
  hoursWaves = createHoursWaves();
  minutesWaves = createMinutesWaves();
  secondsWave = createSecondsWave();
  
  lastRolloverTime = 0; 
}
 
void draw() {
  background(255); 
 
  setMils();
  setupGlobalTimes();
  // uncommen the line below to draw time as text for debugging
  // drawTime();
  
  pushMatrix();
  // int hShift = mils();
  translate(0, height/2); // work relative to horizontal venter at middle
  
  float periodInSeconds = 60.0; 
  float periodInMilliseconds = periodInSeconds * 1000.0; 
  float timeBasedSinusoidallyVaryingQuantity = sin(TWO_PI * millis()/periodInMilliseconds);
  
  /* calculate and update seconds waves */
  float secondsVShift = map(timeBasedSinusoidallyVaryingQuantity, -1, 1, height/2, (height/3));
  secondsWave.verticalShift = secondsVShift;
  
  float millisToCrossScreen = 1000.0;
  float secondsHShift = getCurrentHShift(millisToCrossScreen);
  
  secondsWave.horizontalShift = secondsHShift;
  secondsWave.update();
  
  if (m != 0) {
    Wave bottomMinutesWave = minutesWaves.get(0);
    float mergeDegree = millis()/periodInMilliseconds;
    secondsWave.mergeWaves(bottomMinutesWave, mergeDegree);
  }
  
  strokeWeight(2);
  secondsWave.display();
  
  /* calculate and update minutes wave */
  millisToCrossScreen = 3 * 1000.0;
  int minutesPerWave = 5;
  for (int i = 0; i < minutesWaves.size(); i+=minutesPerWave) {
    Wave minutesWave = minutesWaves.get(i);
    float minutesHShift = getCurrentHShift(millisToCrossScreen);
    minutesWave.horizontalShift = minutesHShift;
    minutesWave.update();
    strokeWeight(1.5);
    minutesWave.display();
  }
  
  /* calculate and update hours wave */ 
  millisToCrossScreen = 30.0 * 1000.0;
  float hoursHShift = getCurrentHShift(millisToCrossScreen);
  for (int i = 0; i < hoursWaves.size(); i++) {
    Wave hWave = hoursWaves.get(i);
    // hWave.horizontalShift = hoursHShift*(i/3);
    hWave.update();
    strokeWeight(1);
    hWave.display();
  }  
  popMatrix();
}

float getCurrentHShift(float millisToCrossScreen) {
  float hShift = millis()/millisToCrossScreen;
  return hShift;
}
  

Wave createSecondsWave() {
  float amp = baseWaveHeight*1.1;
  float freq = 0.75;
  // arguments for Wave constructor are (amplitude, frequency, horizontalShift, verticalShift, pointSpacing)
  Wave sWave = new Wave(amp, freq, 0, 0, 5);
  return sWave;
}

ArrayList<Wave> createMinutesWaves() {
  ArrayList<Wave> minutesWaves= new ArrayList<Wave>();
  println("m " + m);
  
  if (m != 0) {
    for (int i=0; i < m; i++) {
      println("i " + i);
      float amplitude = baseWaveHeight/3;
      float frequency = 1.5;
      int pointSpacing = 5;
      float allShift = 1*(height/10);
      float perWaveOffset = i*(baseWaveHeight/30);
      float vShift = allShift + perWaveOffset;
      float hShift = i*(width/20);
      Wave mWave = new Wave(amplitude, frequency, hShift, vShift, pointSpacing);
      minutesWaves.add(mWave);
    }
  }
  return minutesWaves;
}

ArrayList<Wave> createHoursWaves() {
  ArrayList<Wave> hoursWaves= new ArrayList<Wave>();
  // for every hour but the current one, draw a very slow moving wave at the top of the screen
  if (h != 0) {
    for (int i = 0; i < h; i++) {
      // arguments for Wave constructor are (amplitude, frequency, horizontalShift, verticalShift, pointSpacing)
      float amplitude = baseWaveHeight/4;
      float frequency = 1;
      float perWaveOffset = (i*(baseWaveHeight/4));
      float allShiftUp = -1*(height/2); 
      float vShift = allShiftUp + perWaveOffset;
      int pointSpacing = 5;
      int hShift = 0; // (i/3)
      Wave hWave = new Wave(amplitude, frequency, hShift, vShift, pointSpacing);
      hoursWaves.add(hWave);  
    }
  }
  return hoursWaves;
}

void setupGlobalTimes() {
  // Fetch the components of the time (hours, minutes, seconds, milliseconds).
  // Incidentally, you can also get day(), month(), year(), etc. 
  h = 15;//hour(); 
  m = 7;///minute(); 
  s = 30;// second(); 
}

void setMils(){
  // The millis() are not synchronized with the clock time. 
  // Instead, the millis() represent the time since the program started. Grrr. 
  // To approximate the "clock millis", we have to check when the seconds roll over. 
  if (s != prevSecond){ 
    lastRolloverTime = millis(); 
  }
  mils = millis() - lastRolloverTime;
  prevSecond = s;
}


// just here to help develop and debug
void drawTime() {
  setMils();
  //-------------------------------------------------
  // Assemble a string to display the time conventionally.
  String hourStr   = nf(((h > 12)? h-12:h), 2); // format String with 2 digits
  String minuteStr = nf(m, 2); // format String with 2 digits
  String secondStr = nf(s, 2); // format String with 2 digits
  String ampmStr   = (h < 12) ? "AM" : "PM"; 
  String milsStr   = nf(mils, 3); 
  String theTimeString = hourStr + ":" + minuteStr + ":" + secondStr; 
  theTimeString += "." + milsStr + " " + ampmStr; 
 
  fill (0); 
  text (theTimeString, width/5, 10); 
  noFill();
}
class Wave {
  float amplitude;
  float frequency;
  float horizontalShift;
  float verticalShift;
  int pointSpacing;
  ArrayList<PVector> points;
  
  Wave(float thisAmplitude, float thisFrequency, float thisHorizontalShift, float thisVerticalShift, int thisPointSpacing) {
   amplitude = thisAmplitude;
   frequency = thisFrequency;
   horizontalShift = thisHorizontalShift;
   verticalShift = thisVerticalShift;
   pointSpacing = thisPointSpacing;
   points = new ArrayList<PVector>();
  }
  
  // gets the y value for a given x position on this wave
  float getY(float xAngle) {
    float y = amplitude * sin((frequency * xAngle) - horizontalShift) + verticalShift;
    return y;
  }
  
  // calculate and store positions for each point that's a part of this wave
  void update() {
    points.clear();
    // for each x position across the window, get the y outputted by the wave function
    for (int x=0; x < width; x++) {
      float xAngle = map(x, 0, width, 0, TWO_PI);
      PVector xyPoint = new PVector(x, getY(xAngle));
      points.add(xyPoint);
    }
  }
  
  // take this wave and make it gradually more similar with another wave
  void mergeWaves(Wave anotherWave, float degree) {
    ArrayList<PVector> newPoints = new ArrayList<PVector>();
    // average points along this wave and the other wave's path to the degree
    // passed into the function
    for (int i = 0; i < points.size(); i++) {
      if (i < anotherWave.points.size()) {
        PVector thisPoint = points.get(i);
        PVector thatPoint = anotherWave.points.get(i);
        float mergeX = lerp(thisPoint.x, thatPoint.x, degree);
        float mergeY = lerp(thisPoint.y, thatPoint.y, degree);
        PVector mergePoint = new PVector(mergeX, mergeY);
        newPoints.add(mergePoint);
      }
    }
    points = newPoints;
  }
  
  void display() {
    // setup drawing settings
    smooth();
    noFill();
    // println("points.size() = " + points.size()); 

    // draw points that make up the curve
    beginShape(LINES);
    for (int pointNum = 0; pointNum < points.size(); pointNum++) {
      PVector point = points.get(pointNum);
      vertex(point.x, point.y);
    }
    endShape();
  }
}



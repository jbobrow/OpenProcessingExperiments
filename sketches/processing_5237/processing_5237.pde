
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import processing.core.PFont;
import processing.serial.Serial;

boolean timeStamped = true;
String[] fieldNames;
long[] times;
Peaks[] peaks;
int[][] values;
int[][] extremes;
boolean[] badData;
String delimiter = ",";
String filename = "ride_1254363746484.txt";
PFont font;
int numberOfFields;
long date = 691200000;

void setup() {

  size(600, 400); // Stage size
  noStroke(); // No border on the next thing drawn
  font = createFont("ArialMT-12.vlw", 24);
  int numValidReadings = 0;

  // Print a list of the serial ports, for debugging purposes to find out what your ports are called:
  String[] dataLines = loadStrings(filename);
  int numOfLines = dataLines.length;
  println("Attempting to load " + numOfLines + " lines.");
  fieldNames = dataLines[0].split(delimiter);
  numberOfFields = fieldNames.length;

  if (timeStamped) {
    numberOfFields--; // nock one field off if the first one is a timestamp    COULD HAVE FUCKED UP HERE!!!!!!
    times = new long[numOfLines];
  }

  println("Data has " + numberOfFields + " fields.");
  values = new int[numOfLines][numberOfFields];
  badData = new boolean[numOfLines]; // note ill formed data
  extremes = new int[numberOfFields][2]; // store biggest and smallest values in each field for scaling later

  //low extreme is 0 by default which would be hard to beat so make it big to start with

  for (int i = 0; i < extremes.length; i++) {
    extremes[i][0] = Integer.MAX_VALUE;
  }

  //make a peak detector for each field
  peaks = new Peaks[numberOfFields];

  for (int i = 0; i < numberOfFields; i++) {
    peaks[i] = new Peaks(values,i,7);
  }

  //get timestamps

  for (int lineNumber = 1; lineNumber < numOfLines; lineNumber++) {
    String[] fields = dataLines[lineNumber].split(delimiter);

    if (timeStamped ) { // if you have a timestamp and
      times[lineNumber] = Long.parseLong(fields[0].trim());
      badData[lineNumber] = true;
      continue; // bypass adding to values and extremes
    }
  }

  //get the data and the extremes

  for (int lineNumber = 1; lineNumber < numOfLines; lineNumber++) {
    String[] fields = dataLines[lineNumber].split(delimiter);

    if (fields.length != fieldNames.length){

      badData[lineNumber] = true;
      System.out.println("Something bad " + lineNumber + " "+ dataLines[lineNumber]);
      continue; // not all field present in this line
    }

    for (int fieldNumber = 0; fieldNumber < numberOfFields; fieldNumber++) {

      int thisValue = 45;
      int startField = 0;

      if (timeStamped) startField = 1; //if time stamp is the first field start with the next

      try {
        thisValue = Integer.parseInt(fields[fieldNumber+ startField].trim());
      } 
      catch (NumberFormatException e) {
        System.out.println("Couldn’t parse line " + lineNumber + " "+ dataLines[lineNumber]);
        badData[lineNumber] = true;
        continue;
      } 
      catch (Exception e) {
        badData[lineNumber] = true;
        System.out.println("Something bad " + lineNumber + " "+ dataLines[lineNumber]);
        continue;
      }

      values[lineNumber][fieldNumber] = thisValue;

      if (thisValue < extremes[fieldNumber][0]) extremes[fieldNumber][0] = thisValue; // 0 is minimum

      if (thisValue > extremes[fieldNumber][1]) extremes[fieldNumber][1] = thisValue; // 1 is maximum

      peaks[fieldNumber].checkForPeak(lineNumber, thisValue);
    }
    numValidReadings++; // valid readings
  }

  println("Read in " + numValidReadings + " valid readings");

  for (int i = 0; i < numberOfFields; i++){
    println("Extreme " + extremes[i][0] + " to " + extremes[i][1]);
  }
  drawIt(0);
}

void draw() {

}

void drawIt(int _where) {

  background(0xFF3A2C4B);
  float percentageAcrossScreen = (float) _where / width;
  int amountThatWontFitOnScreen = max(0, values.length - width);
  int offset = (int) (amountThatWontFitOnScreen * percentageAcrossScreen);
  int end = min(width + offset, values.length);
  int[] colors = new int[] {
    0xffFF7631, 0xff3147FF, 0xffFF7631, 0xffffff00, 0xffff00ff, 0xff00ffff  };
  float[] pypos = {
    -100, -100  };
  float[] pxpos = {
    -100, -100  };
  for (int reading = offset; reading <= end; reading++) {
    int xpos = reading - offset;
    int[] theseFields = values[reading];

    for (int fieldNumber = 0; fieldNumber < numberOfFields; fieldNumber++) {
      float ypos = map(theseFields[fieldNumber], extremes[fieldNumber][0], extremes[fieldNumber][1], 0, 300);
      fill(colors[fieldNumber]);
      // fill(255-fieldNumber*50,0,fieldNumber*50);
      stroke(colors[fieldNumber]);
      ellipse(xpos, ypos, 1, 1);
      

      if(pxpos[fieldNumber] != -100){
        line(xpos, ypos,pxpos[fieldNumber],pypos[fieldNumber]);
      }
      pxpos[fieldNumber] = xpos;
      pypos[fieldNumber] = ypos;

      int peak = peaks[fieldNumber].isAPeak(reading) ;
      if (peak == 1){
        fill(255,255,255);
        rect(xpos, ypos, 5, 5);
      }
      else if (peak == -1){
        fill(0,255,255);
        ellipse(xpos, ypos, 5, 5);
      }
    }

    // show where we are in the scrolling at the botom
    fill(255, 0, 0);
    textFont(font, 12);
    if (reading == offset) {
      if (timeStamped) {
        Date d = new Date(times[reading]+date);
        text(d.toString(), 0, height - 30);
        text("Millis: " + (times[reading]+date), 0, height - 10);// added time
      } 
      else {
        text("First Shown" + offset, 0, height - 30);
      }
    } 
    else if (reading == end) {
      if (timeStamped) {
        Date d = new Date(times[reading]+date);
        text(d.toString(), width - textWidth(d.toString()), height - 30);
        text("Millis: " + (times[reading]+date), width - textWidth("Millis: " + (times[reading]+date)), height - 10);// added time
      } 
      else {
        text("Last Shown " + end, width - textWidth("Last Shown " + end), height - 30);
      }
    }

    // color key field names at the top
    float textpos = 20;
    int startField = 0;

    if (timeStamped) startField = 1;
    for (int i = startField; i < fieldNames.length; i++) {
      fill(colors[i-1]);
      textFont(font, 32);
      text(fieldNames[i] + " ", textpos, 40);
      textpos = textpos + textWidth(fieldNames[i] + " ");
    }
  }
}

void mouseDragged() {
  drawIt(mouseX);
}

void mousePressed() {
  drawIt(mouseX);
}

class Peaks {

  int lastReading = 0;
  int consecutiveThreshold = 7;
  byte[] transitions;
  int lastTransition = 0;
  int consecutiveDown = 0;
  int consecutiveUp = 0;
  int lastMark;
  int[][] values;
  int whichField = 0;

  Peaks(int[][] _values, int _whichField, int _consecutiveThreshold){
    consecutiveThreshold = _consecutiveThreshold;
    transitions = new byte[_values.length];
    values = _values;
    whichField = _whichField;
  }
  void checkForPeak(int _readingNumber, int _reading){
    int difference = _reading - lastReading ;
    if (difference < 0){
      consecutiveDown++;
      consecutiveUp = 0;
    }
    if (difference > 0){
      consecutiveDown = 0 ;
      consecutiveUp++;
    }
    if ( lastTransition >=0 && consecutiveUp > consecutiveThreshold){ //last one was a peak and you are going up again mark this valley
      lastTransition = -1; //last one

      //satified there is a trend now go find the lowest since we last marked.
      int lowest = Integer.MAX_VALUE;
      int winningPos = 0;

      for(int i = _readingNumber; i> lastMark; i--){
        if (values[i][whichField] < lowest) {
          lowest = values[i][whichField];
          winningPos = i;
        }
      }
      lastMark = _readingNumber;

      //mark a valley
      transitions[winningPos] = -1;
    }

    if ( lastTransition <=0 && consecutiveDown > consecutiveThreshold){ //last one was a valley and you are going down again mark this peak
      lastTransition = 1; //last one

      //satified there is a trend now go find the lowest since we last marked.
      int highest = 0;
      int winningPos = 0;

      for(int i = _readingNumber; i> lastMark; i--){
        if (values[i][whichField] > highest) {
          highest = values[i][whichField];
          winningPos = i;
        }
      }
      lastMark = _readingNumber;

      //mark a peak
      transitions[winningPos] = 1;
      //transitions[_readingNumber-consecutiveDown] = 1;
    }
    lastReading = _reading;
  }

  int isAPeak(int _placeInArray){
    return(transitions[_placeInArray]);
  }

}












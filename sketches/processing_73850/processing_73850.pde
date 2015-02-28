
import processing.serial.*;

Serial myPort; 
float sensorValue;
String inString;

String[] alphabet = new String[32];
String word;
int indexStart;
int indexEnd;
PFont font;
boolean side;
boolean choice;

void setup() {
  alphabet[0] = "A";
  alphabet[1] = "B";
  alphabet[2] = "C";
  alphabet[3] = "D";
  alphabet[4] = "E";
  alphabet[5] = "F";
  alphabet[6] = "G";
  alphabet[7] = "H";
  alphabet[8] = "I";
  alphabet[9] = "J";
  alphabet[10] = "K";
  alphabet[11] = "L";
  alphabet[12] = "M";
  alphabet[13] = "N";
  alphabet[14] = "O";
  alphabet[15] = "P";
  alphabet[16] = "Q";
  alphabet[17] = "R";
  alphabet[18] = "S";
  alphabet[19] = "T";
  alphabet[20] = "U";
  alphabet[21] = "V";
  alphabet[22] = "W";
  alphabet[23] = "X";
  alphabet[24] = "Y";
  alphabet[25] = "Z";
  alphabet[26] = " ";
  alphabet[27] = ".";
  alphabet[28] = ",";
  alphabet[29] = "?";
  alphabet[30] = "!";
  alphabet[31] = "&";
  indexStart = 0;
  indexEnd = 31;
  word = "";
  font = loadFont("Gotham-Book-48.vlw");
  size(780, 400);
  background(255);
  stroke(0);
  fill(0);
  noStroke();
  smooth();
  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  choice = false;
}

void draw() {
  background(255);
  int j = 0;
  for (int i=indexStart; i<indexEnd+1;i++) {
    fill(0, 50);
    textFont(font, 24);
    text(alphabet[i], (width/(indexEnd+1-indexStart))*j, 100);
    j++;
  }
  if (!side) {
    fill(0, 20);
    rect(0, 0, width/2-10, height/2);
  } 
  else {
    fill(0, 20);
    rect(width/2-10, 0, width/2+10, height/2);
  }
  fill(0);
  textFont(font, 48);
  text(word, 20, 300);
  //  println(sensorValue);
  //  println(inString);
  if (inString != null) {
    if (inString.equals("CHOOSE") == true && choice == false) {
      choice = true;
      choose();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      side = false;
    }
    if (keyCode == RIGHT) {
      side = true;
    }
  }
  if (key == ' ') {
    choose();
  }
}

void choose() {
  int s = indexStart + 1;
  int e = indexEnd + 1;
  if (e-s+1 == 2) {
    if (!side) {
      e = e-((e-s+1)/2);
    } 
    else {
      s = s+((e-s+1)/2);
    }
    word += alphabet[s-1];
    indexStart = 0;
    indexEnd = 31;
  } 
  else {
    if (!side) {
      e = e-((e-s+1)/2);
    } 
    else {
      s = s+((e-s+1)/2);
    }
    indexStart = s-1;
    indexEnd = e-1;
  }
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  inString = myPort.readStringUntil('\n');
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    if (inString.equals("CHOOSE") == false) {
      float inByte = float(inString); 
      sensorValue = map(inByte, 0, 1023, 0, 100);
      if (sensorValue>=50) {
        side = false;
      } 
      else {
        side = true;
      }
      choice = false;
    }
  }
}



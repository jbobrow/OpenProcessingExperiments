
/*************************************************************************
*  Musical Tones: By Ken Kapptie | Copyright 2013                        *
*  Goal: to create a visualization that allows the user to see precise   *
*        info about a frequency and see where a tone matches a guitar.   *
*  TODO: 1. Build a guitar fretboard and highlight corresponding notes   *
*        2. Build a bass guitar fretboard                                *
**************************************************************************/
Table table;
BlackKey[] blackCKeys = new BlackKey[7];
BlackKey[] blackDKeys = new BlackKey[7];
BlackKey[] blackFKeys = new BlackKey[7];
BlackKey[] blackGKeys = new BlackKey[7];
BlackKey[] blackAKeys = new BlackKey[8];
WhiteKey[] whiteAKeys = new WhiteKey[8];
WhiteKey[] whiteBKeys = new WhiteKey[8];
WhiteKey[] whiteCKeys = new WhiteKey[8];
WhiteKey[] whiteDKeys = new WhiteKey[7];
WhiteKey[] whiteEKeys = new WhiteKey[7];
WhiteKey[] whiteFKeys = new WhiteKey[7];
WhiteKey[] whiteGKeys = new WhiteKey[7];

String bPitch = "Click on a note...";
String noteWave = "";
float freq;
int noteY;
int guitarY;
int guitarLowE;
int guitarHighE;
int guitarA;
int guitarD;
int guitarG;
int guitarB;
PImage treble;
PImage bass;

void setup() {
  size(1080, 900);
  table = loadTable("noteInfo.csv", "header");
  treble = loadImage("treble.jpg");
  bass = loadImage("bass.jpg");
  // Major Keys
  for (int i=0; i<whiteAKeys.length;i++) {
    whiteAKeys[i] = new WhiteKey(i*140+20, 100, i).asAMajor("A");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<whiteBKeys.length;i++) {
    whiteBKeys[i] = new WhiteKey(i*140+40, 100, i).asBMajor("B");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<whiteCKeys.length;i++) {
    whiteCKeys[i] = new WhiteKey(i*140+60, 100, i+1).asCMajor("C");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<whiteDKeys.length;i++) {
    whiteDKeys[i] = new WhiteKey(i*140+80, 100, i+1).asDMajor("D");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<whiteEKeys.length;i++) {
    whiteEKeys[i] = new WhiteKey(i*140+100, 100, i+1).asEMajor("E");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<whiteFKeys.length;i++) {
    whiteFKeys[i] = new WhiteKey(i*140+120, 100, i+1).asFMajor("F");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<whiteGKeys.length;i++) {
    whiteGKeys[i] = new WhiteKey(i*140+140, 100, i+1).asGMajor("G");
    //bPitch = whiteKeys[i].keyVal;
  }
  //Sharp Keys
  for (int i=0; i<blackCKeys.length;i++) {
    blackCKeys[i] = new BlackKey(i*140+70, 100, i+1).asCSharp("C");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<blackDKeys.length;i++) {
    blackDKeys[i] = new BlackKey(i*140+92, 100, i+1).asDSharp("D");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<blackFKeys.length;i++) {
    blackFKeys[i] = new BlackKey(i*140+131, 100, i+1).asFSharp("F");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<blackGKeys.length;i++) {
    blackGKeys[i] = new BlackKey(i*140+152, 100, i+1).asFSharp("G");
    //bPitch = whiteKeys[i].keyVal;
  }
  for (int i=0; i<blackAKeys.length;i++) {
    blackAKeys[i] = new BlackKey(i*140+32, 100, i).asFSharp("A");
    //bPitch = whiteKeys[i].keyVal;
  }
}

void draw() {
  background(220);
  stroke(0);
  
  // Major Keys
  for (int i=0; i<whiteAKeys.length;i++) {
    WhiteKey iWhiteAKey = whiteAKeys[i];
    iWhiteAKey.display();
  }
  for (int i=0; i<whiteBKeys.length;i++) {
    WhiteKey iWhiteBKey = whiteBKeys[i];
    iWhiteBKey.display();
  }
  for (int i=0; i<whiteCKeys.length;i++) {
    WhiteKey iWhiteCKey = whiteCKeys[i];
    iWhiteCKey.display();
  }
  for (int i=0; i<whiteDKeys.length;i++) {
    WhiteKey iWhiteDKey = whiteDKeys[i];
    iWhiteDKey.display();
  }
  for (int i=0; i<whiteEKeys.length;i++) {
    WhiteKey iWhiteEKey = whiteEKeys[i];
    iWhiteEKey.display();
  }
  for (int i=0; i<whiteFKeys.length;i++) {
    WhiteKey iWhiteFKey = whiteFKeys[i];
    iWhiteFKey.display();
  }
  for (int i=0; i<whiteGKeys.length;i++) {
    WhiteKey iWhiteGKey = whiteGKeys[i];
    iWhiteGKey.display();
  }

  // Sharp Keys
  for (int i=0; i<blackCKeys.length;i++) {
    BlackKey iBlackCKey = blackCKeys[i];
    iBlackCKey.display();
  }
  for (int i=0; i<blackDKeys.length;i++) {
    BlackKey iBlackDKey = blackDKeys[i];
    iBlackDKey.display();
  }
  for (int i=0; i<blackFKeys.length;i++) {
    BlackKey iBlackFKey = blackFKeys[i];
    iBlackFKey.display();
  }
  for (int i=0; i<blackGKeys.length;i++) {
    BlackKey iBlackGKey = blackGKeys[i];
    iBlackGKey.display();
  }
  for (int i=0; i<blackAKeys.length;i++) {
    BlackKey iBlackAKey = blackAKeys[i];
    iBlackAKey.display();
  }
  fill(180);
  rect(40,260,320,610,10);
  rect(420,260,250,620,10);
  rect(720,260,250,620,10);
  fill(255);
  rect(50,300,300,560);
  fill(200,150,55);
  rect(490,320,120,550);
  image(treble,100,480);
  image(bass,100,600);
  fill(0);
  drawStaff();
  drawFretNums(465,315);
  stroke(255,0,0);
  strokeWeight(3);
  ellipse(250,height-noteY-20,25,19);
  
  drawFredboard();
  // Draw Low E String
  drawGuitarLowEString();
  stroke(255,0,0);
  strokeWeight(3);
  rect(495,guitarLowE-540,10,20,2);
  
  // Draw A String
  drawGuitarAString();
  stroke(255,0,0);
  strokeWeight(3);
  rect(515,guitarA-690,10,20,2);
  
  // Draw D String
  drawGuitarDString();
  stroke(255,0,0);
  strokeWeight(3);
  rect(535,guitarD-840,10,20,2);
  
  // Draw D String
  drawGuitarGString();
  stroke(255,0,0);
  strokeWeight(3);
  rect(555,guitarG-990,10,20,2);
  
  // Draw D String
  drawGuitarBString();
  stroke(255,0,0);
  strokeWeight(3);
  rect(575,guitarB-1110,10,20,2);
  
  // Draw High E String
  drawGuitarHighEString();
  stroke(255,0,0);
  strokeWeight(3);
  rect(595,guitarHighE-1260,10,20,2);
  
  fill(0);
  textSize(50);
  text(bPitch, 40, 70);
  textSize(35);
  text(noteWave, 40, 240);
  textSize(10);
  text("This information created using A4 = 440 Hz ", 40,890); // Speed of sound = 345 m/s = 1130 ft/s = 770 miles/hr", 40,890);
  textSize(20);
  text("Music Staff",150,290);
  text("Guitar Fretboard",470, 290);
  text("Bass Fretboard",780, 290);
}

String matchInfo(String value) {
  // match note clicked to dataset
  TableRow result = table.matchRow(value,"noteName");
  value = value + " - Note Frequency: " + result.getString("noteFreq");
  noteY = int(result.getString("notePlace"));
  guitarY = int(result.getString("guitarY"));
  return value;
}

String matchWaveInfo(String value) {
  // match note clicked to dataset
  TableRow result = table.matchRow(value,"noteName");
  value = "Note Wavelength: " + result.getString("noteWave") + " cm";
  noteY = int(result.getString("notePlace"));
  guitarY = int(result.getString("guitarY"));
  return value;
}

void drawStaff() {
  strokeWeight(3);
  stroke(0);
  for(int i=0; i<100;i+=20){
    line(200,i+500,300,i+500);
  }
  for(int i=0; i<100;i+=20){
    line(200,i+620,300,i+620);
  }
  for(int i=0; i<180;i+=20){
    stroke(155);
    strokeWeight(1);
    line(200,i+320,300,i+320);
  }
  for(int i=0; i<140;i+=20){
    stroke(155);
    strokeWeight(1);
    line(200,i+720,300,i+720);
  }
}

void drawFredboard() {
  for (int i=0;i<570;i+=30) {
    strokeWeight(3);
    stroke(0);
    line(490,i+320,610,i+320);
    /*for(int j=0;j<20;j++) {
      textSize(15);
      text(j-1,470,j*30);
    }*/
  }
  fill(240);
  noStroke();
  //rect(495,325,60,20);
  rect(493,385,113,20);
  rect(493,445,113,20);
  rect(493,505,113,20);
  rect(493,565,113,20);
  rect(493,655,113,15);
  rect(493,750,113,15);
  rect(493,810,113,15);
  fill(0);
  stroke(0);
  line(490,316,610,316);
  line(490,676,610,676);
}

void drawFretNums(int x, int y){
  for(int i=0;i<19;i++) {
    fill(0);
    stroke(0);
    textSize(15);
    text(i,x,y+i*30);
  }
}

void drawGuitarLowEString() {
  strokeWeight(8);
  stroke(100);
  line(500,320,500,860);
  if(guitarY>=840 && guitarY<1400) {
    guitarLowE = guitarY;
  } else {
    guitarLowE = 10000;
  }
}

void drawGuitarAString() {
  strokeWeight(7);
  stroke(100);
  line(520,320,520,860);
  if(guitarY>=990 && guitarY<1550) {
    guitarA = guitarY;
  } else {
    guitarA = 10000;
  }
}

void drawGuitarDString() {
  strokeWeight(6);
  stroke(100);
  line(540,320,540,860);
  if(guitarY>=1140 && guitarY<1700) {
    guitarD = guitarY;
  } else {
    guitarD = 10000;
  }
}

void drawGuitarGString() {
  strokeWeight(5);
  stroke(100);
  line(560,320,560,860);
  if(guitarY>=1290 && guitarY<1850) {
    guitarG = guitarY;
  } else {
    guitarG = 10000;
  }
}

void drawGuitarBString() {
  strokeWeight(4);
  stroke(100);
  line(580,320,580,860);
  if(guitarY>=1410 && guitarY<1970) {
    guitarB = guitarY;
  } else {
    guitarB = 10000;
  }
}

void drawGuitarHighEString() {
  strokeWeight(3);
  stroke(100);
  line(600,320,600,860);
  if(guitarY>=1560 && guitarY<2120) {
    guitarHighE = guitarY;
  } else {
    guitarHighE = 10000;
  }
}

void mouseReleased() {
  for (int i=0; i<whiteAKeys.length;i++) {
    WhiteKey iWhiteAKey = whiteAKeys[i];
    if (iWhiteAKey.overKey) {
      bPitch = matchInfo(iWhiteAKey.majorVal + int(iWhiteAKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteAKey.majorVal + int(iWhiteAKey.keyVal)).toString();
      
    }
  }
  for (int i=0; i<whiteBKeys.length;i++) {
    WhiteKey iWhiteBKey = whiteBKeys[i];
    if (iWhiteBKey.overKey) {
      bPitch = matchInfo(iWhiteBKey.majorVal + int(iWhiteBKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteBKey.majorVal + int(iWhiteBKey.keyVal)).toString();
    }
  }
  for (int i=0; i<whiteCKeys.length;i++) {
    WhiteKey iWhiteCKey = whiteCKeys[i];
    if (iWhiteCKey.overKey) {
      bPitch = matchInfo(iWhiteCKey.majorVal + int(iWhiteCKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteCKey.majorVal + int(iWhiteCKey.keyVal)).toString();
    }
  }
  for (int i=0; i<whiteDKeys.length;i++) {
    WhiteKey iWhiteDKey = whiteDKeys[i];
    if (iWhiteDKey.overKey) {
      bPitch = matchInfo(iWhiteDKey.majorVal + int(iWhiteDKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteDKey.majorVal + int(iWhiteDKey.keyVal)).toString();
    }
  }
  for (int i=0; i<whiteEKeys.length;i++) {
    WhiteKey iWhiteEKey = whiteEKeys[i];
    if (iWhiteEKey.overKey) {
      bPitch = matchInfo(iWhiteEKey.majorVal + int(iWhiteEKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteEKey.majorVal + int(iWhiteEKey.keyVal)).toString();
    }
  }
  for (int i=0; i<whiteFKeys.length;i++) {
    WhiteKey iWhiteFKey = whiteFKeys[i];
    if (iWhiteFKey.overKey) {
      bPitch = matchInfo(iWhiteFKey.majorVal + int(iWhiteFKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteFKey.majorVal + int(iWhiteFKey.keyVal)).toString();
    }
  }
  for (int i=0; i<whiteGKeys.length;i++) {
    WhiteKey iWhiteGKey = whiteGKeys[i];
    if (iWhiteGKey.overKey) {
      bPitch = matchInfo(iWhiteGKey.majorVal + int(iWhiteGKey.keyVal)).toString();
      noteWave = matchWaveInfo(iWhiteGKey.majorVal + int(iWhiteGKey.keyVal)).toString();
    }
  }
  for (int i=0; i<blackCKeys.length;i++) {
    BlackKey iBlackCKey = blackCKeys[i];
    if (iBlackCKey.overKey) {
      bPitch = matchInfo(iBlackCKey.sharpVal + "#" + int(iBlackCKey.keyVal)).toString();
      noteWave = matchWaveInfo(iBlackCKey.sharpVal + "#" + int(iBlackCKey.keyVal)).toString();
    }
  }
  for (int i=0; i<blackDKeys.length;i++) {
    BlackKey iBlackDKey = blackDKeys[i];
    if (iBlackDKey.overKey) {
      bPitch = matchInfo(iBlackDKey.sharpVal + "#" + int(iBlackDKey.keyVal)).toString();
      noteWave = matchWaveInfo(iBlackDKey.sharpVal + "#" + int(iBlackDKey.keyVal)).toString();
    }
  }
  for (int i=0; i<blackFKeys.length;i++) {
    BlackKey iBlackFKey = blackFKeys[i];
    if (iBlackFKey.overKey) {
      bPitch = matchInfo(iBlackFKey.sharpVal + "#" + int(iBlackFKey.keyVal)).toString();
      noteWave = matchWaveInfo(iBlackFKey.sharpVal + "#" + int(iBlackFKey.keyVal)).toString();
    }
  }
  for (int i=0; i<blackGKeys.length;i++) {
    BlackKey iBlackGKey = blackGKeys[i];
    if (iBlackGKey.overKey) {
      bPitch = matchInfo(iBlackGKey.sharpVal + "#" + int(iBlackGKey.keyVal)).toString();
      noteWave = matchWaveInfo(iBlackGKey.sharpVal + "#" + int(iBlackGKey.keyVal)).toString();
    }
  }
  for (int i=0; i<blackAKeys.length;i++) {
    BlackKey iBlackAKey = blackAKeys[i];
    if (iBlackAKey.overKey) {
      bPitch = matchInfo(iBlackAKey.sharpVal + "#" + int(iBlackAKey.keyVal)).toString();
      noteWave = matchWaveInfo(iBlackAKey.sharpVal + "#" + int(iBlackAKey.keyVal)).toString();
    }
  }
}

class BlackKey {
  int xpos;
  int ypos;
  int keyW = 16;
  int keyH = 60;
  boolean overKey = false;
  float keyVal;
  String sharpVal;
  
  // Constructor
  BlackKey(int tempXpos, int tempYpos, float tempKeyVal) {
    xpos = tempXpos;
    ypos = tempYpos;
    keyVal = tempKeyVal;
  }
  BlackKey asCSharp(String tempSharpVal) {
    sharpVal = tempSharpVal;
    return this;
  }
  BlackKey asDSharp(String tempSharpVal) {
    sharpVal = tempSharpVal;
    return this;
  }
  BlackKey asFSharp(String tempSharpVal) {
    sharpVal = tempSharpVal;
    return this;
  }
  BlackKey asGSharp(String tempSharpVal) {
    sharpVal = tempSharpVal;
    return this;
  }
  BlackKey asASharp(String tempSharpVal) {
    sharpVal = tempSharpVal;
    return this;
  }
  
  void display() {
    if(overKey) {
      if(mousePressed == true) {
        strokeWeight(3);
        stroke(255,255,0);
      } else {
        strokeWeight(3);
        stroke(255,100,0);
      }
    } else {
      strokeWeight(1);
      stroke(0);
    }
    // Loop for C#
    if (sharpVal == "C") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos && mouseY < ypos+keyH;
      fill(0);
      rect(xpos,ypos,keyW,keyH);
      fill(255);
      textSize(8);
      //text(sharpVal + "#" + keyVal,xpos,ypos+50);
    } else if (sharpVal == "D") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos && mouseY < ypos+keyH;
      fill(0);
      rect(xpos,ypos,keyW,keyH);
      fill(255);
      textSize(8);
      //text(sharpVal + "#" + keyVal,xpos,ypos+50);
    } else if (sharpVal == "F") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos && mouseY < ypos+keyH;
      fill(0);
      rect(xpos,ypos,keyW,keyH);
      fill(255);
      textSize(8);
      //text(sharpVal + "#" + keyVal,xpos,ypos+50);
    } else if (sharpVal == "G") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos && mouseY < ypos+keyH;
      fill(0);
      rect(xpos,ypos,keyW,keyH);
      fill(255);
      textSize(8);
      //text(sharpVal + "#" + keyVal,xpos,ypos+50);
    } else if (sharpVal == "A") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos && mouseY < ypos+keyH;
      fill(0);
      rect(xpos,ypos,keyW,keyH);
      fill(255);
      textSize(8);
      //text(sharpVal + "#" + keyVal,xpos,ypos+50);
    }
  }
}
class WhiteKey {
  int xpos;
  int ypos;
  int keyW = 20;
  int keyH = 100;
  boolean overKey = false;
  float keyVal;
  String majorVal;
  
  // Constructor
  WhiteKey(int tempXpos, int tempYpos, float tempKeyVal) {
    xpos = tempXpos;
    ypos = tempYpos;
    keyVal = tempKeyVal;
  }
  WhiteKey asAMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  WhiteKey asBMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  WhiteKey asCMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  WhiteKey asDMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  WhiteKey asEMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  WhiteKey asFMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  WhiteKey asGMajor(String tempMajorVal) {
    majorVal = tempMajorVal;
    return this;
  }
  
  void display() {
    if(overKey) {
      if(mousePressed == true) {
        strokeWeight(3);
        stroke(255,255,0);
      } else {
        strokeWeight(3);
        stroke(255,100,0);
      }
    } else {
      strokeWeight(1);
      stroke(0);
    }
    
    if (majorVal == "A") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    } else if (majorVal == "B") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    } else if (majorVal == "C") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    } else if (majorVal == "D") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    } else if (majorVal == "E") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    } else if (majorVal == "F") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    } else if (majorVal == "G") {
      overKey = mouseX > xpos && mouseX < xpos+keyW && mouseY > ypos+60 && mouseY < ypos+keyH;
      fill(255);
      rect(xpos,ypos,keyW,keyH);
    }
    
  }
}



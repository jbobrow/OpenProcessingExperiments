
/*

 alewis
 [11/08/2012] based on virtual_twitr_janus_2 
 [12/08/2012] virtual_twitr_janus_7 - this version will adjust so that eye positions match target positions
 
 */
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
import processing.serial.*;
import guru.ttslib.*; // NB this also needs to be loaded (available from http://www.local-guru.net/projects/ttslib/ttslib-0.3.zip)
Serial port;
TTS tts;

// this is setting up fill colours for Processing display
color off = color(4, 79, 111);
color on = color(84, 145, 158);

// initialise variables

// @@@@@@@@@@ Googlespreadsheet variables
int gssEyeballUpDown=0; // will be used store data to use for eyeball servo
int gssEyeballLeftRight=0; // will be used store data to use for eyeball servo
String gssText="initialised"; // will be used store data to use for eyeball servo
String gssTextCheck = gssText;
int gssTextLength = 0; // initialise text length for reading from Google Spreadsheet
int gssTimer=0; // used to reset timer for Google spreadsheet calls
int gssPeriod = 2500; // interval between checks on google spreadsheet
//String gssApiString = "https://docs.google.com/spreadsheet/tq?key=0AgTXh43j7oFVdDJSaHU1ejFqdVRTZU1ZZ1Fabmt2UXc&range=E2%3AG2&headers=0";
String gssApiString = "https://spreadsheets.google.com/feeds/list/0AgTXh43j7oFVdFZJdklXTU1lTzY5U25sc3BJNjRLRUE/od6/public/basic?alt=rss";
// @@@@@@@@@@ Googlespreadsheet end

int value=10; // what is this?
int thresholdAnalogIn=80;
int peakPin = 2;
int valueAnalogIn =0;
int analogInput = 0;
int count=0;
int countStop=40;
int movex=0;
float f = random(260000);
int currentM = millis(); // used to store sets current time since app launched in milliseconds
int timer = 0; // a timer variable to compare it with to see if a fixed period is over
int period =29000; // this is the interval between checks made for new tweets
int bk =int(f);
int spacer=35;
int rectHeight=0;
String tweetText = "initialised";
String tweetCheck = tweetText;
int tweetLength = 0; // used to measure length of incoming tweet
String twitterUsername = "twitr_janus";
int getPIN = 8;// this is the pin number for the LED that is indicating if a tweet has been received 
int newTweetPIN = 2;
int delayVal=500; // used fr tweets to delays after text to speech - Is this redundant?


// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


int eyeVinit = 200;// Vertical common start position
int eyeHLinit = 150;
int eyeHRinit = 450;

//---------------------------
// face
color faceColour = color (255, 240, 240);

// @@@@@@@@@@@ initialise left eye @@@@@@@@@@@
int eyeHL = eyeHLinit;
int eyeVL = eyeVinit;
int pupilHL = eyeHLinit;
int pupilVL = eyeVinit;
// initialise right eye
int eyeHR = eyeHRinit; 
int eyeVR = eyeVinit;
int pupilHR = eyeHRinit;
int pupilVR = eyeVinit;

// -----------------------------

// initialise target positions
int eyeHRT = eyeHR;
int eyeHLT = eyeHL;
int eyeVRT = eyeVR;
int eyeVLT = eyeVL;

// -----------------------------

// initialise check digits
int checkH = 0;  
int checkV ;  
int checkHP = 0;
int checkVP = 0;
int negFactorH=1;
int negFactorV=1;
int negFactorHP=1;
int negFactorVP=1;
int checkZH = 0;
int checkZV = 0;
int checkZHP = 0;
int checkZVP = 0;

// ----------------------


int eyeDiameter = 200;
int eyeWidth = eyeDiameter;
int eyeHeight = eyeDiameter;
int inc = 5; //eyeball movement increment
float incPupil = 5;


color eyeColor = color(255, 255, 255);
color textColor = color (255, 255, 255);

int irisD = 90; // define iris size
int pupilD = 30;

int eyeHLmin = eyeHLinit-((eyeWidth - irisD)/2);
int eyeHLmax = eyeHLinit+((eyeWidth - irisD)/2);
int eyeHRmin = eyeHRinit-((eyeWidth - irisD)/2);
int eyeHRmax = eyeHRinit+((eyeWidth - irisD)/2);
int eyeVLmin = eyeVinit-((eyeWidth - irisD)/2);
int eyeVLmax = eyeVinit+((eyeWidth - irisD)/2);

// ----------------------
// teeth initialisation
int teethWidth=25;
int teethHeight=90;
int teethHLinit= eyeHLinit+(teethWidth/2);
int teethVL = 400;
int teethNum=5;
float teethSpacer=(eyeHRinit - eyeHLinit)/teethNum;

//mouth initialisation
color mouthColour = color (245, 0, 0);

int chompFactor = 3; // this is to scale down the length of the received data 
int chompDelay = 50; // gap between chomps up and chomps down in milliseconds
int chompRand = 100;

int lipWidth = (eyeHRinit-eyeHLinit);
int lipHeight = 50 ;
int lipUH = eyeHLinit;
int lipUV = 400;
int lipLH = lipUH;
int lipLV = lipUV+lipHeight;
int lipDiff=lipHeight/2;
int lipUVshut = lipUV;
int lipLVshut = lipLV;
int lipUVopen = lipUV-lipDiff;
int lipLVopen = lipLV+lipDiff;
int lipTimer = 300;
int lipOpenTimer = 1500; // lip opening time in milliseconds



// ----------------------

void setup ()
{
  tts = new TTS();
  size(600, 600);  
  background (faceColour);
  //fill (textColor);
  println(Serial.list());// display communication ports (use this in test to establish fee ports)
  port = new Serial(this, Serial.list()[1], 9600); 
  getGssData();
  getTweet();
  drawHead ();
  //
}

void draw ()
{
  checkEyePos2();
  drawEyes();
  currentM= millis();
  if (currentM-gssTimer > gssPeriod)
  {
    gssTimer=currentM; // reset gssTimer to current time elapsed since start
    getGssData ();
  }

  if (currentM-timer > period) { //this is checking tweet based upon a time interval"period"
    getTweet();
    timer=currentM;
    println ("Timer = "+currentM);
  } //@@ end  period @@
}

//---------------functions from processing_PC
void drawBox() {
  background(off);
  stroke(on);
  int intx=0;
  int inty=120;
  if (count>countStop) {
    count=0;
    movex=0;
    f = random(20000);
    bk =int(f);
  } 
  else {
    if (rectHeight>120)
    {
      rectHeight=0;
    } 
    else
    {
      rectHeight+=1;
    };
    count++;
    movex+= spacer;
  };

  //background(bk); 
  color c1 = color(3, 88, 170);
  fill(c1);
  noStroke();
  rect(intx+movex, inty, 55, 55 );
}
void getTweet ()
{
  // uses Twitter API to get public tweets from username (sent in function argument)

  tweetCheck = tweetText;

  String twitterApiString = "https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name="+twitterUsername+"&count=0";
  println ("@@@");
  println ("[Start Inside printTweet]");
  println ();
  String [] texty = loadStrings(twitterApiString);
  String [] texty2 = split (texty[0], ':');
  String [] texty3 = split (texty2[6], '"');
  tweetText = texty3[1];
  tweetLength= tweetText.length();
  println ("tweetText is loaded with the last tweet from Rosemarybeetle was: ");
  //println (currentTweet);
  println (tweetText);
  println ();
  println ("and...");
  println ();
  // following lines return the contents of tweet check (last new tweet)
  print ("tweetCheck value = ");
  println (tweetCheck);
  print ("tweetText length = ");
  println (tweetText.length());
  println ();
  println ("[End Inside printTweet]");
  println ("@@@");
  println ();

  if (tweetText.equals(tweetCheck)==false)
  {
    println ("inside tweet checking IF");
    print (tweetText);
    println ("@");
    print (tweetCheck);
    println ("@");
    //delay (delayVal);
    port.write(tweetLength);
    tts.speak(tweetText);
  };
}
void getGssData ()
{
  // uses Google SpreadSheets API to get public tweets from twitr_janus_eyeballs published spreadsheet

  gssTextCheck = gssText;

  println ("@@@");
  println ("[Start Inside printGSS]");
  println ();
  String [] texty = loadStrings(gssApiString);
  String [] texty2 = split (texty[0], '¬'); //  pulling out data with stop character

  String [] texty3 = split (texty2[4], '<'); // get rid of trailing text after <
  gssText = texty3[0];
  gssTextLength= gssText.length();
  // @@@@@@@@@@@@@@@@
  String [] texty4 = split (texty2[2], ',');
  gssEyeballUpDown = int (texty4 [0]);
  print ("gssEyeballUpDown = ");
  println (gssEyeballUpDown);
  println ();
  // @@@@@@@@@@@@@@@@
  String [] texty5 = split (texty2[3], ',');
  gssEyeballLeftRight = int (texty5 [0]);
  print ("gssEyeballLeftRight = ");
  println (gssEyeballLeftRight);
  println ();
  updateEyeTargetPosition ();
  // @@@@@@@@@@@@@@@@
  println ();
  print ("gssText = ");
  println (gssText);

  println ();
  // following lines return the contents of tweet check (last new tweet)

  println ("[End Inside getGSS]");
  println ("@@@");
  println ();

  if (gssText.equals(gssTextCheck)==false)
  {
    jawChomper(); // needed for virtual twitr_janus


    println ("inside GSS checking IF");
    print (gssText);
    println ("");
    print (gssTextCheck);
    println ("@");
    port.write(gssTextLength);
    tts.speak(gssText);

    // }
  };
}

// ------------------------------------------
void keyPressed() {
  // @@@@@@@@@@@@@@@@
  // these lines will be superceded by data from the Internet
  if (keyCode==49) {
    println (" key 1 pressed ");
    eyeHLT-=inc;
    eyeHRT-=inc;

    println ("eyeHLT = "+eyeHLT);
    println ("eyeHRT = "+eyeHRT);
  }
  if (keyCode==50) {
    println (" key 2 pressed ");
    eyeHLT+=inc;
    eyeHRT+=inc;

    println ("eyeHLT = "+eyeHLT);
    println ("eyeHRT = "+eyeHRT);
  }

  if (keyCode==57) {
    println (" key 9 pressed ");
    eyeVLT+=inc;
    eyeVRT+=inc;
  }
  if (keyCode==48) {
    println (" key 0 pressed ");
    eyeVRT-=inc;
    eyeVLT-=inc;
  } 
  // @@@@@@@@@@@@@@@@
  checkEyePos2();
}// end ifKeyPressed()

// @@@@@@@@@@@@@@@@@@@@@@@@@@@
void checkEyePos()
{
  checkH = eyeHLinit-eyeHL; //calculate if horizontal eye position has reached limit
  checkV = eyeVinit-eyeVL;
  checkHP = eyeHLinit-pupilHL; //calculate if horizontal pupil position has reached limit
  checkVP = eyeVinit-pupilVL;
  if ((checkH <0)) {
    negFactorH=-1;
  } 
  else if ((checkH >=0)) { 
    negFactorH=1;
  }
  if ((checkV <0)) {
    negFactorV=-1;
  } 
  else if ((checkV >=0)) { 
    negFactorV=1;
  }
  if ((checkHP <0)) {
    negFactorHP=-1;
  } 
  else if ((checkHP >=0)) { 
    negFactorHP=1;
  }
  if ((checkVP <0)) {
    negFactorVP=-1;
  } 
  else if ((checkVP >=0)) { 
    negFactorVP=1;
  }
  int checkZH = int (negFactorH*sqrt(sq(checkH)+sq(checkV)));
  int checkZV = int (negFactorV*sqrt(sq(checkH)+sq(checkV)));
  int checkZHP = int (negFactorHP*sqrt(sq(checkHP)+sq(checkVP)));
  int checkZVP = int (negFactorVP*sqrt(sq(checkHP)+sq(checkVP)));

  //if (key == CODED) 
  //{
  if (eyeHLT==1)
  {

    if (checkZH <(eyeDiameter/4)) {
      eyeHL-= inc; 
      eyeHR-= inc;
      println("EEK - eyeHL = "+eyeHL);
    }
    if (checkZHP <(eyeDiameter/4+(irisD/4))) {

      pupilHL-= incPupil;
      pupilHR-= incPupil;
    }
  } 
  else if (eyeHLT==3)
  {
    if (checkZH >=(-eyeDiameter/4)) {

      eyeHL+= inc; 
      eyeHR+= inc;
      println("EEK - eyeHL = "+eyeHL);
    }
    if (checkZHP >=(-eyeDiameter/4-(irisD/4))) {

      pupilHL += incPupil; 
      pupilHR += incPupil;
    }
  }
  if (eyeVLT==8)
  {
    if (checkZV <((eyeDiameter/4))) {

      eyeVL-=inc; 
      eyeVR-=inc;
      println("EEK - eyeVL = "+eyeVL);
    }

    if (checkZVP <(eyeDiameter/4+(irisD/4))) {

      pupilVL-= incPupil; 
      pupilVR -= incPupil;
    }
  }


  else if (eyeVLT==0)
  {
    if (checkZV >=(-eyeDiameter/4)) {

      eyeVL+=inc; 
      eyeVR+=inc;
      println("EEK - eyeVL = "+eyeVL);
    }
    if (checkZVP >=(-eyeDiameter/4-(irisD/4))) {

      pupilVL += incPupil; 
      pupilVR += incPupil;
    }
  } // end DOWN
  //}// end hey==coded
}// end checkEyePos ()

// -----------------------

void checkEyePos2()
{
  checkH = eyeHLinit-eyeHL; //calculate if horizontal eye position has reached limit
  checkV = eyeVinit-eyeVL;
  checkHP = eyeHLinit-pupilHL; //calculate if horizontal pupil position has reached limit
  checkVP = eyeVinit-pupilVL;
  if ((checkH <0)) {
    negFactorH=-1;
  } 
  else if ((checkH >=0)) { 
    negFactorH=1;
  }
  if ((checkV <0)) {
    negFactorV=-1;
  } 
  else if ((checkV >=0)) { 
    negFactorV=1;
  }
  if ((checkHP <0)) {
    negFactorHP=-1;
  } 
  else if ((checkHP >=0)) { 
    negFactorHP=1;
  }
  if ((checkVP <0)) {
    negFactorVP=-1;
  } 
  else if ((checkVP >=0)) { 
    negFactorVP=1;
  }
  int checkZH = int (negFactorH*sqrt(sq(checkH)+sq(checkV)));
  int checkZV = int (negFactorV*sqrt(sq(checkH)+sq(checkV)));
  int checkZHP = int (negFactorHP*sqrt(sq(checkHP)+sq(checkVP)));
  int checkZVP = int (negFactorVP*sqrt(sq(checkHP)+sq(checkVP)));

  //if (key == CODED) 
  //{
  if (eyeHLT<eyeHL)
  {

    eyeHL-= inc; 
    eyeHR-= inc;
    println("EEK - eyeHL = "+eyeHL);
  }

  if (eyeHLT>eyeHL) {

    eyeHL+= inc; 
    eyeHR+= inc;
    println("EEK - eyeHL = "+eyeHL);
  }

  if (eyeVLT<eyeVL)
  {
    eyeVL-=inc; 
    eyeVR-=inc;
    println("EEK - eyeVL = "+eyeVL);
  }

  if (eyeVLT>eyeVL) {
    eyeVL+=inc; 
    eyeVR+=inc;
    println("EEK - eyeVL = "+eyeVL);
  } // end DOWN
  //}// end hey==coded
}// end checkEyePos ()

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

void drawEyes ()
{
  drawHead();
  fill (0, 0, 255);

  ellipse (eyeHL, eyeVL, irisD, irisD);
  ellipse (eyeHR, eyeVR, irisD, irisD);
  fill (0, 0, 0);
  // use these if you want the pupils to move more realistically for 2d rendering
  //ellipse (pupilHR, pupilVR, pupilD, pupilD);
  //ellipse (pupilHL, pupilVL, pupilD, pupilD);
  // use these if you want pupils to move exactly with the iris (less realistic) 
  //ellipse (eyeHL, eyeVL, pupilD, pupilD);
  //ellipse (eyeHR, eyeVR, pupilD, pupilD);
}
void drawMouth ()
{
  fill (mouthColour);
  rect (lipUH, lipUV, lipWidth, lipHeight);
  rect (lipLH, lipLV, lipWidth, lipHeight);
  
  lipUV=lipUVshut;
  lipLV=lipLVshut;
  println ("shut");
  println ("lipUV = "+lipUV);
  println ("lipLVshut= "+lipLVshut);
  //drawEyes();

}
void drawHead () {
  //draw left eye
  background (faceColour);
  fill (eyeColor);
  ellipse (eyeHLinit, eyeVinit, eyeWidth, eyeHeight);
  //draw right eye
  ellipse (eyeHRinit, eyeVinit, eyeWidth, eyeHeight);
  // draw teeth
  for (int i=0; i<teethNum; i++) {
    rect (teethHLinit+(i*teethSpacer), teethVL, teethWidth, teethHeight);
  }
  drawMouth();
}
void updateEyeTargetPosition ()
{
  /*// first check it is not out of limits (that is, must be in Arduino range 0 - 180, the standard servo control range)
   if (gssEyeballUpDown<0)
   {
   gssEyeballUpDown = 0;
   } 
   else if (gssEyeballUpDown>180)
   {
   gssEyeballUpDown=180;
   }
   if (gssEyeballLeftRight<0)
   {
   gssEyeballLeftRight = 0;
   } 
   else if (gssEyeballLeftRight>180)
   {
   gssEyeballLeftRight=180;
   }
   */
  // map 

  // map(gssEyeballLeftRight, 0, 180, eyeHLmin, eyeHLmax);
  // map(gssEyeballUpDown, 0, 180, eyeVLmin, eyeVLmax);
  gssEyeballLeftRight = int (gssEyeballLeftRight);
  gssEyeballUpDown = int (gssEyeballUpDown);
  eyeHLT=gssEyeballLeftRight;
  eyeVLT=gssEyeballUpDown;

  println ("Inside updateEyeTargetPosition.");
  println ("gssEyeballLeftRight = "+gssEyeballLeftRight);
  println ("gssEyeballUpDown = "+gssEyeballUpDown);
  println("-----------");
  println ("eyeHL = "+eyeHL);
  println ("eyeHR = "+eyeHR);
  println ("eyeVL = "+eyeVL);
  println ("eyeVR = "+eyeVR);
  println("-----------");
  println ("eyeHLT = "+eyeHLT);
  println ("eyeHRT = "+eyeHRT);
  println ("eyeVLT = "+eyeVLT);
  println ("eyeVRT = "+eyeVRT);
  println("-----------");
  println ("eyeHLmin = "+eyeHLmin+", , eyeHLmax= " +eyeHLmax);
  println ("eyeVLmin = "+eyeVLmin+", , eyeHLmax= " +eyeVLmax);
}
void jawChomper () {
  lipTimer = millis();


  while ( (millis()- lipTimer) <lipOpenTimer) {
    lipUV=lipUVopen;
    lipLV=lipLVopen;
    drawEyes();

    println ("open");
    println ("lipLV = "+lipLV);
    println ("lipUV = "+lipUV);
    println ("lipLVopen= "+lipLVopen);
  } 

}



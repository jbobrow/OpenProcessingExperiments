
/*

 virtual_twitr_janus
 version2 [11/08/2012] alewis
 
 */

int gssEyeballUpDown=0; // will be used store data to use for eyeball servo
int gssEyeballLeftRight=0; // will be used store data to use for eyeball servo
String gssText="initialised"; // will be used store data to use for eyeball servo
String gssTextCheck = gssText;
int gssTextLength = 0; // initialise text length for reading from Google Spreadsheet
String randomChar = "x";
int eyeVinit = 200;// Vertical common start position
int eyeHLinit = 150;
int eyeHRinit = 450;
// initialise left eye
int eyeHL = eyeHLinit;
int eyeVL = eyeVinit;
int pupilHL = eyeHLinit;
int pupilVL = eyeVinit;
// initialise right eye
int eyeHR = eyeHRinit; 
int eyeVR = eyeVinit;
int pupilHR = eyeHRinit;
int pupilVR = eyeVinit;



int eyeDiameter = 200;
int eyeWidth = eyeDiameter;
int eyeHeight = eyeDiameter;
int inc = 5; //eyeball movement increment
float incPupil = 7;

color eyeColor = color(255, 255, 255);
color textColor = color (255, 255, 255);

int irisD = 90; // define iris size
int pupilD = 30;
/*int hLeftRight = 90; // initialise L-R eyes at rest, centred (will stay same for both eyes as they move together)
 int hUpDown = 120; // initialise U-D eyes at rest, centred (will stay same for both eyes as they move together)
 int hLeftRightLast=120; //initialise check variable for changes L-R
 int hUpDownLast = 90; //initialise check variable for changes U-D*/
int hMin = 0;
int vMin =0;
int hMax = irisD;
int vMax = irisD;



void setup ()
{

  size(600, 600);  
  background (0, 0, 0);
  fill (textColor);
  //noStroke();
  /*text ("gssText = ", 30, 30);
  text (gssText, 85, 30);*/
  drawHead ();

  //
}

void draw ()
{
  moveEyes();
}

void keyPressed() {
  int checkH = eyeHLinit-eyeHL; //calculate if horizontal eye position has reached limit
  int checkV = eyeVinit-eyeVL;
  int checkHP = eyeHLinit-pupilHL; //calculate if horizontal pupil position has reached limit
  int checkVP = eyeVinit-pupilVL;

  int negFactorH=1;
  int negFactorV=1;
  int negFactorHP=1;
  int negFactorVP=1;
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
  println ("checkH = "+checkH); //debug print it
  println ("checkV = "+checkV);
  int checkZH = int (negFactorH*sqrt(sq(checkH)+sq(checkV)));
  int checkZV = int (negFactorV*sqrt(sq(checkH)+sq(checkV)));
  int checkZHP = int (negFactorHP*sqrt(sq(checkHP)+sq(checkVP)));
  int checkZVP = int (negFactorVP*sqrt(sq(checkHP)+sq(checkVP)));

  println ("checkZH = "+checkZH);
  if (key == CODED) 
  {
    if (keyCode == LEFT)
    {

      if (checkZH <(eyeDiameter/4)) {
        println ();
        eyeHL-= inc; 
        eyeHR-= inc;
      }
      if (checkZHP <(eyeDiameter/4+(irisD/4))) {
        println ();
        pupilHL-= incPupil;
        pupilHR-= incPupil;
      }
    } 
    else if (keyCode ==RIGHT)
    {
      if (checkZH >=(-eyeDiameter/4)) {
        println ();
        eyeHL+= inc; 
        eyeHR+= inc;
      }
      if (checkZHP >=(-eyeDiameter/4-(irisD/4))) {
        println ();
        pupilHL += incPupil; 
        pupilHR += incPupil;
      }
    }
    if (keyCode == UP)
    {
      if (checkZV <((eyeDiameter/4))) {
        println ();
        eyeVL-=inc; 
        eyeVR-=inc;
      }

      if (checkZVP <(eyeDiameter/4+(irisD/4))) {
        println ();
        pupilVL-= incPupil; 
        pupilVR -= incPupil;
      }
    }


    else if (keyCode ==DOWN)
    {
      if (checkZV >=(-eyeDiameter/4)) {
        println ();
        eyeVL+=inc; 
        eyeVR+=inc;
      }
      if (checkZVP >=(-eyeDiameter/4-(irisD/4))) {
        println ();
        pupilVL += incPupil; 
        pupilVR += incPupil;
      }
    } // end DOWN
  }// end hey==coded
 
}// end ifKeyPressed()

void moveEyes ()
{
  drawHead();
  fill (0, 0, 255);

  ellipse (eyeHL, eyeVL, irisD, irisD);
  ellipse (eyeHR, eyeVR, irisD, irisD);
  fill (0, 0, 0);
  ellipse (pupilHR, pupilVR, pupilD, pupilD);
  ellipse (pupilHL, pupilVL, pupilD, pupilD);
}
void drawHead () {
  //draw head
  /*fill (255, 250, 205);
   //ellipse (225, 300, 350, 500);
   // draw mouth
   fill ( 255, 0, 0);
   ellipse (225, 400, 200, 60);
   fill (255, 255, 255);
   ellipse (225, 400, 150, 40);
   */
  //draw left eye
  //
  fill (eyeColor);
  ellipse (eyeHLinit, eyeVinit, eyeWidth, eyeHeight);

  //draw right eye
  ellipse (eyeHRinit, eyeVinit, eyeWidth, eyeHeight);
}



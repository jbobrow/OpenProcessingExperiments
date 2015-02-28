
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
int eyeVinit = 325;// Vertical common start position
int eyeHLinit = 300;
int eyeHRinit = 225;
// initialise left eye
int eyeHL = eyeHLinit;
int eyeVL = eyeVinit;
int pupilHL = eyeHLinit;
int pupilHR = eyeHRinit;
int pupilVL = eyeVinit;
int pupilVR = eyeVinit;
float p=1.1;
// initialise right eye
int eyeHR = eyeHRinit; 
int eyeVR = eyeVinit;
int eyeDiameter = 500;
int eyeWidth = eyeDiameter;
int eyeHeight = eyeDiameter;
int inc = 5; //eyeball movement increment
int checkZH=0;
int checkZV=0;
int checkH =0;
int checkV=0;

color eyeColor = color(255, 255, 255);

int irisD = 200; // define iris size
int pupilD=50; //define pupil size
int hLeftRight = 90; // initialise L-R eyes at rest, centred (will stay same for both eyes as they move together)
int hUpDown = 90; // initialise U-D eyes at rest, centred (will stay same for both eyes as they move together)
int hLeftRightLast=90; //initialise check variable for changes L-R
int hUpDownLast = 90; //initialise check variable for changes U-D
int hMin = 0;
int vMin =0;
int hMax = 180;
int vMax = 180;



void setup ()
{

  size(600, 600);  
  background (0, 0, 18);
  fill (255,255, 255);
  //noStroke();
  text ("gssText = ", 30, 30);
  text (gssText, 85, 30);
  drawHead ();

  //
}

void draw ()
{
  moveEyes();
}

void keyPressed() {
  checkH = eyeHLinit-eyeHL; //calculate if horizontal eye position has reached limit
  int checkV = eyeVinit-eyeVL;
  int negFactorH=1;
  int negFactorV=1;
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
  println ("checkH = "+checkH); //debug print it
  println ("checkV = "+checkV);
  checkZH = int (negFactorH*sqrt(sq(checkH)+sq(checkV)));
  checkZV = int (negFactorV*sqrt(sq(checkH)+sq(checkV)));
  println ("checkZH = "+checkZH);
  if (key == CODED) 
  {
    if (keyCode == LEFT)
    {

      if (checkZH <(eyeDiameter/4)) {
        println ();
        eyeHL-= inc; 
        eyeHR-= inc;
        pupilHL-= negFactorH*p*inc; 
        pupilHR-= negFactorH*p*inc; 
      }
    } 
    else if (keyCode ==RIGHT)
    {
      if (checkZH >=(-eyeDiameter/4)) {
        println ();
        eyeHL+=inc; 
        eyeHR+=inc;
        pupilHL+=negFactorH*inc*p; 
        pupilHR+=negFactorH*inc*p; 
      }
    }
    if (keyCode == UP)
    {

      if (checkZV <((eyeDiameter/4))) {
        println ();
        eyeVL-=inc; 
        eyeVR-=inc;
        pupilVL-= negFactorV*p*inc;  
        pupilVR-= negFactorV*p*inc; 
      }
    } 
    else if (keyCode ==DOWN)
    {
      if (checkZV >=(-eyeDiameter/4)) {
        println ();
        eyeVL+=inc; 
        eyeVR+=inc;
        pupilVL+= negFactorV*p*inc;  
        pupilVR+= negFactorV*p*inc; 
      }
    }
  }
}

void moveEyes ()
{
  drawHead();
  fill (0, 0, 255);

  ellipse (eyeHL, eyeVL, irisD, irisD);
  fill (0,0,0);
  ellipse (pupilHL, pupilVL, pupilD,pupilD);
  //ellipse (eyeHR, eyeVR, irisD, irisD);
}
void drawHead () {
  //draw head
  
  /*
  fill (255, 250, 205);
  ellipse (eyeHLinit, eyeVinit, 550, 400);
  // draw mouth
  fill ( 255, 0, 0);
  ellipse (225, 400, 200, 60);
  fill (255, 255, 255);
  ellipse (225, 400, 150, 40);*/
  //draw left eye
  //
  fill (eyeColor);
  ellipse (eyeHLinit, eyeVinit, eyeWidth, eyeHeight);
  //draw right eye
  //ellipse (eyeHRinit, eyeVinit, eyeWidth, eyeHeight);
}




//April 6th

PFont fontA;
PFont fontB;
PFont fontC;
PFont fontD;
PFont fontE;
String mo1;
String mos1;
String mos2;
String d1;
String ds1;
String ds2;
String h1;
String hs1;
String hs2;
String m1;
String ms1;
String ms2;
String s1;
String ss1;
String ss2;
int lastS;
int yposS2 = 0;
int yposS3 = 0;
int[] days = new int[12];
int[] daysS = new int[12];
boolean secondChange = false;
boolean change = false;
boolean launched = false;
boolean released = false;

void setup()
{
  size(400, 90);
  fontA=loadFont("CourierNewPSMT-40.vlw");
  fontB=loadFont("Courier-16.vlw");
  fontC=loadFont("Courier-40.vlw");
  fontD=loadFont("TimesNewRomanPSMT-20.vlw");
  fontE=loadFont("TimesNewRomanPSMT-40.vlw");
  initDays();
  smooth();
}

void draw()
{
  if(launched == false)
  {
    timeChange();
    frame();
    getTime();
    timeStrings();
    displayTime();
    displayMask();
    stroke(0);
    strokeWeight(1);
    line(40, 86, 340, 86);
    stroke(150);
    line(42, 87, 342, 87);
    fill(0);
    textFont(fontD, 20);
    drawText2("Time Remaining Until Book Release", 45, 85);
  } 
  else {
    bookLaunched();
  }
}

void mouseReleased()
{
  released = true;
}



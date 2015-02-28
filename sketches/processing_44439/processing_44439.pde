

//The control of this tool is done through the use of the controlP5 library
import controlP5.*;  //Call the controlP5 library
import processing.dxf.*;



ControlP5 controlP5;

//Start by declaring datatypes for the individual SVG files used
PShape StandingMan;
PShape FlexedArm;
PShape ReachArm;

//Declare the knob for control
int knobValue = 100;
Knob myKnobA;
int knobX=50;
int knobY=400;
int knobDia=90;
float scalingFactorStand=1;//this variable is for testing the scaling
float scalingFactorReachArm=1;//this variable is for testing the scaling
float scalingFactorFlexedArm=1;//this variable is for testing the scaling

int standingManX, standingManY;
float humanHeight=43;
float reachRadius=16;
float shoulderHeight=34.1;
float highReach=46.6;
float eyeHeight=39.1;
float highCounter=26.1;
float elbowHeight=25.5;
float lowerCounter=22.5;

int [][] csv;
float [][] measurements;

int textX=30;
int textY=600;
int textSpacing=20;

boolean record;


void setup() { 
  size(700, 800);
  standingManX=width-125;
  standingManY=height;
  smooth();

  //LOAD IN SVG IMAGES
  StandingMan = loadShape("StandingMan.svg");
  FlexedArm = loadShape("FlexedArm.svg");
  ReachArm = loadShape("ReachArm.svg");

  //CREATE CONTROL KNOB


  controlP5 = new ControlP5(this);
  //SET CONTROLP5 COLORS

  controlP5.setColorForeground(0);
  controlP5.setColorBackground(0xff660000);
  controlP5.setColorLabel(0xffdddddd);
  controlP5.setColorValue(0xffff88ff);
  controlP5.setColorActive(0xffff0000);

  myKnobA = controlP5.addKnob("knob", 0, 360, 0, knobX, knobY, knobDia);
  smooth();

  //BRING IN CSV FILE OF MEASUREMENTS
  String lines[] = loadStrings("measurements.csv");
  String [][] csv;
  int csvWidth=0;

  //CALCULATE MAX WIDTH OF CSV
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
      //      println(csvWidth);
      //      println(lines.length);
    }
  }
  //CREATE A MEASUREMENT ARRAY BASED ON # OF ROWS AND COLOUMNS OF THE CSV
  measurements = new float [lines.length][csvWidth];

  //PARSE THE VALUES INTO A 2D ARRAY
  for (int i=0; i < lines.length; i++) {
    float [] temp = new float [lines.length];
    temp= float(split(lines[i], ','));
    for (int j=0; j < temp.length; j++) {
      measurements[i][j]=temp[j];
    }
  }
} 

void knob(int knobValue) 
{
  int index= int(map(knobValue, 0, 360, 1, 36));
  humanHeight= measurements[index][1];
  reachRadius = measurements[index][2];
  shoulderHeight=measurements[index][3];
  highReach=measurements[index][4];
  eyeHeight=measurements[index][5];
  highCounter=measurements[index][6];
  elbowHeight=measurements[index][7];
  lowerCounter=measurements[index][8];



  scalingFactorStand = map(knobValue, 0, 360, 1, 1.81395349);
  scalingFactorReachArm = map(knobValue, 0, 360, 1, 1.79375);
  scalingFactorFlexedArm = map(knobValue, 0, 360, 1, 1.88856305);
}

void draw() {
  smooth();
  background(170, 36, 24);
  fill(255);
  //READ OUT THE MAEASUREMENTS
  text("The Standing Height is " + humanHeight +" inches", textX, textY);
  text("The Reach Radius is " + reachRadius +" inches", textX, textY+textSpacing);
  text("The Shoulder Height is " + shoulderHeight +" inches", textX, textY+textSpacing*2);
  text("The High Reach Height is " + highReach +" inches", textX, textY+textSpacing*3);
  text("The Eye Height is " + eyeHeight +" inches", textX, textY+textSpacing*4);
  text("The High Counter Height is " + highCounter +" inches", textX, textY+textSpacing*5);
  text("The Elbow Height is " + elbowHeight +" inches", textX, textY+textSpacing*6);
  text("The Lower Counter Height is " + lowerCounter +" inches", textX, textY+textSpacing*7);


  //PLACE THE ARTWORK
  shapeMode(CENTER);
  rectMode(CENTER);
  //PLACE THE REACHING ARM
  shape(ReachArm, standingManX, standingManY, ReachArm.width * scalingFactorStand, ReachArm.height * scalingFactorStand);
  //ADD DIMENSION VALUES
  //  rect(standingManX-163*scalingFactorStand,standingManY-209* scalingFactorStand,30,12);
  fill(0);
  text(nf(highReach, 2, 1), standingManX-177*scalingFactorStand, standingManY-205* scalingFactorStand);
  text(nf(reachRadius, 2, 1), standingManX-125*scalingFactorStand, standingManY-375* scalingFactorStand);
  //PLACE THE STANDINGMAN
  shape(StandingMan, standingManX, standingManY, StandingMan.width * scalingFactorStand, StandingMan.height * scalingFactorStand);
  text(nf(humanHeight, 2, 1), standingManX+50*scalingFactorStand, standingManY-200* scalingFactorStand);
  text(nf(eyeHeight, 2, 1), standingManX-125*scalingFactorStand, standingManY-327* scalingFactorStand);
  text(nf(highCounter, 2, 1), standingManX-85*scalingFactorStand, standingManY-120* scalingFactorStand);  
  //PLACE THE FLEXED ARM
  shape(FlexedArm, standingManX, standingManY, FlexedArm.width * scalingFactorStand, ReachArm.height * scalingFactorStand);
  text(nf(shoulderHeight, 2, 1), standingManX-110*scalingFactorStand, standingManY-290* scalingFactorStand);  
  text(nf(elbowHeight, 2, 1), standingManX-87*scalingFactorStand, standingManY-160* scalingFactorStand);
  
  if (record) {
    beginRaw(DXF, "output.dxf");
  }

  // do all your drawing here

  if (record) {
    endRaw();
    record = false;
  }
}
  void keyPressed() {
    // use a key press so that it doesn't make a million files
    if (key == 'r') record = true;
  }





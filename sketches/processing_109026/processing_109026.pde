
// Software Prototype for IMD09119 Responsive Environments
// **** The Weather Stairs by Karl Nair 10013152 ****


// declare variables

int numSteps; // number of steps
int[] step;  // array to hold the states of the steps (0, 1, 2, 3)
String[] stepString; // array to hold a string version of the state
String[] rewardString; // array to hold the winning strings to trigger  
                       // the reward animation       
int playReward; // this number indicates which reward animation to play

PImage[] icon; // make an array to hold the icons for the cryptogram
PImage icoRain; // make an image object
PImage icoSnow;
PImage icoSun;

PImage[] rwrd; //
PImage rwrdBlack;
PImage rwrdRain;
PImage rwrdSnow;
PImage rwrdSun;

PImage protoBg;

boolean rewardOn;


void setup() {
  size(800, 600);
  frameRate(2);
  textSize(50);
  
  numSteps = 8;
  step = new int[numSteps]; // initialise array  
    for(int i = 0; i < numSteps; i++) { // go through steps in array
     step[i] = 0; // set step to state "0" (empty)
     println(step[i]);
    } // end for 
  
  stepString = new String[numSteps];
    for(int i = 0; i < numSteps; i++) { // go through steps in array
      stepString[i] = str(step[i]); // set step to state "0" (empty)
    } // end for 
 
  rewardString = new String[3]; // these are the reward patterns
    rewardString[0] = "->101";  // currently set to bottom three steps
    rewardString[1] = "->123"; 
    rewardString[2] = "->010";
    
  icoBlack = loadImage("protoBlack.png"); 
  icoRain = loadImage("protoRain.png");
  icoSnow = loadImage("protoSflake.png");
  icoSun = loadImage("protoSun.png");  
  
  icon = new PImage[4];
  icon[0] = icoBlack;
  icon[1] = icoRain;
  icon[2] = icoSnow;
  icon[3] = icoSun;

  
  rwrdRain = loadImage("protoRwrdRain.png");
  rwrdSnow = loadImage("protoRwrdSnow.png");
  rwrdSun = loadImage("protoRwrdSun.png");
  rwrdBlack = loadImage("protoRwrdBlack.png");
  
  rwrd = new PImage[4];
  rwrd[0]  = rwrdRain;
  rwrd[1]  = rwrdSnow;
  rwrd[2]  = rwrdSun;  
  rwrd[3] = rwrdBlack;
  
  protoBg = loadImage("protoBg.png");
  
  rewardOn = false;
  
} // end setup


void draw() {  // this is the main program loop
  
  background(protoBg);
  
  drawSteps();
  makeString();  
  convertToCryptogram(); 
  upDateSteps();
  playVisReward();
 
} // end draw


void drawSteps() { // this method draws a representation of the steps for the UI
  int stepX = 50;
  int stepY = 50; 
    for(int i = numSteps; i > 0; i--) {
      int j = (50 * step[i]);
      int k;
      fill(0);
      rect(stepX, stepY, 150, 30); // draw step background
      fill(255);
      rect(stepX, stepY, 0 + j, 30); // draw step state
      noFill();
        k = (j - 20); // only draw person marker if there's actually someone there
        if (k > 0) {
          ellipse(stepX  + (j - 20), stepY + 15, 40, 20);
        } // end if
        stepY = (stepY + 40);
    } // end for 

} // end drawSteps

void makeString() {
  String tmpString = "->";
  for(int i = 0; i < 3; i++) {
    stepString[i] = str(step[i]);
    tmpString = tmpString + str(stepString[i]);
  } // end for  

    println(tmpString);
    checkForWin(tmpString);
  
} // end makeString

void checkForWin(String tmpString) { 
      text(tmpString, 400, 300);
  for(int i = 0; i < 3; i++) {
    if(rewardString[i].equals(tmpString)) {
      playReward = i; rewardOn = true; text("Pattern Found! Pattern: " + i, 200, 200);
    } // end if   
  } // end for  
} // end checkForWin

void convertToCryptogram() {
  int iconX = 80;
  int offset;  
    for(int i = 0; i < numSteps; i++) {
      image(icon[0], iconX + offset, 450);
      image(icon[step[i]], iconX + offset, 450);
      offset  = offset + 80;    
    } // end for   
  
} // end convertToCryptogram

void upDateSteps() {
   for(int i = numSteps; i > 0; i--) {
     step[i] = step[i - 1]; // set the step state to the previous steps state
                           // this simulates people moving up a step each time 
                           // sample
     step[0] = int(random(0,4)); //sets the bottom step to a random state
   } // end for     
} // end upDateSteps

void playVisReward() {
  if(rewardOn == true) {
    image(rwrd[playReward], 0, 0);
  } // end if
  rewardOn = false;
} //  end playVisReward



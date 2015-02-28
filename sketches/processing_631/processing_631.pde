
//  FizzyNumberMusicMaker by Daniel Piker 13/11/08 - spacesymmetrystructure.wordpress.com
//  Have fun. Please let me know about any cool variations or developments you make
//  danielpiker at yahoo dot co dot uk

import rwmidi.*;
MidiOutput output;

int CellSize = 8;
int CellsAcross = 60;
int CellsDown = 60;
int BrushSize = 2;
int BrushStrength = 35;
int Sounder1position = 1230;
int Sounder2position = 2430;
boolean soundwhite = true;
boolean soundblack = false;
int Calm = 40;        // The higher this is, the longer it seems to take to turn 'fizzy'

float[] CellVal = new float[CellsAcross*CellsDown]; int CellIndex = 0;

void setup() {

  size(480,480);
  //I just set fixed values because it helps with export
  //its much better to replace it with:
  //size(CellsAcross * CellSize, CellsDown * CellSize);
  
  colorMode(HSB, 100);  // try switching this to RGB for a different look
  noStroke();
    MidiOutputDevice devices[] = RWMidi.getOutputDevices();
    output = RWMidi.getOutputDevices()[0].createOutput();
}

void draw() {
  for (int i = 0; i < CellsAcross; i++) {
    for (int j = 0; j < CellsDown; j++) {
      
      CellIndex = (CellIndex+1)%(CellsAcross*CellsDown);
      
int      klimp  = round(((CellVal[CellIndex])*3)%100);       
  
   drawCell(i, j, klimp);  
   	
  if (CellIndex == Sounder1position) { 	
  if (soundwhite == true){
  fill(0,0,0);
  ellipse(i*CellSize, j*CellSize, CellSize*2, CellSize*2);
  fill(0,0,100);
  ellipse(i*CellSize, j*CellSize, CellSize*1.5, CellSize*1.5);
  outputCell(klimp,0);
}}

  if (CellIndex == Sounder2position) { 
  if (soundblack == true){
  fill(0,0,100);
  ellipse(i*CellSize, j*CellSize, CellSize*2, CellSize*2);
  fill(0,0,0);
  ellipse(i*CellSize, j*CellSize, CellSize*1.5, CellSize*1.5);
  outputCell(klimp,1);
}}
   
int   below      = (CellIndex+1)%(CellsAcross*CellsDown);
int   above      = (CellIndex+(CellsAcross*CellsDown)-1)%(CellsAcross*CellsDown);
int   left       = (CellIndex+(CellsAcross*CellsDown)-CellsDown)%(CellsAcross*CellsDown);
int   right      = (CellIndex+CellsDown)%(CellsAcross*CellsDown);
int   aboveright = ((CellIndex-1) + CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   aboveleft  = ((CellIndex-1) - CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   belowright = ((CellIndex+1) + CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   belowleft  = ((CellIndex+1) - CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);

// These next 2 lines are the real heart of this sketch.
// By messing around with different factors and functions here, you can get wildly different results

float  NeighbourMix       =    pow((CellVal[left]*CellVal[right]*CellVal[above]*CellVal[below]*CellVal[belowleft]*CellVal[belowright]*CellVal[aboveleft]*CellVal[aboveright]),0.125);
       CellVal[CellIndex] = ((((sqrt(1*CellVal[CellIndex]))*(sqrt(NeighbourMix*1)))/1)+0.5)%Calm; 
   
    }
  }
}

   void drawCell(int x, int y, int klimpyness) { 
    fill(klimpyness,100,100);
    rect(x*CellSize, y*CellSize, CellSize, CellSize);  
}

void mouseDragged() {
    
if (mouseButton == LEFT) {
  for (int i = 1-BrushSize; i < BrushSize; i++) {
    for (int j = 1-BrushSize; j < BrushSize; j++) {
      drawCell(mouseX / CellSize + i, mouseY / CellSize + j, 100);
      CellVal[getCellIndex (mouseX/CellSize + i,mouseY/CellSize + j)]   =  100; 
  }}}
  
else if (mouseButton == RIGHT) { 
  
if (key == 'z' || key == 'Z') {
  Sounder1position = getCellIndex (mouseX/CellSize,mouseY/CellSize);     
}

else if (key == 'x' || key == 'X') {
  Sounder2position = getCellIndex (mouseX/CellSize,mouseY/CellSize);     
 }}}
 
 void mouseClicked() {
 if (mouseButton == RIGHT) { 
  
if (key == 'z' || key == 'Z') {
  Sounder1position = getCellIndex (mouseX/CellSize,mouseY/CellSize);     
}

else if (key == 'x' || key == 'X') {
  Sounder2position = getCellIndex (mouseX/CellSize,mouseY/CellSize);     
 }}
 }
 
 void keyPressed(){
if (key == 'a' || key == 'A') {
  if (soundwhite == false)
  soundwhite = true;   
 else if (soundwhite == true)
  soundwhite = false;  
}

if (key == 's' || key == 'S') {
  if (soundblack == false)
  soundblack = true;
 else if (soundblack == true)
  soundblack = false;  
}

if (key == CODED) {
    if (keyCode == UP) {
      Calm = constrain((Calm+1),1,800);
    } else if (keyCode == DOWN) {
      Calm = constrain((Calm-1),1,800);
    } 
  }
}

  public int getCellIndex(int x, int y) {
  return abs(constrain(((x%CellsAcross) * CellsDown + (y%CellsDown)),0,(CellsAcross*CellsDown)));
}

void outputCell(int note, int channel) {
  output.sendNoteOn(channel, note/2+30, 100);  //the bit that makes the noises
}




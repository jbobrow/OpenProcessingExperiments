
/*
Guitar Tuner app
C.Mahoney
*/

import ddf.minim.*; //must load library first
Minim minim;
AudioPlayer [] pitch = new AudioPlayer[6];// an array for the sound
boolean [] toneSelect = new boolean[6]; 
String [] nameString = new String[6]; //an array of string names
int circX = 50;
int circY = 200;
int circRad = 20;
int circSpacing = 50;
int pitchSelect;
int onFill=255;
int tS; // tone selector


void setup()
{
  size(350,300);
  minim = new Minim(this);
  //array of pitch waveforms----------
  pitch[5] = minim.loadFile("E1saw_329.63Hz_-3dBFS_10s.wav", 2048); // array for guit string pitches
  pitch[4] = minim.loadFile("B2saw_246.9Hz_-3dBFS_10s.wav", 2048);
  pitch[3] = minim.loadFile("G3saw_196.0Hz_-3dBFS_10s.wav", 2048);
  pitch[2] = minim.loadFile("D4saw_146.8Hz_-3dBFS_10s.wav", 2048);
  pitch[1] = minim.loadFile("A5saw_110.0Hz_-3dBFS_10s.wav", 2048);
  pitch[0] = minim.loadFile("E6saw_82.4Hz_-3dBFS_10s.wav", 2048); 
  //array of string names--------------
  nameString[0] = "E";
  nameString[1] = "A";
  nameString[2] = "D";
  nameString[3] = "G";
  nameString[4] = "B";
  nameString[5] = "E";
  //----------------------------------
  for (tS = 0; tS<6;tS++)
  {
    toneSelect[tS] = false;
  }
  smooth();
  ellipseMode(RADIUS);
}

void draw()
{
  background(0);       //black background
  stroke(125);
  strokeWeight(15);
  noFill();
  rect(0,0,350,300);
  stroke(0,255,0);     //line color - old school o'scope
  strokeWeight(3);     //line thickness
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  for (int i = 0; i < pitch[pitchSelect].bufferSize() - 1; i++)
  {
    line(i, 100 - pitch[pitchSelect].left.get(i)*50, i+1, 100 - pitch[pitchSelect].left.get(i+1)*50);
    //line(i, OFFSET - pitch[pitchSelect].left.get(i)*AMPLITUDE, i+1, OFFSET - pitch[pitchSelect].left.get(i+1)*AMPLITUDE);
 }
  // draw the buttons------------------------------
  for (tS = 0; tS < 6; tS++)
  {
    if(toneSelect[tS] && pitch[tS].isPlaying())// if selected AND it's playing, then GREEN, else RED
    {
    noStroke();
    fill(0,255,0);
    }else{
      noStroke();
      fill(255,0,0);
    }
    ellipse(circX + tS * circSpacing, circY, circRad, circRad);
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text(nameString[tS], circX+tS*circSpacing,circY+8);
    }
  //---------------------------------------------
    fill(255);
    text("click anywhere to stop tones", width/2, height-height/10);
    textSize(10);
    text("C.Mahoney, 2012", width/2,height-height/20);
} //end of DRAW

void mousePressed()//scan six buttons
{
  for (tS = 0; tS<6;tS++)// pause ALL sounds
  {
    toneSelect[tS] = false;// boolean for color change
    pitch[tS].pause();//pause ALL sounds
  }
 for (tS=0;tS < 6; tS++)// determine which button was pressed
 {
  if (dist(circX + tS * circSpacing,circY,mouseX, mouseY) < circRad)
  {
    pitchSelect=tS;
    toneSelect[tS]=true;
    pitch[pitchSelect].play(0);//plays the sound
    fill(255,0,0);
  } 
 }
}// end of void mousePressed

void stop()// always close Minim audio classes when you are done with them
{
  for(int s=0; s < 6;s++)// CLOSE all sound files
  {
    pitch[s].close();
  }
  minim.stop();
  super.stop();
}


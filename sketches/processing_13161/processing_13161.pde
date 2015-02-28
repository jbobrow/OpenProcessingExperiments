
// based on Stream Chaser By Ivan Burghart
// http://www.openprocessing.org/visuals/?visualID=6268
// wrestled into VJ compatible MIDI form by Jay Silence

// In this program a several series of points chase each other around. 
// A points direction of motion is affected by the next point in the line and 
// by the same numbered point in the next line. 
// The references loop around so that the last point is chasing the first and 
// the last line of points is influenced by the first.
// 

import processing.opengl.*;
import themidibus.*;

// MIDI bus for parameter input via Akai LPD8
MidiBus myBus; 
int initialize=0;    // flag whether initialization should be done (input via pad)
boolean debug=false; // verbose output on STDOUT?

int numPoints    = 200;
int numLines     = 50;
float LineRatio  = .14;   // the amout of influence the same numbered point in the next line has compared to the next point in line
float speed      = 5;     //uh... the speed of the points
float Amplitude  = 0.1;   // apmlitude of the swimming
float deltaPhase = 0.044; // frequency of the swimming
float CenterRatio= .01; //how much influenc the Center has on direction of the points in Center attract mode
int numWaves     = 3;   // All points swim towards their direction of travel. This is the number of oscilations in the whole line. 
int fadeRate     = 50;  //how long are the trailers, how quickly the screen is cleared
int DisplayStep  = 5;   // draw every Xth point. Drawing fewer points makes it go faster and lets you see the dynamics more clearly.
int NumColors    = 50;
boolean MouseLeadOn   = false;
boolean CenterAttract = false;
boolean Trails        = false;  // ToDo: Trail-Länge als Parameter per t und T

PVector[][] position  = new PVector[numLines][numPoints];
float[][] direction   = new float[numLines][numPoints];
float Phase           = 0; //constant changing variable for angle change wave

void setup() 
{
  if(!online) {
    // push it to the second monitor but not when run as applet
    size (1024,768, OPENGL);
    frame.setLocation(-1024,0);
    if (debug) MidiBus.list(); // List all available Midi devices on STDOUT.  
    // Create a new MidiBus with Akai input device and no output device.
    myBus = new MidiBus(this, "LPD8", -1); 
  } else {
    size (400,300, OPENGL);
  }
  
  smooth();  
  initializePositions(2);
}

// this is needed for fullscreen display on the second monitor
public void init() {  
  if(!online) {
    frame.removeNotify();
    frame.setUndecorated(true); 
    frame.setAlwaysOnTop(true); 
  }
  // call PApplet.init() to take care of business  
  super.init();  
}  


void draw()
{
  noCursor();
  // fade background trailers
  fill(0, fadeRate);
  noStroke();
  rect(0,0,width, height);

  if(Trails) {
    background(0); // clear background no trailers
  }
  
  // This is not handled in noteOff(), because then the program crashes
  switch(initialize){
    case 1:
    initializePositions(1);
    initialize = 0;
    break;
    case 2:
    initializePositions(2);
    initialize = 0;
    break;
    case 3:
    initializePositions(3);
    initialize = 0;
    break;
    case 4:
    initializePositions(0);
    initialize = 0;
    default:  // initialize = 0
    break;
  }
  
  Phase=(Phase+deltaPhase)%TWO_PI; //iterate phase
  calcPositions();
}

void calcPositions()  // Engine
{
  float xdist,ydist;
  float lxdist,lydist;
  float mxdist=0,mydist=0;
  float cxdist=0,cydist=0;
  float DX,DY;
  colorMode(HSB,numPoints,100,100);
  float Hue; 
  for (int j=0;j<numLines;j++){
    for (int i=0; i<numPoints-((MouseLeadOn)?1:0); i++){   //skip the last points if in mouse lead mode
      
      //calculate the distances from each point to the next 
      //and from each point to the same numbered point in the next line 
      xdist=position[j][i].x - position[j][(i+1)%numPoints].x;//forward
      ydist=position[j][i].y - position[j][(i+1)%numPoints].y;      
      lxdist=position[j][i].x - position[(j+1)%numLines][i].x;//sideways
      lydist=position[j][i].y - position[(j+1)%numLines][i].y;
      if (CenterAttract){
         cxdist=position[j][i].x - width/2;//Centerways
         cydist=position[j][i].y - height/2;
      }
      // add the ratio weighted distances together 
      DX=(1-LineRatio)*xdist+LineRatio*lxdist;
      DY=(1-LineRatio)*ydist+LineRatio*lydist; 
      
      if (CenterAttract){
        DX=(1-CenterRatio)*DX+CenterRatio*cxdist;
        DY=(1-CenterRatio)*DY+CenterRatio*cydist;      
      }        
     // use atan to get an angle, apply a sin wave to the angle to make the particle swim.
      direction[j][i]= atan2(DY,DX) + Amplitude*sin(((i*TWO_PI*numWaves)/numPoints)+Phase); 
    }
  }
  if (MouseLeadOn){ // if in mouse lead mode, the last points in the lines chase the mouse rather than chasing the first points
    for (int j=0;j<numLines;j++){
      xdist=position[j][numPoints-1].x - mouseX;
      ydist=position[j][numPoints-1].y - mouseY;      
      lxdist=position[j][numPoints-1].x - position[(j+1)%numLines][numPoints-1].x;//sideways
      lydist=position[j][numPoints-1].y - position[(j+1)%numLines][numPoints-1].y;
      DX=(1-LineRatio)*xdist+LineRatio*lxdist;
      DY=(1-LineRatio)*ydist+LineRatio*lydist; 
      direction[j][numPoints-1]= atan2(DY,DX) + Amplitude*sin(TWO_PI*numWaves+Phase);
    } 
  }
  
  for (int j=0;j<numLines;j++){
    for (int i=0; i<numPoints; i++){ // move each point towards the next
      DX=position[j][i].x-cos(direction[j][i])*speed;
      DY=position[j][i].y-sin(direction[j][i])*speed;
      position[j][i].set(DX,DY,0);
                                  // Draw the particles
      Hue = int(numPoints/NumColors)*int(NumColors*i/numPoints);
      Hue = (Hue+j)%numPoints;
      stroke(Hue,100,100);
      point(position[j][i].x, position[j][i].y);
    }    
  }

}

// Handle keyboard input
void keyPressed()
{
  switch(key){
    case 'W':
    numWaves=constrain (numWaves+1,1,20);
    println("numWaves: " + numWaves);
    break;
    case 'w':
    numWaves=constrain (numWaves-1,1,20);
    println("numWaves: " + numWaves);
    break;   
    case 'A':
    Amplitude=constrain (Amplitude+0.05, 0, 1);
    println("Amplitude: " + Amplitude);
    break;
    case 'a':
    Amplitude=constrain (Amplitude-0.05, 0, 1);
    println("Amplitude: " + Amplitude);
    break;   
    case 'S':
    speed=constrain (speed+0.5, 0, 20);
    println("Speed: " + speed);
    break;
    case 's':
    speed=constrain (speed-0.5, 0, 20);
    println("Speed: " + speed);
    break;   
    case 'F':
    deltaPhase=constrain (deltaPhase+0.02, 0, 0.5);
    println("Frequency: " + deltaPhase);
    break;
    case 'f':
    deltaPhase=constrain (deltaPhase-0.02, 0, 0.5);
    println("Frequency: " + deltaPhase);
    break;   
    case 'L':
    LineRatio=constrain (LineRatio+0.05, 0, 1);
    println("LineRatio: " + LineRatio);
    break;
    case 'l':
    LineRatio=constrain (LineRatio-0.05, 0, 1);
    println("LineRatio: " + LineRatio);
    break;   
    
    case 'c':
    CenterAttract=!CenterAttract;
    break;
    case 'm':
    MouseLeadOn=!MouseLeadOn;
    break;
    case 't':
    Trails=!Trails;
    break;
    case '1':
    initializePositions(1);
    break;    
    case '2':
    initializePositions(2);
    break;
    case '3':
    initializePositions(3);
    break;
    case '4':
    initializePositions(0);
    break;
    default:
    break;    
  
  }
//  background(0);
}

void initializePositions(int InitializeMode){
  background (0);
  Phase=0;
  int radius=130;  

  switch(InitializeMode) {
    case 0:
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++) {// fill position array with random values
            position[j][i]=new PVector( random(40,width-40), random(40,height-40) ); 
          }
        }
    break;
    case 1:
        radius=radius +50;
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++){ // fill position array with evenly spaced points around a circle
            position[j][i]=new PVector(width/2+cos(j*PI/numLines+i*TWO_PI/numPoints)*radius*1.5,height/2+sin(j*PI/numLines+i*TWO_PI/numPoints)*radius );
          }
        }
    break;
    case 2:
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++) {
            position[j][i]=new PVector(width/2+cos(i*TWO_PI/numPoints)*(radius+j*5),height/2+sin(i*TWO_PI/numPoints)*(radius+j*5) );
          }
        }
    break;
    default:    
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++) {
            position[j][i]=new PVector(width/2+cos(i*TWO_PI/numPoints)*(radius+j*5),height/2+sin(i*-2*TWO_PI/numPoints)*(radius+j*5) );
          }
        }
    }
}

// MIDI Event handling
void noteOn(int channel, int pad, int velocity) {
  // Receive a noteOn
  if(debug) {
    print("Note On - ");
    print("Channel "+channel);
    print(" - Pad "+pad);
    println(" - Value: "+velocity);
  }
  switch(pad){
    case 0:
    initialize = 1; 
    break;    
    case 1:
    initialize = 2;
    break;
    case 2:
    initialize = 3;
    break;
    case 3:
    initialize = 4;
    break;
    case 4:
    CenterAttract=!CenterAttract;
 //   println("CenterAttract "+CenterAttract);
    break;
    case 5:
    MouseLeadOn=!MouseLeadOn;
    break;
    case 6:
    Trails=!Trails;
    break;
    default:
    break;    
  }
}


// Right now we are doing nothing on pad release events
void noteOff(int channel, int pad, int velocity) {
	// Receive a noteOff
  if(debug) {
    print("Note Off - ");
    print(" Channel "+channel);
    print(" - Pad "+pad);
    println(" - Value "+velocity);
  }
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  if(debug) {
    print("Controller Change - ");
    print("Channel "+channel);
    print(" - Number "+number);
    println(" - Value "+value);
  }
  
  switch(number){
    case 32:  // = K1
    numWaves= floor( map(value, 0,127, 0,10));  // 10 Waves are enough
    println("numWaves: " + numWaves);
    break;
    case 33: // = K2
    Amplitude= map(value, 0,127, 0,0.4);
    println("Amplitude: " + Amplitude);
    break;   
    case 34: // = K3
    speed= map(value, 0,127, 0,20);
    println("speed: " + speed);
    break;   
    case 35: // = K4
    deltaPhase= map(value, 0,127, 0,0.2);
    println("deltaPhase: " + deltaPhase);
    break;   
    case 36: // = K5
    LineRatio= map(value, 0,127, 0,1);
    println("LineRatio: " + LineRatio);
    break;   
    default:
    break;    
  }  
}



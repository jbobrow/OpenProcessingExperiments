
/**
 * FFT Beat Detection for Processing
 *     by Corey H. Walsh
 *     using the Minim processing library
 *
 *   This sketch combines uses a long term average, a short term average
 * and the summation of the delta between those two to detect beats in music.
 * An FFT splits apart the frequency bands, from that the desired band
 * is isolated and processed. The short term average is compared to the 
 * long term average, the the use of a threshold to detect beats. A multiplier
 * is calculated based on the overall volume, and the summation of the delta
 * between the two averages over a relatively long period of time. This adjusts
 * for the different styles of music that require different thresholds.
 *
 *   You can contact me at coreyhwalsh@gmail.com
 */

import processing.opengl.*;                                    //Import a bunch of libraries
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import processing.serial.*;

static final int ENABLE_ACCURATE_2D         =  6;


Minim minim;
AudioInput in;
FFT fft;
PFont font;
PFont Helvetica;
PFont Tahoma;
PFont Kalinga;
PFont Khmer;
PFont Courier;


int colorChooser = 0;                                          //initilizes a bunch of variables
int redChooser = int(random(255));
int greenChooser = int(random(255));
int blueChooser = int(random(255));
int redBackground = 0;
int greenBackground = 0;
int blueBackground = 0;
int redBackground2 = 0;
int greenBackground2 = 0;
int blueBackground2 = 0;
float amp;
float barHeight;

int RED, GREEN, BLUE;
int k;

int longTermAverageSamples = 60;    //gets average volume over a period of time
int shortTermAverageSamples = 1;    //average volume over a shorter "instantanious" time
int deltaArraySamples = 300;        //number of energy deltas between long & short average to sum together
int beatAverageSamples = 100;
int beatCounterArraySamples = 400;
int maxTime = 200;
float predictiveInfluenceConstant = .1;
float predictiveInfluence;
int cyclePerBeatIntensity;

int beatBands = 30;                  //Number of bands to montiter, higher for more accuracy, lower for speed
float lowFreqCutoff = 30;

float[][] deltaArray = new float[deltaArraySamples][beatBands];
float[][] shortAverageArray = new float[shortTermAverageSamples][beatBands];
float[][] longAverageArray = new float[longTermAverageSamples/shortTermAverageSamples][beatBands];
float[] globalAverageArray = new float[longTermAverageSamples];
int[] beatCounterArray = new int[beatCounterArraySamples];
int[] beatSpread = new int[maxTime];
int beatCounterPosition = 0;
int beatCounterPosition2 = 0;
int cyclesPerBeat;

int longPosition = 0;
int shortPosition = 0;
int deltaPosition = 0;

int[] count = new int[beatBands];
float[] totalLong = new float[beatBands];
float[] totalShort = new float[beatBands];
float[] delta = new float[beatBands];
float[] c = new float[beatBands];             //multiplier used to determain threshold

int beat;
int beatCounter = 0;
float[] beatAverage = new float[beatAverageSamples];
float totalBeat = 0;
int beatPosition = 0;

float totalGlobal;
float threshold;
float standardDeviation;

//==========================================================================
//==========     ARDUINO VARIABLES  =====================
int totalVol, silenceTimer;
boolean isSilent = true, noNoise = true;
boolean memoryBlock = false;     //collision avoidance for shared memory between threads

boolean beatDetect = false, beatDetectTemp;        //whether to do beat detection
float sliderPos = 0;

int time = 0, time2, iTimer, sTimer, hTimer, frameTimer = 0;
boolean beatFlag;
Serial arduino;
float hue, saturation, intensity, hOffset=0, iOffset=0, sOffset=0;
float hActual, sActual, iActual, hActualTemp, sActualTemp, iActualTemp; //actual sent values
float hueDrift = 0, hueDriftTemp = 0; //drift velocity of hue
float hOffsetMax=30, sOffsetMax=1, iOffsetMax=1;
float sMax = 1, iMax = 1, sMaxTemp, iMaxTemp;

float hOffsetMaxTemp=20, sOffsetMaxTemp=1, iOffsetMaxTemp=1;
float hDecay = 0.9, sDecay = 0.9, iDecay = 0.9;
float hDecayTemp, sDecayTemp, iDecayTemp;
float hTemp, sTemp, iTemp, hOffsetTemp, iOffsetTemp, sOffsetTemp; //temp variables for drawing

int fps, frameCounter = 0;

int currentSlider = 0;
int prevWidth=0, prevHeight=0;
float wheelX, wheelY, wheelDia, wheelInnerDia;
float hDecaySliderPos = 0, sDecaySliderPos = 0, iDecaySliderPos = 0;

float logScale, barScale = 0, barMultiplier = 0.4;  //scaling decay, scaling fft bars
float switchRate = 0.33, switchRateTemp;                             //chance of random color instead of spike

float hSpikeVal, iSpikeVal, sSpikeVal;
int hSpikeTime=0, iSpikeTime=0, sSpikeTime=0, randomTime=0;

float defaultSaturation = 0.6;
float defaultIntensity = 0.4;

float defaultSaturationTemp = 0.6, defualtIntensityTemp = 0.6;

//PShape newFrame;
boolean drawWheel = false;

//==========================================================================


//////////////////////////////////

void setup() {

  for (int i = 0; i < beatBands; i += 1) {
    count[i] = 0;
    totalLong[i] = 0;
    totalShort[i] = 0;
    delta[i] = 0;
    c[i] = 1.5;
  }

  size(720, 500, JAVA2D);                                      //Sets up window
  //hint(DISABLE_DEPTH_TEST);
  //hint(ENABLE_ACCURATE_2D);
  if (frame != null) {
    frame.setResizable(true);
  }
  
  colorMode(RGB);
  background(0);

  minim = new Minim(this);                                      //Sets up minim

  //in = minim.getLineIn(Minim.STEREO, 1024);
  in = minim.getLineIn(Minim.STEREO, 2048);                     //Gets values from mic (and soundcard?)
  fft = new FFT(in.bufferSize(), in.sampleRate());              //Sets up the FFT
  fft.logAverages(30, 5);                                       //Creates a 5 band/oct FFT starting at 40Hz
  rectMode(CORNERS);                                            //Changes mode for creating rectangles
  
  //========================================
  intensity =  0.6;        //defaultIntensity;
  saturation = 0.75;     //defaultSaturation;
  logScale = -0.2/log(0.05);
  
  //initial settings
  hDecay = 0.985;
  sDecay = 0.97;
  iDecay = 0.95;
  hOffsetMax = 50;
  hDecaySliderPos = exp( (1-hDecay)/-logScale )*width/10;
  
  //arduino = new Serial(this, "COM15", 57600);
  time = millis();
  while(millis()-time<2000);
  //arduino.write("s1i1\n");
  //println(PFont.list());
  
  Helvetica = createFont("Arial Bold", 16);
  Tahoma = createFont("Tahoma Bold", 16);
  //Kalinga = createFont("Kalinga Bold", 20);
  Kalinga = createFont("Kalinga Bold", 20);
  Khmer = createFont("Segoe UI Semibold", 20);
  Courier = createFont("Courier New Bold", 16);
  textAlign(CENTER,CENTER);
  textFont(Tahoma);
  thread("ledDriver");  //start second thread handling arduino communications and light processing
  
  //prevWidth = width;
  //prevHeight = height;
  //resized();
  
  //========================================
}


//=========================================================================
//=======      L E D    D R I V E R    T H R E A D      ===================
//=========================================================================
void ledDriver(){  
  
  while(true){
    delay(7);
    //time = millis();
        
    //memoryBlock = true;  //activate memory block
    //hue += increment;
    if(hue<0){
      hue += 360; 
    }
    hue = abs(hue)%360;
    
    //check for beats if beat detection enabled
    if(beatFlag && beatDetect){
      beatFlag = false;
      if(millis() - randomTime > 300){
        if(random(1) < switchRate){
          // ==== Generate random hue =====
          do{
            hue = (hue + random(60,240)) % 360; 
          } while ( abs((hue%120)-60) > 55 );
          
          if(random(-1,1)>0){
            hOffset = hOffsetMaxTemp; 
          } else {
            hOffset = -hOffsetMaxTemp; 
          }
        } else {
          // Case: beat detected but rng dictated no random colour
          if(random(-1,1)>0){
            hOffset = hOffsetMaxTemp; 
          } else {
            hOffset = -hOffsetMaxTemp; 
          }
        }
        //hue += 15;
        iSpikeVal = iOffsetMaxTemp;
        sSpikeVal = sOffsetMaxTemp;
        //if( random(-1,1)>1 ){
         // increment = 0.3; 
        //} else {
       //   increment = -0.3; 
       // }
        randomTime = millis();
      } else {
        //iSpikeVal = 1.5;
        //sSpikeVal = 1.5;
        //hSpikeVal = 20;
        
      }
    } else {
      beatFlag = false; 
    }
    
    //========== Handle any spikes ============
    if( hSpikeVal != 0 ){     
      if(millis()-hSpikeTime>300){
        hOffset = hSpikeVal; 
        hSpikeTime = millis();
      }
      hSpikeVal = 0;
    }
    if( sSpikeVal != 0 ){     
      if(millis()-sSpikeTime>300){
        sOffset = sSpikeVal; 
        sSpikeTime = millis();
      }
      sSpikeVal = 0;
    }
    if( iSpikeVal != 0 ){     
      if(millis()-iSpikeTime>300){
        iOffset = iSpikeVal; 
        iSpikeTime = millis();
      }
      iSpikeVal = 0;
    }
    //defualt hDecay = 0.99, s.92, i.9
   
    //======= Fade Offsets ==============
    hOffset = constrain(hOffset*hDecay,-180,180);
    sOffset = constrain(sOffset*sDecay, 0, 2);
    iOffset = constrain(iOffset*iDecay, 0, 2);
    
    //memoryBlock = false;  //remove memory block
    //======== Drift Hue =========
    hue += hueDrift/(1000/7);
    
    sActual = constrain( saturation + sOffset, 0, sMax);
    iActual = constrain( intensity + iOffset, 0, iMax);
    //iActual = constrain( intensity + iOffset, 0, iMax);
    //======= Send Data to Arduino ======
    String hsiData = "h" + nf(hue + hOffset, 3, 1);
    hsiData += "s" + nf(sActual, 1, 2);
    hsiData += "i" + nf(iActual, 1, 2);
    hsiData += "\n";
    
    //arduino.write(hsiData);
    //println("SENT: " + hsiData);
    //println((millis() - time) + " "+counter);
  } 
}
/*
void resized(){
  PShape newFrame = createShape();
  newFrame.beginShape();
  //external part
  newFrame.vertex(0,0);
  newFrame.vertex(0,height);
  newFrame.vertex(width, height);
  newFrame.vertex(0, height);
  newFrame.vertex(0,0);
  newFrame.endContour();
  
  //interior part
  newFrame.beginContour();
  for( int i=0; i<361; i++){
    newFrame.vertex( sin(radians(i))*width/8, cos(radians(i))*width/8);
  }
  newFrame.endContour();
  
  newFrame.endShape();
  
}*/

//////////////////////////////////
void draw() {
  if (shortPosition >= shortTermAverageSamples) shortPosition = 0;    //Resets incremental variables
  if (longPosition >= longTermAverageSamples/shortTermAverageSamples) longPosition = 0;
  if (deltaPosition >= deltaArraySamples) deltaPosition = 0;
  if (beatPosition >= beatAverageSamples) beatPosition = 0;
  //========  Make copies of values to prevent collisions ========
  hTemp = hue;
  sTemp = saturation;
  iTemp = intensity;
  hOffsetTemp = hOffset;
  sOffsetTemp = sOffset;
  iOffsetTemp = iOffset;
  hDecayTemp = hDecay;
  hueDriftTemp = hueDrift;
  switchRateTemp = switchRate;
  sMaxTemp = sMax;
  iMaxTemp = iMax;
  sActualTemp = sActual;
  iActualTemp = iActual;
  beatDetectTemp = beatDetect;
  //sDecay
  
  //println(millis() - time);
  //time = millis();
  
  fill(0,0,0);
  //========   CHECK IF WINDOW HAS BEEN RESIZED   ===================
  if( (width != prevWidth)||(height != prevHeight) ){
    rect(0, 0, width, height);
    
      //=========  DRAW COLOUR WHEEL  ===
    wheelX = width*float(74)/100;
    wheelY = height*float(26)/100;
    wheelDia = min(width, height)/3;
    wheelInnerDia = wheelDia*2/3;
    
    
    colorMode(HSB,360,1,1);
    for( int i=0; i<360; i++ ){
      noStroke();
      fill(i,1,1);
      arc(wheelX, wheelY, wheelDia, wheelDia, radians(i-91), radians(i-89), PIE);     
    }
    fill(0,0,0);
    ellipse(wheelX, wheelY, wheelInnerDia, wheelInnerDia);
    colorMode(RGB);
    stroke(0,0,0);
    
    hDecaySliderPos = exp( (1-hDecay)/-logScale )*width/10; //update decay sliders
    sDecaySliderPos = exp( (1-sDecay)/-logScale )*width/10;
    iDecaySliderPos = exp( (1-iDecay)/-logScale )*width/10;
  } 
  
  //Clear screen not including wheel
  strokeWeight(wheelDia/4);
  stroke(0,0,0);  
  noFill();
  ellipse(wheelX, wheelY, wheelDia*5/4, wheelDia*5/4);
  noStroke();
  fill(0,0,0);
  ellipse(wheelX, wheelY, wheelInnerDia, wheelInnerDia); //inside wheel
  rect(0, 0, width, wheelY - wheelDia/2 - 1); //top rectangle
  rect(0, 0, wheelX - wheelDia/2 - 1, height); //left rectangele
  rect(wheelX + wheelDia/2 + 1, 0, width, height); //right rectangle
  rect(0, wheelY + wheelDia/2 + 1, width, height); //bottom rectangle
  strokeWeight(1);
  stroke(0,0,0);
  fill(0,0,0);
  prevWidth = width;
  prevHeight = height;

  fill(255);
  fft.forward(in.mix);                                          //Performs the FFT
  int w = int(width/fft.avgSize());                             //Scales the FFT

  /////////////////////////////////////Calculate short and long term array averages///////////////////////////////////////////////////////////////////////////////////////////////////////////

  for (int i = 0; i <beatBands; i += 1) {
    shortAverageArray[shortPosition][i] = fft.getBand(i);   //stores the average intensity between the freq. bounds to the short term array
    totalLong[i] = 0;
    totalShort[i] = 0;

    for (int j = 0; j < longTermAverageSamples/shortTermAverageSamples; j += 1) totalLong[i]+= longAverageArray[j][i];  //adds up all the values in both of these arrays, for averaging
    for (int j = 0; j < shortTermAverageSamples; j +=1) totalShort[i] += shortAverageArray[j][i];
  }

  ///////////////////////////////////////////Find wideband frequency average intensity/////////////////////////////////////////////////////////////////////////////////////////////////////

  totalGlobal = 0;
  globalAverageArray[longPosition] = fft.calcAvg(30, 2000);
  for (int j = 0; j < longTermAverageSamples; j +=1) totalGlobal += globalAverageArray[j];
  totalGlobal = totalGlobal/longTermAverageSamples;

  //////////////////////////////////Populate long term average array//////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (shortPosition%shortTermAverageSamples == 0) {   //every time the short array is completely new it is added to long array
    for (int i = 0; i < beatBands; i += 1) {
      longAverageArray[longPosition][i] = totalShort[i];     //increases speed of program, but is the same as if each individual value was stored in long array
    }
    longPosition += 1;
  }

  /////////////////////////////////////////Find index of variation for each band///////////////////////////////////////////////////////////////////////////////////////////////////////

  for (int i = 0; i < beatBands; i += 1) {
    totalLong[i] = totalLong[i]/(float(longTermAverageSamples)/float(shortTermAverageSamples));

    delta[i] = 0;  
    deltaArray[deltaPosition][i] = pow(abs(totalLong[i]-totalShort[i]), 2);
    for (int j = 0; j < deltaArraySamples; j += 1) delta[i] += deltaArray[j][i];  
    delta[i] = delta[i]/deltaArraySamples;


    ///////////////////////////////////////////Find local beats/////////////////////////////////////////////////////////////////////////////////////////////////////

    c[i] = 1.3 + constrain(map(delta[i], 0, 3000, 0, .4), 0, .4) + //delta is usually bellow 2000
    map(constrain(pow(totalLong[i], .5), 0, 6), 0, 20, .3, 0) +    //possibly comment this out, adds weight to the lower end
    map(constrain(count[i], 0, 15), 0, 15, 1, 0) - 
    map(constrain(count[i], 30, 200), 30, 200, 0, .75);
    
 
    if (cyclePerBeatIntensity/standardDeviation > 3.5){
      predictiveInfluence = predictiveInfluenceConstant * (1 - cos((float(beatCounter)*TWO_PI)/float(cyclesPerBeat)));
      predictiveInfluence *= map(constrain(cyclePerBeatIntensity/standardDeviation,3.5,20),3.5,15,1,6);
      if (cyclesPerBeat > 10) c[i] = c[i] + predictiveInfluence;
    }
  }
  
  beat = 0;
  for (int i = 0; i < beatBands; i += 1) {
    if (totalShort[i] > totalLong[i]*c[i] & count[i] > 7) {                  //If beat is detected

      if (count[i] > 12 & count[i] < 200) {
        beatCounterArray[beatCounterPosition%beatCounterArraySamples] = count[i];
        beatCounterPosition +=1;
      }
      count[i] = 0;                                                 //resets counter
    }
  }

  /////////////////////////////////////////Figure out # of beats, and average///////////////////////////////////////////////////////////////////////////////////////////////////////

  for (int i = 0; i < beatBands; i +=1) if (count[i] < 2) beat += 1;   //If there has been a recent beat in a band add to the global beat value
    
  beatAverage[beatPosition] = beat;
  for (int j = 0; j < beatAverageSamples; j +=1) totalBeat += beatAverage[j];
  totalBeat = totalBeat/beatAverageSamples;

  //println(totalBeat);

  /////////////////////////////////////////////////find global beat///////////////////////////////////////////////////////////////////////////////////////////////
  c[0] = 3.25 + map(constrain(beatCounter, 0, 5), 0, 5, 5, 0);
 
   if (cyclesPerBeat > 10) c[0] = c[0] + .75*(1 - cos((float(beatCounter)*TWO_PI)/float(cyclesPerBeat)));
  //println(c[0]);
  
  threshold = constrain(c[0]*totalBeat + map(constrain(totalGlobal, 0, 2), 0, 2, 4, 0),5,1000);
  //println(threshold);
  
  
  if (beat > threshold & beatCounter > 5) {
    //println(beatCounter);
    //backgroundChange(100);
    beatCounter = 0;
    //println(shortTermAverageSamples);
    if(!isSilent){
      beatFlag = true;   //TRIGGER BEAT
    }
    /*
    if( millis() - time2 > 300){
      arduino.write("?\n");
      time2 = millis();
    } */
  }
  /////////////////////////////////////////////////////Calculate beat spreads///////////////////////////////////////////////////////////////////////////////////////////

  //average = beatCounterArraySamples/200 !!!

  for (int i = 0; i < maxTime; i++) beatSpread[i] = 0;
  for (int i = 0; i < beatCounterArraySamples; i++) {
    beatSpread[beatCounterArray[i]] +=1;
  }
  
  cyclesPerBeat = mode(beatCounterArray);
  if (cyclesPerBeat < 20) cyclesPerBeat *= 2;
  
  cyclePerBeatIntensity = max(beatSpread);
  
  //======  Strange floating bar ==============
  //rect(cyclesPerBeat*10, 300, (cyclesPerBeat*10)+5, 400);

  standardDeviation = 0;
  for (int i = 0; i < maxTime; i++) standardDeviation += pow(beatCounterArraySamples/maxTime-beatSpread[i], 2);
  standardDeviation = pow(standardDeviation/maxTime, .5);



  //////////////////////////////////////////////Draw Monitors//////////////////////////////////////////////////////////////////////////////////////////////////
  /*   //========= bars at the top =========
  for (int i = 0; i < 200; i++) {
    fill(255);
     //(beatSpread[i] > 2*standardDeviation) rect(i*10, 0, ((i+1)*10)-5, beatSpread[i]*2);
    rect(i*10, 0, ((i+1)*10)-5, beatSpread[i]*2);
  }*/
  float barScale = barMultiplier*float(height)/100;
  //rect(0, standardDeviation*2-1, width/2, standardDeviation*2+1);   //top horizontal
  if(!isSilent){
    rect(constrain(width*9.65/10,width-40,width), height, width*9.99/10, height - beat/(float(beatBands)/100));   //beat monitor
    rect(constrain(width*9.3/10, width-80, width), height, constrain(width*9.65/10,width-40,width), height - totalBeat/(float(beatBands)/100));
    rect(constrain(width*9.3/10, width-80, width), height - threshold/(float(beatBands)/100) - 2, constrain(width*9.65/10,width-40,width), height - threshold/(float(beatBands)/100) + 2);
  }
  
  fill(255);
  totalVol = 0; 

  for (int i = 0; i < beatBands; i += 1) {    //Band monitor
    if(!isSilent){
      rect(i*((width-90)/beatBands), height, i*((width-90)/beatBands)+(((width-90)/beatBands)/2), height - totalShort[i]*barScale);         //Short term intensity
    }
    totalVol += int(totalShort[i]);  //get total volume
  }
  
  if( totalVol > 0 ){
    isSilent = false; 
    noNoise = false;
  } else if ( noNoise == false ){
     silenceTimer = millis();
     noNoise = true;
  } else if(millis() - silenceTimer > 1000){
    isSilent = true; 
  }
  //println(isSilent);

  fill(110);
  for (int i = 0; i < beatBands; i += 1) {
    rect(i*((width-90)/beatBands) + (((width-90)/beatBands)/2), height, i*((width-90)/beatBands)+((width-90)/beatBands), height - totalLong[i]*barScale);                      //Long term intensity
    rect(i*((width-90)/beatBands) + (((width-90)/beatBands)/2), height - barScale*totalLong[i]*c[i]-2,
                         i*((width-90)/beatBands)+((width-90)/beatBands), height - barScale*totalLong[i]*c[i]+2);      //threshold
    //if (count[i] < 4) rect(i*((width-90)/beatBands) + (((width-90)/beatBands)/2), 0, i*((width-90)/beatBands)+((width-90)/beatBands), 15);
  }

  //if (beatCounter < 5) rect(width - 50, 0, width, 50);  //beat indication box
  
  //============================================================================================================
  //=============          GUI        ==========================================================================
  //============================================================================================================
  colorMode(HSB, 360, 1 ,1);
  rectMode(RADIUS);
  fill(0 ,0, 0.7);
  stroke(0, 0, 0);
  
  //left side sliders
  float barWidth = width/7;
  float barHeight = constrain(height/150, 1, 4);
  float sliderWidth = constrain(width/120, 1, 10);
  float sliderHeight = constrain(height/60, 1, 15);
  float leftPos = width/7;
  float sliderY1 = float(25)/100, sliderY2 = float(35)/100, sliderY3 = float(45)/100, sliderY4 = float(55)/100, sliderY5 = float(65)/100;  //bar y positions
  //float sliderY[] = { float(2.5)/10, float(3.5)/10, float(5)/10, float(6)/10, float(7)/10};
  //float numberSize = min(width,height)/27;
  float numberSize = min(width,height)/35;
  
  //  ON/OFF slider
  float barWidth4 = numberSize*3;//width/20;
  float barHeight4 = barWidth4/2;//constrain(height/30, 1, 100);
  float sliderWidth4 = constrain(width/120, 1, 10);
  float sliderHeight4 = constrain(height/60, 1, 15);
  float sliderY41 = float(15)/100;  //bar y positions
  
  //decay sliders
  float barWidth3 = width/10;
  float barHeight3 = constrain(height/150, 1, 4);
  float sliderWidth3 = constrain(width/120, 1, 10);
  float sliderHeight3 = constrain(height/60, 1, 15);
  float midPos = width*3.5/10;  
  float sliderY11 = sliderY3, sliderY12 = sliderY4, sliderY13 = sliderY5;
  
  //  HSI direct controls/display
  float barWidth2 = width/4;
  float barHeight2 = constrain(height/90, 1, 8);
  float sliderWidth2 = constrain(width/100, 1, 15);
  float sliderHeight2 = constrain(height/50, 1, 20);
  float rightPos = wheelX;  
  float sliderY31 = float(75)/100, sliderY32 = float(55)/100, sliderY33 = float(65)/100;
  //  Hue drift gets to be a speical snowflake with its own bar
  float barWidth2b = barWidth2;
  float barHeight2b = constrain(height/150, 1, 4);
  float sliderWidth2b = constrain(width/100, 1, 10);
  float sliderHeight2b = constrain(height/50, 1, 15);
  
  //=========  Draw slider bars =======

  rect( leftPos, height*sliderY1, barWidth/2, barHeight/2);   //default sat
  rect( leftPos, height*sliderY1, 1, barHeight*2);
  
  rect( leftPos, height*sliderY2, barWidth/2, barHeight/2);   //defualt int
  rect( leftPos, height*sliderY2, 1, barHeight*2);
  
  rect( leftPos, height*sliderY3, barWidth/2, barHeight/2);   //hue spike
  rect( leftPos, height*sliderY3, 1, barHeight*2);
  
  rect( leftPos, height*sliderY4, barWidth/2, barHeight/2);   //sat spike
  rect( leftPos, height*sliderY4, 1, barHeight*2);
  
  rect( leftPos, height*sliderY5, barWidth/2, barHeight/2);   //int spike
  rect( leftPos, height*sliderY5, 1, barHeight*2);
  
  rect( midPos, height*sliderY11, barWidth3/2, barHeight3/2);   //hue decay
  rect( midPos, height*sliderY11, 1, barHeight3*2);
  
  rect( midPos, height*sliderY12, barWidth3/2, barHeight3/2);   //sat decay
  rect( midPos, height*sliderY12, 1, barHeight3*2);
  
  rect( midPos, height*sliderY13, barWidth3/2, barHeight3/2);   //int decay
  rect( midPos, height*sliderY13, 1, barHeight3*2);
  
  // hue drift and main saturation and intensity
  fill(0,0,0.85);
  rect( rightPos, height*sliderY31, barWidth2b/2, barHeight2b/2, barHeight2b/2);   //hue drift
  rect( rightPos, height*sliderY31, 1, barHeight2b*2);
  
  fill(0,0,0.4);
  rect( rightPos, height*sliderY32, barWidth2/2, barHeight2/2, barHeight2/2);   //saturation
  fill(0,0,0.85);
  noStroke();
  rect( rightPos + barWidth2*((sMax/2)-0.5), height*sliderY32, barWidth2*sMax/2, barHeight2/2);
  noFill();
  stroke(0);
  rect( rightPos, height*sliderY32, barWidth2/2, barHeight2/2, barHeight2/2);         //hide corners
  rect( rightPos, height*sliderY32, barWidth2/2+1, barHeight2/2+1, barHeight2/2+1);
  rect( rightPos, height*sliderY32, barWidth2/2+2, barHeight2/2+2, barHeight2/2+2);
  fill(0,0,0.85);
  rect( rightPos, height*sliderY32, 1, barHeight2*2);
  
  fill(0,0,0.4);
  rect( rightPos, height*sliderY33, barWidth2/2, barHeight2/2, barHeight2/2);   //intensity
  fill(0,0,0.85);
  noStroke();
  rect( rightPos + barWidth2*((iMax/2)-0.5), height*sliderY33, barWidth2*iMax/2, barHeight2/2);
  noFill();
  stroke(0);
  rect( rightPos, height*sliderY33, barWidth2/2, barHeight2/2, barHeight2/2);         //hide corners
  rect( rightPos, height*sliderY33, barWidth2/2+1, barHeight2/2+1, barHeight2/2+1);
  rect( rightPos, height*sliderY33, barWidth2/2+2, barHeight2/2+2, barHeight2/2+2);
  fill(0,0,0.85);
  rect( rightPos, height*sliderY33, 1, barHeight2*2);
  
  //==========================   BEAT DETECTION SLIDER     ==========================
  textFont(Tahoma);
  float tempSize = numberSize;
  textSize(tempSize);
  float lineWidth = constrain(height/300, 2, 6);
  
  if( sliderPos > 0.22 ){
    fill(120,1,1);
    text( "ON", leftPos + (sliderPos-1.3)*barWidth4+numberSize/2, height*sliderY41 - numberSize/8); 
  }
  if (sliderPos < 0.88){
    fill(0,1,1);
    text( "OFF", leftPos + (sliderPos)*barWidth4+numberSize/2, height*sliderY41 - numberSize/8); 
  }
  fill(0);
  rectMode(CORNERS);
  rect( leftPos-(barWidth4+barHeight4)/2-barHeight4, height*sliderY41-barHeight4/3, leftPos-(barWidth4+barHeight4)/2+lineWidth-1, height*sliderY41+barHeight4/3); 
  rect( leftPos+(barWidth4+barHeight4)/2-1, height*sliderY41-barHeight4/3, leftPos+(barWidth4+barHeight4)/2+barHeight4*1.3, height*sliderY41+barHeight4/3);
  
  rectMode(RADIUS);
  noFill();
  stroke(0,0,0.7);
  
  strokeWeight( lineWidth );  
  line( leftPos-barWidth4/2, height*sliderY41-barHeight4/2, leftPos+barWidth4/2, height*sliderY41-barHeight4/2 ); 
  line( leftPos-barWidth4/2, height*sliderY41+barHeight4/2, leftPos+barWidth4/2, height*sliderY41+barHeight4/2 ); 
  arc( leftPos-barWidth4/2, height*sliderY41, barHeight4, barHeight4, QUARTER_PI*2, 6*QUARTER_PI );
  arc( leftPos+barWidth4/2, height*sliderY41, barHeight4, barHeight4, QUARTER_PI*6, 10*QUARTER_PI );
  
  //cover out "ON" and "OFF" labels


  

  strokeWeight(2);
  fill(0,0,0.7);
  stroke(0,0,0.7);
  //check if mouse is here
  if( currentSlider == 41 || ((mouseX>(leftPos-barWidth4/2-barHeight4/2)) && (mouseX<leftPos+barWidth4/2+barHeight4/2) &&
     (mouseY>height*sliderY41 - barHeight4/1.8) && (mouseY<height*sliderY41 + barHeight4/1.8) && currentSlider==0 ) ){
       
    fill(0, 0, 1);  
    stroke(0, 0, 1);    
    if( mousePressed || currentSlider == 41){
      currentSlider = 41;
      sliderPos = constrain((mouseX-(leftPos-barWidth4/2))/barWidth4, 0 ,1);
      if( sliderPos >= 0.5){
        beatDetect = true; 
      } else {
        beatDetect = false; 
      }
    }
            
  }
  
  if( currentSlider != 41 || mousePressed == false ){
    if (sliderPos >= 0.5){
      sliderPos = constrain(sliderPos + 0.04, 0, 1); 
    } else {
      sliderPos = constrain(sliderPos - 0.04, 0, 1);
    }
  }
  //noStroke();
  ellipse( leftPos + barWidth4*(sliderPos-0.5), sliderY41*height, barHeight4 - lineWidth*3, barHeight4 - lineWidth*3);
  strokeWeight(1);
  stroke(0);
  
  
  
  //===========================  BAR HEIGHT SLIDER   ===========================
  if( currentSlider == 1 || ((mouseX>(leftPos-barWidth/1.9)) && (mouseX<leftPos+barWidth/1.9) &&
     (mouseY>height*sliderY1 - sliderHeight) && (mouseY<height*sliderY1 + sliderHeight)&& currentSlider==0 ) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 1){
       barMultiplier = (mouseX-(leftPos-barWidth/2))*1/barWidth;
       currentSlider = 1;
       //fill(240,0,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         barMultiplier = float(round(barMultiplier*10))/10;
         fill(50, 1, 1);
       }        
       barMultiplier = constrain(barMultiplier, 0, 1);
       //defaultSaturationTemp = defaultSaturation;
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  rect( (barMultiplier-0.5)*barWidth+leftPos, height*sliderY1, sliderWidth/2, sliderHeight, sliderWidth/2);
  
  

  //===========================  DEFAULT INTENSITY SLIDER   ===========================
  if( currentSlider == 2 || ((mouseX>(leftPos-barWidth/1.9)) && (mouseX<leftPos+barWidth/1.9) &&
     (mouseY>height*sliderY2 - sliderHeight) && (mouseY<height*sliderY2 + sliderHeight)&& currentSlider==0) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 2){
       switchRateTemp = (mouseX-(leftPos-barWidth/2))*1/barWidth;
       currentSlider = 2;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         switchRateTemp = float(round(switchRateTemp*10))/10;         
         fill(50, 1, 1);
       }
       switchRateTemp = constrain(switchRateTemp, 0, 1);
       switchRate = switchRateTemp; //send value to lighting thread       
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  
  rect( (switchRateTemp-0.5)*barWidth+leftPos, height*sliderY2, sliderWidth/2, sliderHeight, sliderWidth/2);


  //===========================  HUE OFFSET (MAX) SLIDER   ===========================
  if( currentSlider == 3 || ((mouseX>(leftPos-barWidth/1.9)) && (mouseX<leftPos+barWidth/1.9) &&
     (mouseY>height*sliderY3 - sliderHeight) && (mouseY<height*sliderY3 + sliderHeight)&& currentSlider==0) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 3){
       hOffsetMax = (mouseX-(leftPos-barWidth/2))*180/barWidth;
       currentSlider = 3;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         hOffsetMax = float(round(hOffsetMax/10))*10;
         fill(50, 1, 1);
       }   
       hOffsetMax = constrain(hOffsetMax, 0, 180);
       hOffsetMaxTemp = hOffsetMax;                      //make copy for led write thread
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  
  rect( (hOffsetMax-90)*barWidth/180+leftPos, height*sliderY3, sliderWidth/2, sliderHeight, sliderWidth/2);
  
  
    //===========================  MAX SATURATION OFFSET SLIDER   ===========================
  if( currentSlider == 4 || ((mouseX>(leftPos-barWidth/1.9)) && (mouseX<leftPos+barWidth/1.9) &&
     (mouseY>height*sliderY4 - sliderHeight) && (mouseY<height*sliderY4 + sliderHeight)&& currentSlider==0) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 4){
       sOffsetMax = (mouseX-(leftPos-barWidth/2))*2/barWidth;
       currentSlider = 4;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         sOffsetMax = float(round(sOffsetMax*10))/10;
         fill(50, 1, 1);
       }    
       sOffsetMax = constrain(sOffsetMax, 0, 2); 
       sOffsetMaxTemp = sOffsetMax;           //copy for led write thread   
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
   
  rect( (sOffsetMax-1)*barWidth/2+leftPos, height*sliderY4, sliderWidth/2, sliderHeight, sliderWidth/2);
  
  
      //===========================  MAX INTENSITY OFFSET SLIDER   ===========================
  if( currentSlider == 5 || ((mouseX>(leftPos-barWidth/1.9)) && (mouseX<leftPos+barWidth/1.9) &&
     (mouseY>height*sliderY5 - sliderHeight) && (mouseY<height*sliderY5 + sliderHeight)&& currentSlider==0) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 5){
       iOffsetMax = (mouseX-(leftPos-barWidth/2))*2/barWidth;
       currentSlider = 5;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         iOffsetMax = float(round(iOffsetMax*10))/10;
         fill(50, 1, 1);
       }        
       iOffsetMax = constrain(iOffsetMax, 0, 2);  
       iOffsetMaxTemp = iOffsetMax; //copy for led write thread
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }

  rect( (iOffsetMax-1)*barWidth/2+leftPos, height*sliderY5, sliderWidth/2, sliderHeight, sliderWidth/2);
  stroke(0,0,0);
  fill(0,0,0.7); 
  
  //==============================  HUE DECAY SLIDER  =================================
  if( currentSlider == 11 || ((mouseX>(midPos-barWidth3/1.9)) && (mouseX<midPos+barWidth3/1.9) &&
     (mouseY>height*sliderY11 - sliderHeight3) && (mouseY<height*sliderY11 + sliderHeight3)&& currentSlider==0 ) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 11){
       //hDecay = (mouseX-(midPos-barWidth3/2))*1/barWidth3;
       hDecaySliderPos = constrain(mouseX-(midPos-barWidth3/2), 0, barWidth3);
       hDecay = 1 + logScale*log(constrain((hDecaySliderPos)/barWidth3, 0.05, 1));
       currentSlider = 11;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         if(hDecay<0.9){
           hDecay = float(round(hDecay*50))/50;
         } else if (hDecay<0.981){
           hDecay = float(round(hDecay*100))/100; 
         } else if (hDecay<0.9905){
           hDecay = float(round(hDecay*500))/500;
         } else {
           hDecay = float(round(hDecay*1000))/1000;
         }
         fill(50, 1, 1);
       }        
       hDecaySliderPos = exp( (1-hDecay)/-logScale )*barWidth3; //recalculate position
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  //hDecaySliderPos = constrain(hDecay, 0, 1);
  rect( hDecaySliderPos - barWidth3/2 + midPos, height*sliderY11, sliderWidth3/2, sliderHeight3, sliderWidth3/2);
  
 //==============================  SATURATION DECAY SLIDER  =================================
  if( currentSlider == 12 || ((mouseX>(midPos-barWidth3/1.9)) && (mouseX<midPos+barWidth3/1.9) &&
     (mouseY>height*sliderY12 - sliderHeight3) && (mouseY<height*sliderY12 + sliderHeight3)&& currentSlider==0 ) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 12){
       //hDecay = (mouseX-(midPos-barWidth3/2))*1/barWidth3;
       sDecaySliderPos = constrain(mouseX-(midPos-barWidth3/2), 0, barWidth3);
       sDecay = 1 + logScale*log(constrain((sDecaySliderPos)/barWidth3, 0.05, 1));
       currentSlider = 12;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         if(sDecay<0.9){
           sDecay = float(round(sDecay*50))/50;
         } else if (sDecay<0.981){
           sDecay = float(round(sDecay*100))/100; 
         } else if (sDecay<0.9905){
           sDecay = float(round(sDecay*500))/500;
         } else {
           sDecay = float(round(sDecay*1000))/1000;
         }
         fill(50, 1, 1);
       }        
       sDecaySliderPos = exp( (1-sDecay)/-logScale )*barWidth3; //recalculate position
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  //hDecaySliderPos = constrain(hDecay, 0, 1);
  rect( sDecaySliderPos - barWidth3/2 + midPos, height*sliderY12, sliderWidth3/2, sliderHeight3, sliderWidth3/2);
  
  //==============================  INTESITY DECAY SLIDER  =================================
  if( currentSlider == 13 || ((mouseX>(midPos-barWidth3/1.9)) && (mouseX<midPos+barWidth3/1.9) &&
     (mouseY>height*sliderY13 - sliderHeight3) && (mouseY<height*sliderY13 + sliderHeight3)&& currentSlider==0 ) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 13){
       //hDecay = (mouseX-(midPos-barWidth3/2))*1/barWidth3;
       iDecaySliderPos = constrain(mouseX-(midPos-barWidth3/2), 0, barWidth3);
       iDecay = 1 + logScale*log(constrain((iDecaySliderPos)/barWidth3, 0.05, 1));
       currentSlider = 13;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         if(iDecay<0.9){
           iDecay = float(round(iDecay*50))/50;
         } else if (iDecay<0.981){
           iDecay = float(round(iDecay*100))/100; 
         } else if (iDecay<0.9905){
           iDecay = float(round(iDecay*500))/500;
         } else {
           iDecay = float(round(iDecay*1000))/1000;
         }
         fill(50, 1, 1);
       }        
       iDecaySliderPos = exp( (1-iDecay)/-logScale )*barWidth3; //recalculate position
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  //hDecaySliderPos = constrain(hDecay, 0, 1);
  rect( iDecaySliderPos - barWidth3/2 + midPos, height*sliderY13, sliderWidth3/2, sliderHeight3, sliderWidth3/2);
  
  
  //==============================  HUE DRIFT SLIDER  =================================
  if( currentSlider == 31 || ((mouseX>(rightPos-barWidth2/1.9)) && (mouseX<rightPos+barWidth2/1.9) &&
     (mouseY>height*sliderY31 - sliderHeight2b) && (mouseY<height*sliderY31 + sliderHeight2b)&& currentSlider==0 ) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 31){
       hueDriftTemp =(mouseX-rightPos)*float(360)/barWidth2b;
       currentSlider = 31;
       //fill(120,1,1);
       pressedColour();
       if( keyPressed && keyCode == SHIFT ){
         hueDriftTemp = float(round(hueDriftTemp/10))*10;
         fill(50, 1, 1);
       }
       hueDriftTemp = constrain(hueDriftTemp,-180,180);    //override stored value   
       //println(hueDriftTemp);
       if( mouseButton == RIGHT ){
         hueDriftTemp = 0; 
       }
       hueDrift = hueDriftTemp;
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     fill(0,0,0.7); 
   }
  //sTemp = constrain(sTemp+sOffsetTemp, 0, 1);
  rect( (hueDriftTemp/360)*barWidth2b+rightPos, height*sliderY31, sliderWidth2b/2, sliderHeight2b, sliderWidth2b/2);
  
  
  //==============================  SATURATION SLIDER  =================================
  if(beatDetect) fill(120,1,1);
  
  if( currentSlider == 32 || ((mouseX>(rightPos-barWidth2/1.9)) && (mouseX<rightPos+barWidth2/1.9) &&
     (mouseY>height*sliderY32 - sliderHeight2) && (mouseY<height*sliderY32 + sliderHeight2)&& currentSlider==0 ) ){
     //====   slider active =======
     if( mousePressed || currentSlider == 32){
       if( mouseButton == LEFT ){
         sTemp = (mouseX-(rightPos-barWidth2/2))*1/barWidth2;
         currentSlider = 32;
         //fill(120,1,1);
         if( !beatDetect ){       
           pressedColour(); 
         }
         if( keyPressed && keyCode == SHIFT ){
           sTemp = float(round(sTemp*10))/10;
           fill(50, 1, 1);
         }
       } else if (mouseButton == RIGHT){
         sMaxTemp = (mouseX-(rightPos-barWidth2/2))*1/barWidth2;
         currentSlider = 32;
         //fill(120,1,1);
         if( keyPressed && keyCode == SHIFT ){
           sMaxTemp = float(round(sMaxTemp*10))/10;
           //fill(50, 1, 1);
         }
         sMaxTemp = constrain(sMaxTemp, 0, 1);
         sMax = sMaxTemp;
       } 
       sTemp = constrain(sTemp, 0 ,sMaxTemp);
       saturation = sTemp;
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     if(!beatDetect) fill(0,0,0.7); 
   }
  if( currentSlider == 32 && mousePressed ){
    sTemp = constrain(sTemp, 0, sActualTemp);
  } else {
    sTemp = constrain(sActualTemp, 0, 1);
  }
  rect( (sTemp-0.5)*barWidth2+rightPos, height*sliderY32, sliderWidth2/2, sliderHeight2, sliderWidth2/2);
  
  //==============================  INTENSITY SLIDER  =================================
  if(beatDetect) fill(120,1,1);
  
  if( currentSlider == 33 || ((mouseX>(rightPos-barWidth2/1.9)) && (mouseX<rightPos+barWidth2/1.9) &&
     (mouseY>height*sliderY33 - sliderHeight2) && (mouseY<height*sliderY33 + sliderHeight2)&& currentSlider==0 ) ){
     //====   slider active =======
     if(mousePressed || currentSlider == 33){
       if( mouseButton == LEFT ){
         iTemp = (mouseX-(rightPos-barWidth2/2))*1/barWidth2;
         currentSlider = 33;
         //fill(120,1,1);
         if( !beatDetect ){       
           pressedColour(); 
         }
         if( keyPressed && keyCode == SHIFT ){
           iTemp = float(round(iTemp*10))/10;
           fill(50, 1, 1);
         }        
       } else if (mouseButton == RIGHT){
         iMaxTemp = (mouseX-(rightPos-barWidth2/2))*1/barWidth2;
         currentSlider = 33;
         //fill(120,1,1);
         if( keyPressed && keyCode == SHIFT ){
           iMaxTemp = float(round(iMaxTemp*10))/10;
           //fill(50, 1, 1);
         }
         iMaxTemp = constrain(iMaxTemp, 0, 1);
         iMax = iMaxTemp;
       }
       iTemp = constrain(iTemp, 0 ,iMaxTemp);
       intensity = iTemp;
     } else {
       stroke(0,0,1);
     }      
   } else {              // negative, reset colours
     stroke(0,0,0);
     if(!beatDetect) fill(0,0,0.7);  
   }
  if( currentSlider == 33 && mousePressed ){
    iTemp = constrain(iTemp, 0, iActualTemp);
  } else {
    iTemp = constrain(iActualTemp, 0, 1);
  }
  rect( (iTemp-0.5)*barWidth2+rightPos, height*sliderY33, sliderWidth2/2, sliderHeight2, sliderWidth2/2);
  
  
   // =========================  HUE WHEEL SLIDER (slider 100) ==============================
  float triangleSize = wheelDia/8;
   
  if( currentSlider == 100 || (( sqrt( sq(mouseX - wheelX) + sq(mouseY - wheelY) ) ) < ( wheelDia/2 + triangleSize )) && currentSlider == 0 ){
    //slider active check
    if(mousePressed || currentSlider == 100){
      currentSlider = 100;
      if( mouseX >= wheelX){
        if( mouseY <= wheelY ){
          hTemp =  degrees(atan((mouseX - wheelX) / (-mouseY + wheelY )));
        } else {
          hTemp =  180 + degrees(atan((mouseX - wheelX) / (-mouseY + wheelY )));
        }
      } else {
        if( mouseY <= wheelY ){
          hTemp =  360 + degrees(atan((mouseX - wheelX) / (-mouseY + wheelY )));
        } else {
          hTemp =  180 + degrees(atan((mouseX - wheelX) / (-mouseY + wheelY )));
        }
      }
      if( keyPressed && keyCode == SHIFT ){
         hTemp = float(round(hTemp/10))*10;
         if(hTemp == 360){
           hTemp = 0; 
         }
      } 
      hue = hTemp;      
    }
    //println(hTemp);
    
    
  }
  
  
  //================  HUE WHEEL  ============================
  float hueAngle = radians(hTemp+hOffsetTemp);
  float hSin = sin(hueAngle);
  float hCos = cos(hueAngle);
  float triX1 = wheelX + wheelDia/1.9*hSin; //close point x
  float triY1 = wheelY - wheelDia/1.9*hCos; //close point y
  float triX2 = triX1 + sin(hueAngle-PI/6)*triangleSize;
  float triY2 = triY1 - cos(hueAngle-PI/6)*triangleSize;
  float triX3 = triX1 + sin(hueAngle+PI/6)*triangleSize;
  float triY3 = triY1 - cos(hueAngle+PI/6)*triangleSize;
  
  stroke(0,0,0.5);
  fill(hTemp+hOffsetTemp, sTemp, iTemp);
  triangle( triX1, triY1, triX2, triY2, triX3, triY3);
  textSize(wheelDia/4.5);
  float tempAngle = hTemp + hOffsetTemp;
  if( tempAngle<0 ) tempAngle += 360;
  if( tempAngle>=359.5 ) tempAngle = 0;
  text( nf(round((tempAngle*10)/10), 3)+"°" , wheelX+wheelDia/60, wheelY-wheelDia/30);
  
  //======================================================================================================
  //===============================      BUTTONS      ====================================================
  
  //=====================   PRINT VALUES  ===================================
  textSize(numberSize);
  fill(0,0,0.7);
  //=====  Left column ====
  if(barMultiplier != 1 ){
    text( int(barMultiplier*100)+"%", leftPos+barWidth/1.55+numberSize/2, height*sliderY1 - numberSize/8); 
  } else {   //add extra room if 100%
    text( int(barMultiplier*100)+"%", leftPos+barWidth/1.40+numberSize/2, height*sliderY1 - numberSize/8);  
  }
  
  if(switchRate != 1 ){
    text( int(switchRate*100)+"%", leftPos+barWidth/1.55+numberSize/2, height*sliderY2 - numberSize/8); 
  } else {   //add extra room if 100%
    text( int(switchRate*100)+"%", leftPos+barWidth/1.40+numberSize/2, height*sliderY2 - numberSize/8);  
  } 
  text( int(hOffsetMax)+"°", leftPos+barWidth/1.55+numberSize/2, height*sliderY3 - numberSize/8); 
  text( nf(sOffsetMax,1,2), leftPos+barWidth/1.55+numberSize/2, height*sliderY4 - numberSize/8); 
  text( nf(iOffsetMax,1,2), leftPos+barWidth/1.55+numberSize/2, height*sliderY5 - numberSize/8); 
  
  //=====  middle (decay) column ====
  text( nf(hDecay,1,3), midPos+barWidth3/1.35+numberSize/2, height*sliderY11 - numberSize/8); 
  text( nf(sDecay,1,3), midPos+barWidth3/1.35+numberSize/2, height*sliderY12 - numberSize/8);
  text( nf(iDecay,1,3), midPos+barWidth3/1.35+numberSize/2, height*sliderY13 - numberSize/8); 
  
  //===== right column ===
  fill(0,0, 0.85);
  textSize(numberSize*1.5);
  if( currentSlider == 32 && mousePressed && mouseButton == RIGHT ){
    text( nf(sMaxTemp,1,2), rightPos+barWidth2/1.5+numberSize/2.5, height*sliderY32 - numberSize/6);
  } else {
    text( nf(sTemp,1,2), rightPos+barWidth2/1.5+numberSize/2.5, height*sliderY32 - numberSize/6); 
  }
  
  if( currentSlider == 33 && mousePressed && mouseButton == RIGHT ){
    text( nf(iMaxTemp,1,2), rightPos+barWidth2/1.5+numberSize/2.5, height*sliderY33 - numberSize/6);
  } else {
    text( nf(iTemp,1,2), rightPos+barWidth2/1.5+numberSize/2.5, height*sliderY33 - numberSize/6); 
  }
  //text( nf(iTemp,1,2), rightPos+barWidth2/1.5+numberSize/2.5, height*sliderY33 - numberSize/6); 
  text( int(hueDrift), rightPos+barWidth2/1.62+numberSize/2.5, height*sliderY31 - numberSize/6); 
  
  //=====================   PRINT LABELS  =================================================
  
  //left column
  textFont(Kalinga);
  textSize(numberSize);
  text( "beat detection", leftPos, height*sliderY41 - sliderHeight4*2.4 - numberSize/2);
  text( "bar height", leftPos, height*sliderY1 - sliderHeight*1.8 - numberSize/2);
  text( "switch rate", leftPos, height*sliderY2 - sliderHeight*1.8 - numberSize/2);
  text( "hue offset", leftPos, height*sliderY3 - sliderHeight*1.8 - numberSize/2);
  text( "saturation offset", leftPos, height*sliderY4 - sliderHeight*1.8 - numberSize/2);
  text( "intensity offset", leftPos, height*sliderY5 - sliderHeight*1.8 - numberSize/2);
  
  text( "h decay", midPos, height*sliderY11 - sliderHeight*1.8 - numberSize/2);
  text( "s decay", midPos, height*sliderY12 - sliderHeight*1.8 - numberSize/2);
  text( "i decay", midPos, height*sliderY13 - sliderHeight*1.8 - numberSize/2);
  
  //==========   right side bars   ===================
  text( "h u e    d r i f t", rightPos, height*sliderY31 - sliderHeight2*1 - numberSize);
  textSize(numberSize*1.4);
  //if (beatDetectTemp) fill(120,1,1);
  text( "saturation", rightPos, height*sliderY32 - sliderHeight2*1.3 - numberSize);
  text( "intensity", rightPos, height*sliderY33 - sliderHeight2*1.3 - numberSize);
  
  if( beatDetectTemp ){
     textSize(numberSize*1.1);
     fill(120,1,1);
     text( "AUTO", rightPos - barWidth3*1.5 - numberSize, height*sliderY32 - numberSize/5);
     text( "AUTO", rightPos - barWidth3*1.5 - numberSize, height*sliderY33 - numberSize/5);
  }
  
  fill(120,1,1);
  textFont(Courier);
  textSize(numberSize*0.9);
  frameCounter++;
  if( millis() - frameTimer > 1000 ){
    fps = frameCounter;
    frameCounter = 0;
    frameTimer = millis();
  }
  
  //text("fps:" + fps, width/25, numberSize*0.8);
  
  stroke(0,0,0);
  fill(0,0,0);
  textFont(Tahoma);
  
  colorMode(RGB);
  rectMode(CORNERS);
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  

  shortPosition += 1;
  deltaPosition += 1;
  for (int i = 0; i < beatBands; i += 1) count[i] += 1;
  beatCounter += 1;
  beatPosition += 1;
  
  
}

void mouseReleased(){
  currentSlider = 0; 
}


void backgroundChange(int a) {              //Randomly changes background color
  redBackground = int(random(a));
  greenBackground = int(random(a));
  blueBackground = int(random(a));
}


int mode(int[] array) {
    int[] modeMap = new int [array.length];
    int maxEl = array[0];
    int maxCount = 1;

    for (int i = 0; i < array.length; i++) {
        int el = array[i];
        if (modeMap[el] == 0) {
            modeMap[el] = 1;
        }
        else {
            modeMap[el]++;
        }

        if (modeMap[el] > maxCount) {
            maxEl = el;
            maxCount = modeMap[el];
        }
    }
    return maxEl;
}

//int index(int[] array, int number){
//  for (int i = 0; i < array.length; i++){
//    if (array[i] == number) return i;
//  }
//}
void pressedColour(){
  fill(120,1,1); 
}

void stop()                                //Closes everything on stop
{
  in.close();                              //Always close Minim audio classes when you are finished with them
  minim.stop();                            //Always stop Minim before exiting
  super.stop();                            //This closes the sketch
}




import ddf.minim.*;
import ddf.minim.signals.*;
import controlP5.*;
 
Minim minim;
AudioOutput out;
SineWave sinex, siney;
 
int rotateContrary = 1;
public int lineWidth;
public float xangle, yangle, tyangle, txangle, sineVolume;
public float xAngle, yAngle, xAmp, yAmp,tAngle, txAmp, tyAmp,txAngle, tyAngle;
public int num = 1000; 
public float mx[] = new float[num]; 
public float my[] = new float[num]; 
 
//total width = 600 + 250 = 850
int screenWidth = 600;
int controlWidth = 250;
int screenHeight = 600;
 
color lineColor;
 
ControlP5 controlP5;
controlP5.Label label;
 
Slider fadeSlider,xAngleSlider,yAngleSlider,xAmpSlider,yAmpSlider,txAmpSlider,tyAmpSlider,txAngleSlider,tyAngleSlider,lineWidthSlider,sineVolumeSlider;
Toggle contraryToggle;
 
void setup()
{
  size(screenWidth + controlWidth, screenHeight, P2D);
  smooth();
  lineColor = color( 0, 255, 0 );
  color sliderBackgroundColor = color( 100, 100, 100 );
  color sliderForegroundColor = lineColor;
 
 // txangle = PI / 4;
 // tyangle = PI / 4;
  yangle = PI / 2; //PI / 4;
  xangle = 0 ;
   
  int startT = 0;
  int startP = 30;
 
 
  //init vars
  mx[num-1] = 0;
  my[num-1] = 0;
 
  // sound setup
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO, 2048);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sinex = new SineWave(440, 0.5, out.sampleRate());
  siney = new SineWave(640, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sinex.portamento(10);
  siney.portamento(10);
  // add the oscillator to the line out
  out.addSignal(sinex);
  out.addSignal(siney);
   
  int barWidth = 20;
  int barSpace = 40;
  int barLength = 150;
  int topOffset = 40;
  int barXSpace = 50;
 
    // control setup
    controlP5 = new ControlP5(this);
 
   // pen controls
  xAngleSlider = controlP5.addSlider("xAngle",0,100,128,screenWidth+barXSpace,topOffset,barWidth,barLength);
  xAngleSlider.setColorValue( sliderForegroundColor );
  xAngleSlider.setColorBackground( sliderBackgroundColor );
  xAngleSlider.setColorForeground( sliderForegroundColor );
  xAngleSlider.setColorActive( sliderForegroundColor );
  xAngleSlider.setId(1);
  xAngleSlider.setValue( startP );
  label = xAngleSlider.captionLabel();
  label.set( "X freq" );
 
  xAmpSlider = controlP5.addSlider("xAmp",0,screenWidth/2,128,screenWidth+barXSpace*2,topOffset,barWidth,barLength);
  xAmpSlider.setColorValue( sliderForegroundColor );
  xAmpSlider.setColorBackground( sliderBackgroundColor );
  xAmpSlider.setColorForeground( sliderForegroundColor );
  xAmpSlider.setColorActive( sliderForegroundColor );
  xAmpSlider.setId(2);
  xAmpSlider.setValue( startP );
  label = xAmpSlider.captionLabel();
  label.set( "X amp" ); 
 
  yAngleSlider = controlP5.addSlider("yAngle",0,100,128,screenWidth+barXSpace*3,topOffset,barWidth,barLength);
  yAngleSlider.setColorValue( sliderForegroundColor );
  yAngleSlider.setColorBackground( sliderBackgroundColor );
  yAngleSlider.setColorForeground( sliderForegroundColor );
  yAngleSlider.setColorActive( sliderForegroundColor );
  yAngleSlider.setId(3);
  yAngleSlider.setValue( startP );
  label = yAngleSlider.captionLabel();
  label.set( "Y freq" );
 
  yAmpSlider = controlP5.addSlider("yAmp",0,screenHeight/2,128,screenWidth+barXSpace*4,topOffset,barWidth,barLength);
  yAmpSlider.setColorValue( sliderForegroundColor );
  yAmpSlider.setColorBackground( sliderBackgroundColor );
  yAmpSlider.setColorForeground( sliderForegroundColor );
  yAmpSlider.setColorActive( sliderForegroundColor );
  yAmpSlider.setId(4);
  yAmpSlider.setValue( startP );
  label = yAmpSlider.captionLabel();
  label.set( "Y amp" );
 
  // table controls
  txAngleSlider = controlP5.addSlider("txAngle",0,100,128,screenWidth+barXSpace,topOffset+barLength+barSpace,barWidth,barLength);
  txAngleSlider.setColorValue( sliderForegroundColor );
  txAngleSlider.setColorBackground( sliderBackgroundColor );
  txAngleSlider.setColorForeground( sliderForegroundColor );
  txAngleSlider.setColorActive( sliderForegroundColor );
  txAngleSlider.setId(1);
  txAngleSlider.setValue( startT );
  label = txAngleSlider.captionLabel();
  label.set( "tX freq" );
 
  txAmpSlider = controlP5.addSlider("txAmp",0,screenWidth/2,128,screenWidth+barXSpace*2,topOffset+barLength+barSpace,barWidth,barLength);
  txAmpSlider.setColorValue( sliderForegroundColor );
  txAmpSlider.setColorBackground( sliderBackgroundColor );
  txAmpSlider.setColorForeground( sliderForegroundColor );
  txAmpSlider.setColorActive( sliderForegroundColor );
  txAmpSlider.setId(2);
  txAmpSlider.setValue( startT );
  label = txAmpSlider.captionLabel();
  label.set( "tX amp" ); 
 
  tyAngleSlider = controlP5.addSlider("tyAngle",0,100,128,screenWidth+barXSpace*3,topOffset+barLength+barSpace,barWidth,barLength);
  tyAngleSlider.setColorValue( sliderForegroundColor );
  tyAngleSlider.setColorBackground( sliderBackgroundColor );
  tyAngleSlider.setColorForeground( sliderForegroundColor );
  tyAngleSlider.setColorActive( sliderForegroundColor );
  tyAngleSlider.setId(3);
  tyAngleSlider.setValue( startT );
  label = tyAngleSlider.captionLabel();
  label.set( "tY freq" );
 
  tyAmpSlider = controlP5.addSlider("tyAmp",0,screenHeight/2,128,screenWidth+barXSpace*4,topOffset+barLength+barSpace,barWidth,barLength);
  tyAmpSlider.setColorValue( sliderForegroundColor );
  tyAmpSlider.setColorBackground( sliderBackgroundColor );
  tyAmpSlider.setColorForeground( sliderForegroundColor );
  tyAmpSlider.setColorActive( sliderForegroundColor );
  tyAmpSlider.setId(4);
  tyAmpSlider.setValue( startT );
  label = tyAmpSlider.captionLabel();
  label.set( "tY amp" );
 
  //bottom row
  fadeSlider = controlP5.addSlider("num",1,num,128,screenWidth+barXSpace,topOffset+barLength*2+barSpace*2,barWidth,barLength);
  fadeSlider.setColorValue( sliderForegroundColor );
  fadeSlider.setColorBackground( sliderBackgroundColor );
  fadeSlider.setColorForeground( sliderForegroundColor );
  fadeSlider.setColorActive( sliderForegroundColor );
  fadeSlider.setId(5);
  fadeSlider.setValue( 200 );
  label = fadeSlider.captionLabel();
  label.set( "fade time" );
 
  lineWidthSlider = controlP5.addSlider("lineWidth",1,40,128,screenWidth+barXSpace*2,topOffset+barLength*2+barSpace*2,barWidth,barLength);
  lineWidthSlider.setColorValue( sliderForegroundColor );
  lineWidthSlider.setColorBackground( sliderBackgroundColor );
  lineWidthSlider.setColorForeground( sliderForegroundColor );
  lineWidthSlider.setColorActive( sliderForegroundColor );
  lineWidthSlider.setValue( 5 );
  label = lineWidthSlider.captionLabel();
  label.set( "line width" );
 
  sineVolumeSlider = controlP5.addSlider("sineVolume",0,1,128,screenWidth+barXSpace*3,topOffset+barLength*2+barSpace*2,barWidth,barLength);
  sineVolumeSlider.setColorValue( sliderForegroundColor );
  sineVolumeSlider.setColorBackground( sliderBackgroundColor );
  sineVolumeSlider.setColorForeground( sliderForegroundColor );
  sineVolumeSlider.setColorActive( sliderForegroundColor );
  sineVolumeSlider.setId(7);
  sineVolumeSlider.setValue( 0.5 );
  label = sineVolumeSlider.captionLabel();
  label.set( "sound volume" );
 
  contraryToggle = controlP5.addToggle("contraryToggle",false,screenWidth + barXSpace*4,topOffset+barLength*2+barSpace*2,20,20);
  contraryToggle.setColorValue( sliderForegroundColor );
  contraryToggle.setColorBackground( sliderBackgroundColor );
  contraryToggle.setColorForeground( sliderForegroundColor );
  contraryToggle.setColorActive( sliderBackgroundColor );
  contraryToggle.setId(6);
  label = contraryToggle.captionLabel();
  label.set( "table flip" );
}
 
 
 
//get updates from the controllers
void controlEvent(ControlEvent theEvent) {
  int id = theEvent.controller().id();
 
  if( id == 1 ) //xangle, map to sinex freq
  {
    float freq = map(xAngle, 0, 100, 50, 1600);
    sinex.setFreq(freq);
  }
  if( id == 3 ) //yangle, map to siney freq
  {
    float freq = map(yAngle, 0, 100, 50, 1600);
    siney.setFreq(freq);
  }
  if( id == 5 )
  {
    //wipe trails
    for(int i=0; i<num - 1; i++)
    { 
      mx[i] = 0;
      my[i] = 0;
    }
  }
  if( id == 6 )
  {
    if( rotateContrary == -1 )
    {
      rotateContrary = 1;
    }
    else
    {
      rotateContrary = -1;
    }
     
  }
  if( id == 7 )
  {
    siney.setAmp( sineVolume );
    sinex.setAmp( sineVolume );
    }
}
 
 
void draw()
{
  background(0);
  controlP5.draw();
  translate( screenWidth / 2, screenHeight / 2 );
 
  strokeWeight(lineWidth);
 
  for(int i=1; i<num; i++)
  { 
    stroke( lineColor, 255.0 / num * i );
    line( mx[i],my[i],mx[i-1],my[i-1]);
    mx[i-1] = mx[i]; 
    my[i-1] = my[i]; 
  } 
//  println( "xamp: " + xAmp + " yamp: " + yAmp );
//  println( "xangle: " + xAngle + " yangle: " + yAngle );
  mx[num-1] = sin( xangle ) * xAmp + sin( txangle ) *  txAmp;
  my[num-1] = sin( yangle ) * yAmp + sin( tyangle ) *  tyAmp * rotateContrary;
 
  xangle += xAngle / 500;
  yangle += yAngle / 500;
   
  txangle += txAngle / 500;
  tyangle += tyAngle / 500;
 
  if( xangle > TWO_PI ) {    xangle -= TWO_PI;   }
  if (yangle > TWO_PI) {     yangle -= TWO_PI;   }
  if( txangle > TWO_PI )  {    txangle -= TWO_PI;  }
  if( tyangle > TWO_PI )  {    tyangle -= TWO_PI;  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  out.close();
  minim.stop();
  super.stop();
}


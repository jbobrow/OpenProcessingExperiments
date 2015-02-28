
import ddf.minim.* ;
//global variables
//Number of background elements in each line
int HOR= 10;

//Number of background elements in each column
int VER=7;

//rotation coeffitiet will be multiplied by HALF_PI to rotate the background element
int rotationCoeff=0;

//Width and height of each back ground element, including the margin
int unitWidth;
int unitHeight;

//Origin coordination for rotation of eack single background element
int centerX ;
int centerY ;

//Enveleope width and height
int envWidth;
int envHeight;

//Global status of the program
//0 == Show Envelope, 1==Open Envelope , 2== Draw Text  , 3 == Display Text , 4 == Draw Background
int mode=0; 

//Declare a PImage variable type for envelope, the message, and the background element
PImage backgrnd;
PImage envelope;
PImage message;

//Audio libraries and variables
Minim minim;
AudioPlayer envelopeSound;
AudioSample melody;
boolean playing=false;

// setup()
void setup () {
  colorMode(RGB, 255);
  background (#000000);
  //Loading images for envelope, background element, and the message
  envelope= loadImage ("envelop.png");
  backgrnd= loadImage ("10.png");
  message = loadImage("16.png");

  //calculaing margine for each background element
  unitWidth = backgrnd.width+8;
  unitHeight = backgrnd.height+8;

  //initializing the origin for rotation
  centerX = backgrnd.width/2;
  centerY = backgrnd.height/2;

  //Specifying the window size based on fixed integer number of elements
  size (unitWidth*HOR, unitHeight*VER);

  //Initializng the envelope height and width
  envWidth = width;
  envHeight= height;

  //Initializing audio objects and loading audio files
  minim = new Minim(this);
  envelopeSound = minim.loadFile("Envelope.wav");
  melody = minim.loadSample("Melody.wav");

  frameRate(10);
}

void mouseClicked()
{
  if (mode==0)
  {
    //Changing the mode from 'show envelope' to 'open envelope', and start playing 'envelope open' sound
    mode=1;
    envelopeSound.play();
  }
}

void mouseMoved()
{
  if (mode==3)
  {
    //Changing the mode from 'show message' to 'draw background'
    mode+=1;
  }
}


//draw
void draw () {
  //The overal flow of the program is controlled here based on the value of 'mode'
  if (mode==0 || mode==1)
  {
    drawEnvelope();
  }
  else
  {
    if (mode<4)
    {
      drawText();
    }
    else 
    {
      drawBackground();
    }
  }
}


void drawEnvelope()
{
  //As long as mouse is not clicked on the envelop (mode == 0 == show envelope),
  //the full envelope is drawn. 
  image (envelope, (width -envWidth)/2, (height -envHeight)/2, envWidth, envHeight);

  if (mode==0)
  {
    //... and a text guides the user to click on the envelope.
    textSize(30);
    String clickText = "CLICK!"; 
    int txtWidth = int(textWidth(clickText));
    text(clickText, (width - txtWidth )/2, height/2.5); 
    fill(255, 255, 0);
  }
  else 
  {
    //When th mode changes to 1 (open envelope), the envelope starts to shrink
    envWidth = int(envWidth *0.9);
    envHeight = int(envHeight *0.9);
    //When the envelope sound is completely played, change the mode to 2 (show essage)
    if (!envelopeSound.isPlaying())
    {
      mode=2;
    }
  }
}

//This function draws background elements using random,locations, tint color, and pseudo-random rotation
void drawBackground()
{
  //Randomly choose where to draw the next element
  int x= int(random(0, HOR)) * unitWidth;
  int y= int(random(0, VER)) * unitHeight;

  //Change the origin to the center of the element to be drawn, as the rotation axis
  translate(x + centerX, y + centerY);
  rotationCoeff+=1;
  if (rotationCoeff>3)
  {
    rotationCoeff=0;
  }
  rotate( HALF_PI*rotationCoeff);

  //Change the origin back to point 0,0
  translate(-x - centerX, -y - centerY);

  fill(0);
  rect(x, y, unitWidth, unitHeight);
  //Tinting the white leaf of the background element flower with a range of pink - white colors 
  int c =  int( random(100, 255));
  tint(255, c, c);
  image (backgrnd, x, y);
}  

// This function draws the message
void drawText()
{
  //Start playing the sound if it inot started before  
  if (!playing)
  {
    melody.trigger();
    playing=true;
    mode=3;
  }

  image (message, 0, 0, width, height);
}



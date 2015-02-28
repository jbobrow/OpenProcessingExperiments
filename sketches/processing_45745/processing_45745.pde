
// ----------------------------------------------------------------------
// ------------ these are all the libraries we are using ----------------
// ----------------------------------------------------------------------

import processing.video.*;
import ddf.minim.analysis.*;
import ddf.minim.*;

// ----------------------------------------------------------------------
// --------------- these are all the variable declarations --------------
// ----------------------------------------------------------------------

Minim minim;
AudioPlayer jingle;
FFT fft;
int maxVolume;
//
int cellSize;        // Size of each cell in the grid
int cols, rows;      // Number of columns and rows in our system
PImage img;          // Variable for Image
int[] drawnPixels;   // variable for knowing what we've drawn/animated

float redAmount;     // red var
float greenAmount;   // green var
float blueAmount;    // blue var

// vars for our timer
int startingTime;
int timer;

// type of shape
String typeOfShape;

// type of shape
String musicFileName;

// draw an outline round each pixel
Boolean useOutline;

// use music
Boolean useMusic;

// -------------------------------------------------------------------------------------
// -------------------------- This is the setup function -------------------------------
// -------------------------------------------------------------------------------------
// -- this is where we set all the variables declared above with their initial values --
// -------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------

void setup() {
  
  size(500, 500);
  
// -------------------------------------------------------------------------------------
// -------------------------- This is where you can change stuff -----------------------
// -------------------------------------------------------------------------------------

  cellSize = 10;                  // change this if you want to make the pixels smaller/bigger
  useOutline = true;             // if you want an outline set this to true. Otherwise set it to false.
  useMusic = true;               // if you want to play music and animate to it set this variable to true
  typeOfShape = "circle";         // change the intial shape to draw - can be "square" "circle" or "triangle"
  musicFileName = "track.mp3";    // overwrite the existing track.mp3 file in the data folder with one of your own.
  img = loadImage("me.jpg");      // Change me.jpg in the data folder to your image you want to use
  
// -------------------------------------------------------------------------------------
// -------------------------------- Stop changing stuff --------------------------------
// -------------------------------------------------------------------------------------
 
  // leave these two lines alone as they size your image properly...
  img.resize(width, height);
  image(img, 0, 0);
  
  // initialise timer
  startingTime = millis();
  
  redAmount = 0;
  greenAmount = 0;
  blueAmount = 0;
  
  if(useMusic){
    minim = new Minim(this);
    jingle = minim.loadFile(musicFileName, 2048);
    jingle.loop();
    fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  }
  
  //set up columns and rows
  cols = width / cellSize;
  rows = height / cellSize;
  
  // init the drawnPixels array
  drawnPixels = new int[(cols * rows)];
  
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);


  
  // sets the background colour and alpha i.e background(color, alpha)
  background(0, 100);
  
  // uncomment this out if you want jagged outlines
  smooth();
}


void draw() {
  
  background(0);
  
  timer = (millis() - startingTime) / 1000;

  if(useMusic){
    maxVolume = getMaxVolume();
  }
  
  int fadeAmount = rows/height;

    // Begin loop for columns
    for (int i = 0; i < cols;i++) {
      
      // Begin loop for rows
      for (int j = 0; j < rows;j++) {

        // Where are we, pixel-wise?
        int x = i * cellSize;
        int y = j * cellSize;
        
        // Reversing x to mirror the image
        int loc = (img.width - x - 1) + y*img.width;

        // Each rect is colored white with a size determined by brightness
        color pixelColor = img.pixels[loc];
      
        // this either fills normally or based upon the volume
        if(!useMusic){
          fill(pixelColor);
        }else{
          fillUsingMusic(pixelColor, (maxVolume-(j*fadeAmount)));
        }
        
        // using either of these two set the outline
        if(!useOutline){
          noStroke();
        }else{
          stroke(0);
        }

        
        if (typeOfShape.equals("square")) {
          
          rect(x, y, cellSize+1 , cellSize+1);
        
        }else if(typeOfShape.equals("circle")){
          
          ellipse(x, y, cellSize+1, cellSize+1);
        
        }else if(typeOfShape.equals("triangle")){
          
          triangle(x,y, (x+(cellSize/2)+1), (y-cellSize+1), (x+(cellSize)+1), y);
        }
      }
    }
  
  
}


void fillUsingMusic(color pixelColor, int maxVolume){
  
// -------------------------------------------------------------------------------------
// -------------------------- This is where you can change colours ---------------------
// -------------------------------------------------------------------------------------
  
    if(timer < 10){
      
      // do nothing, just detect existing color amounts of pixel...
      redAmount = red(pixelColor);
      greenAmount = green(pixelColor);
      blueAmount = blue(pixelColor);
      
      typeOfShape = "circle";
      
      
    }else if(timer < 15){
      
      // create red/orange/yellow spectrum...
      // R:255, G:0-100, B:0
      
      redAmount = 20;
      greenAmount = brightness(pixelColor);
      blueAmount = 0;
      
      typeOfShape = "square";
      
    }else if(timer < 18){
      
      // create yellow/green spectrum...
      // R:0-100, G:150, B:0
      
      redAmount = brightness(pixelColor);
      greenAmount = 60;
      blueAmount = 20;
      
      // and switch the shape
      typeOfShape = "triangle";
      
    }else if(timer < 21){
      
      redAmount = 150;
      greenAmount = 0;
      blueAmount = brightness(pixelColor);
      
            typeOfShape = "circle";
      
    }else if(timer < 24){
      
      redAmount = 0;
      greenAmount = brightness(pixelColor);
      blueAmount = 255;
      
      // and switch the shape
      typeOfShape = "square";
       
    }else if(timer < 27){
      
      redAmount = brightness(pixelColor);
      greenAmount = 55;
      blueAmount = 255;
      
            typeOfShape = "triangle";
      
    }else if(timer < 30){
      
      redAmount = 50;
      greenAmount = brightness(pixelColor);
      blueAmount = 0;
      
// -------------------------------------------------------------------------------------
// -------------------------------- Stop changing colours --------------------------------
// -------------------------------------------------------------------------------------
      
    }else{
      // reset timer so that we go to the beginning again (top)
      startingTime = millis() - 10000;
      
      // and switch the shape
      typeOfShape = "triangle";
    }
    
    // fill pixel with different amounts of RGB and the alpha - dependant upon the volume: (red,green,blue,alpha);
    fill(redAmount, greenAmount, blueAmount, maxVolume);
}

// DONT TOUCH ANYTHING BELOW/HERE!!!
int getMaxVolume(){
  
    fft.forward(jingle.mix);
    int maxVolume = 0;
    for(int i = 0; i < fft.specSize(); i++)
    {
      // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
      line(i, height, i, height - fft.getBand(i)*4);
      if(fft.getBand(i)/3 > maxVolume){
        maxVolume = round(fft.getBand(i)/3);
      }
    }
    
    //println("maxVolume = " + maxVolume);
    
    return maxVolume;
}



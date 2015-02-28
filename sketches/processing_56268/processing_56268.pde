
//****************************
//  GhostMovie by @nastrup
//  http://www.nastrup.dk
//****************************

//import peasy.*;
import processing.opengl.*;
import fullscreen.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import processing.video.*;

//MEDIAREFERENCES
//Capture device
Capture mediaReference;
//Test image
//PImage mediaReference;
//Test Movie
//Movie mediaReference;

PImage screendump;
//Fullscreen function
SoftFullScreen fs;
//Camera
//PeasyCam cam;

//Record movie
MovieMaker mm;  // Declare MovieMaker object
boolean isRecording = false;

//Color image true/false
boolean isColor = true;

//Set factor for white frame around captureimage WARNING, IT CAN SERIOUSLY FUCK UP YOUR MEMORY!!!
float imgFactor = 10;

//width for capturedevice
int captureWidth = 800;
int captureHeight = 600;

//Dynamic width for canvas
int canvasWidth = captureWidth + 2*int(captureWidth/imgFactor);
int canvasHeight = captureHeight + 2*int(captureHeight/imgFactor);

int frameRateVariable = 24;
int backGroundColor = 255;

//Draw functions
int xTest;
int yTest;

// split the matrix by:
int gridSizeX = int(captureWidth/imgFactor);
int gridSizeY = int(captureHeight/imgFactor);

//Imagepath
String path = "";

void setup() {
  size(canvasWidth, canvasHeight, OPENGL); //UNCOMMENT FOR AUTAMTICALLY DETERMINE SIZE
  //size(960, 720, OPENGL);
  
  background(backGroundColor);    //set canvas background color
  frame.setLocation(100, 0);      
  smooth();                       // just to make things look nice
  frameRate(frameRateVariable);   // run the draw function once a second (frames per second or fps)   

  //cam = new PeasyCam(this, 255);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500); 

  //IF using image then open dialogue to browse for images
  // openDialogue();

  // Create the fullscreen object NOTE, doesn't work with multiple screens
  fs = new SoftFullScreen(this);
  // UNCOMMENT for fullscreen mode
  //fs.enter();

  mediaReference = new Capture(this, gridSizeX, gridSizeY);  //Set capture mediaReference
  
  //mediaReference = new Movie(this, "data/test2.MOV");
  //mediaReference.loop();

  //set image for screendump
  screendump = new PImage(canvasWidth, canvasHeight, ARGB);
  loadPixels();
}

void draw() {
  //rotateX(-.1);
  //rotateY(-.1);

  if (mediaReference.available()) {
    mediaReference.read(); // Read the new frame from the camera
    if (isRecording == true) {
      mm.addFrame();  // Add window's pixels to movie
    }
    
    //Center drawing
    translate(canvasWidth/(imgFactor*2), canvasHeight/(imgFactor*2));

    for (int x = 0; x < gridSizeX; x = x + 1)
    {
      for (int y = 0; y < gridSizeY; y = y + 1)
      {
        int cp = mediaReference.get(x, y);
        pushMatrix();
        translate(x*(imgFactor), y*(imgFactor), 0);

        //choose a random pixel to test for       
        xTest  = int(random(mediaReference.width));
        yTest  = int(random(mediaReference.height));

        if (isColor) {
          //COLOR!!!!
          stroke(cp, random(10, 100));
          //fill(cp);
        }
        else {
          //Black/White!!!!       
          stroke(brightness(cp), random(10, 100));
          //fill(brightness(cp), random(10, 100));
        }
        //Draw lines    
        line(x, y, xTest, yTest);
        //rect(x,y,10,10);        
        popMatrix();
      }
    }
  }
}

void keyPressed() {
  //Save image if keypressed = s     
  if (key == 's') {    
    //Create timestamp for filename
    String sDate = String.valueOf(day() + month() + year() + "-" + hour() + minute() + second());
    screendump = get();
    screendump.save("data/" + sDate + ".jpg");
  }
  //Start/stop movie if keypressed = space
  else if (key == ' ') {    
    if (isRecording == false) {
      //Create timestamp for filename
      String sDate = String.valueOf(day() + month() + year() + "-" + hour() + minute() + second());
      // Create MovieMaker object with size, filename,
      // compression codec and quality, framerate
      mm = new MovieMaker(this, canvasWidth, canvasHeight, "data/" + sDate + ".mov", frameRateVariable, MovieMaker.H263, MovieMaker.LOSSLESS);     
      isRecording = true;
    }
    else {
      mm.finish();
      isRecording = false;
    }
  }
}

//IF using image then open dialogue to browse for images
String openDialogue() {
  FileDialog fd = new FileDialog(new Frame(), "Open image file (jpg)", FileDialog.LOAD);
  fd.setFile("*.jpg");
  fd.setDirectory("data");
  fd.setLocation(50, 50);
  fd.show();
  path = fd.getDirectory()+fd.getFile();
  println(path);
  return path;
}



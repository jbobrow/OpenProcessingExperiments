
import fullscreen.*;
import japplemenubar.*;
import hypermedia.video.*;
import java.awt.*;
import controlP5.*;

FullScreen fs; 


OpenCV opencv;

int w =640;
int h = 480;
int threshold = 80;
int r=255;
int g=255;
int b=255;
int rememberTime = 8;

int contrast_value=40;


int amountOfBlobs = 10;

PImage[] imgArray = new PImage[amountOfBlobs]; 
PImage[] kirouFrameArray = new PImage[amountOfBlobs]; 
PImage copyimg; 

PImage kirouBackground = new PImage();
PImage kirouFrame = new PImage();
// width of the loaded frame edge
int kirouFrameWidth = 10;

ControlP5 controlP5;

int myColorBackground = color(0,0,0);

ControlWindow controlWindow;

boolean isDebug = true;




void setup() {

    size(w, h);
    
    //-----------Full Screen--------------------------------------------------------------------
       // Create the fullscreen object
        fs = new FullScreen(this); 
  
    // enter fullscreen mode
        fs.enter(); 
        
    //-----------END fullscreen mode------------------------------------------------------------

    
    // --- control P5 --------------------------------------------------------------------------
    controlP5 = new ControlP5(this);
    controlP5.setAutoDraw(false);
    controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);
    controlWindow.hideCoordinates();
    
    controlWindow.setBackground(color(40));
    //BLOBS-THRESHOLD
    Controller mySlider = controlP5.addSlider("amountOfBlobs",0,20,40,40,100,10);
    mySlider.setWindow(controlWindow);
    
    Controller mySlider2 = controlP5.addSlider("threshold",0,100,40,50,100,10);
    mySlider2.setWindow(controlWindow);
    //RGB
    Controller mySlider3 = controlP5.addSlider("r",0,255,40,60,100,10);
    mySlider3.setWindow(controlWindow);
    
    Controller mySlider4 = controlP5.addSlider("g",0,255,40,70,100,10);
    mySlider4.setWindow(controlWindow);
    
    Controller mySlider5 = controlP5.addSlider("b",0,255,40,80,100,10);
    mySlider5.setWindow(controlWindow);
    
    // remember time
    Controller mySlider6 = controlP5.addSlider("rememberTime",1,24,40,90,100,10);
    mySlider6.setWindow(controlWindow);
    
    //contrast
    Controller mySlider7 = controlP5.addSlider("contrast_value",0,255,40,100,100,10);
    mySlider7.setWindow(controlWindow);
  
    //debug button 
    
    Controller debugButton = controlP5.addToggle("isDebug",false,40,120,20,20);
    debugButton.setWindow(controlWindow);
    
  
    controlWindow.setTitle("Controll");
    
  
    //end controlP5 ------------------------------------------------------------------

    //Capture List---------------------------------
      
    
    //End Capture list----------------------------
    opencv = new OpenCV( this );
    opencv.capture(w,h);
    
    // loading images
    kirouBackground = loadImage("frontwall-small-resized.jpg");
    kirouFrame = loadImage("frame.png");
    
    frameRate(15);
}

void draw() {

    background(0);
    
    // OPENCV load video frame
    opencv.read();
    opencv.flip(OpenCV.FLIP_HORIZONTAL);
    
    // set region of interest ( don't use blobs on the side )
    opencv.ROI(40, 20, w-80, h-40);
    
    // Copy video frame in PImage copyimg
    copyimg = opencv.image();    
    
    // Display background (is Debug is not true), turn off tint
    noTint();
    if(!isDebug) image(kirouBackground, 0, 0);
    
    //image(copyimg,0,0);

    // OPENCV blob detection -------------------------------------------
    
    
      opencv.convert( OpenCV.GRAY); 
      opencv.contrast( contrast_value );   
      copyimg = opencv.image();        
      
      opencv.absDiff();     
      opencv.threshold(threshold);
      
      if(isDebug) image(opencv.image(),0,0);
      
      Blob[] blobs = opencv.blobs(600, w*h/6, amountOfBlobs, false);
    
    
    
    // -----------------------------------------------------------------
    
    if(isDebug)
    {   
        for( int i=0; i<blobs.length; i++ ) {
    
            Rectangle bounding_rect = blobs[i].rectangle;
            noFill();
            stroke(255,0,0);
            rect(bounding_rect.x, bounding_rect.y, bounding_rect.width, bounding_rect.height);
        }
    
    }
    else
    {   
        for( int i=0; i<blobs.length; i++ ) {
    
            Rectangle bounding_rect	= blobs[i].rectangle;
                   
            imgArray[i] = createImage(bounding_rect.width, bounding_rect.height, RGB);
            imgArray[i].copy(copyimg,bounding_rect.x, bounding_rect.y, bounding_rect.width, bounding_rect.height, 0, 0, bounding_rect.width, bounding_rect.height);
            
            
            tint(r,g,b);
            image(imgArray[i],bounding_rect.x, bounding_rect.y);
            noTint();
            
            //Frame uses kirouFrameWidth to make it bigger than the displayed image below it.
            image(kirouFrame, bounding_rect.x-kirouFrameWidth, bounding_rect.y-kirouFrameWidth, bounding_rect.width+kirouFrameWidth*2, bounding_rect.height+kirouFrameWidth*2);
        }
    
    }

    /* remember every frame or every x frames
       advantage of that is that the difference between the new and remembered frame is bigger
       that means bigger blobs, and people have to move less.     
    */    
    
    if(frameCount % rememberTime== 1) 
    { 
      //  flipped the image earlier, we need to flip it here too.
      opencv.remember(OpenCV.SOURCE, OpenCV.FLIP_HORIZONTAL);
    }
}




void keyPressed() {
  if(key==',') controlP5.window("controlP5window").hide();
  if(key=='.') controlP5.window("controlP5window").show();
  if(key=='/')saveFrame("kiroufirs-####.JPEG");
  // controlWindow = controlP5.addControlWindow("controlP5window2",600,100,400,200);
  // controlP5.controller("sliderValue1").moveTo(controlWindow);
}

public void stop() {
    opencv.stop();
    super.stop();
}


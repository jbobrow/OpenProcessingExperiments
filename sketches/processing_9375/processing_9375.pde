
import hypermedia.video.*;
import java.awt.*;
import controlP5.*;

OpenCV opencv;

int w =640;
int h = 480;
public int threshold = 15;
public int r=255;
public int g=255;
public int b=255;
public int blurLvl=20;
public int contrast_value=2;


public int amountOfBlobs = 10;

PImage[] imgArray = new PImage[amountOfBlobs]; 
PImage copyimg; 



ControlP5 controlP5;

int myColorBackground = color(0,0,0);

ControlWindow controlWindow;




void setup() {
  
  

    size(w, h);
    
    //control
    controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);
  controlWindow.hideCoordinates();
  
  controlWindow.setBackground(color(40));
  //BLOBS-THRESHOLD
  Controller mySlider = controlP5.addSlider("amountOfBlobs",0,10,40,40,100,10);
  mySlider.setWindow(controlWindow);
  Controller mySlider2 = controlP5.addSlider("threshold",0,50,40,50,100,10);
  mySlider2.setWindow(controlWindow);
  //RGB
    Controller mySlider3 = controlP5.addSlider("r",0,255,40,60,100,10);
  mySlider3.setWindow(controlWindow);
    Controller mySlider4 = controlP5.addSlider("g",0,255,40,70,100,10);
  mySlider4.setWindow(controlWindow);
    Controller mySlider5 = controlP5.addSlider("b",0,255,40,80,100,10);
  mySlider5.setWindow(controlWindow);
  //Blur Level
   Controller mySlider6 = controlP5.addSlider("blurLvl",0,255,40,90,100,10);
  mySlider6.setWindow(controlWindow);
  //contrast
  Controller mySlider7 = controlP5.addSlider("contrast_value",0,255,40,100,100,10);
  mySlider7.setWindow(controlWindow);

  //controlP5.addSlider("amountOfBlobs1",0,20,40,40,100,10);
  
  controlWindow.setTitle("Controll");
  
  //end controll

    opencv = new OpenCV( this );
    opencv.capture(w,h);
    opencv.loadImage( "frontwall-small-resized.jpg", width, height );
    opencv.loadImage("frame.png",width,height);
    

    PImage copyimg = new PImage(w,h); 
}

void draw() {

    background(0);
    
     controlP5.draw();
    
    opencv.read();
    opencv.flip(OpenCV.FLIP_HORIZONTAL);

    //copyimg.copy(opencv.image(),0,0,w,h,0,0,w,h);
    copyimg = opencv.image(); 
   
    
    noTint();
   //image( opencv.image(), 0, 0 ); 
    image( loadImage("frontwall-small-resized.jpg"), 0, 0);

    
 
      opencv.convert( OpenCV.GRAY); 
      opencv.contrast( contrast_value );   
      copyimg = opencv.image();
      opencv.absDiff();
      opencv.blur(OpenCV.BLUR, blurLvl);     
      opencv.threshold(threshold);
    //image(opencv.image(),0,0);
     
    Blob[] blobs = opencv.blobs( 80, w*h/3, amountOfBlobs, false);
    
    for( int i=0; i<blobs.length; i++ ) {

        Rectangle bounding_rect	= blobs[i].rectangle;
            
       
        imgArray[i] = createImage(bounding_rect.width, bounding_rect.height, RGB);
        imgArray[i].copy(copyimg,bounding_rect.x, bounding_rect.y, bounding_rect.width, bounding_rect.height, 0, 0, bounding_rect.width, bounding_rect.height);
        
        //Frame
       
        tint(r,g,b);
        image(imgArray[i],bounding_rect.x, bounding_rect.y);
        noTint();
        image( loadImage("frame.png"), bounding_rect.x-10, bounding_rect.y-10,bounding_rect.width+15,bounding_rect.height+15);
        
    }

    //frame differencing, remember last frame
    opencv.remember();
    
    //  flipped the image earlier, we need to flip it here too.
    opencv.remember(OpenCV.SOURCE, OpenCV.FLIP_HORIZONTAL);
}




void keyPressed() {
  if(key==',') controlP5.window("controlP5window").hide();
  if(key=='.') controlP5.window("controlP5window").show();
  // controlWindow = controlP5.addControlWindow("controlP5window2",600,100,400,200);
  // controlP5.controller("sliderValue1").moveTo(controlWindow);
}

public void stop() {
    opencv.stop();
    super.stop();
}


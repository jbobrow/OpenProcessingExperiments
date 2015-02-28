
//Arthur Siebesian
//Internet Art 3001 - Final Project 
//Instructor - Florence Gouvrit

import processing.video.*;

PImage img; // Pimage the variable to load an image onto the text
Capture myCapture; //capture is the camera function to get the camera on a computer to capture the video from the camera


void setup() {
  size(1920,1080);  //cznvas size
  background(0); //background color
  noCursor(); //makes the cursor disappear
  String[] cameras = Capture.list();  //the current available cameras on a computer
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");  //check to see if there is a camera
    exit();
  } else {
    println("Available cameras:");  //displays the available camera(s) and its frames
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    myCapture = new Capture(this, cameras[0]); // Begins the filming function
    myCapture.start();     //starts the function and makes it run
  }      
  
}//END SETUP()


  void captureEvent(Capture myCapture){
    myCapture.read();
  }
  
  
  
  void keyPressed() {  //keyPressed commands
    if (key == 'c') { //if c clicked the picture saves into the processing file
      save("Picture.tif"); //saved picture
     myCapture.stop(); //stops the camera from recording
    }else if(key == 'g') { //continues the recording, can also stop the recording
     myCapture.start();
     img = loadImage("Picture.tif"); //load the image that was previously saved

    }
  }
  void draw() {   
    tint(mouseX,mouseY,50,50); //mouse command for picture color
    image(myCapture,50,200, 700, 700); //the code for the size of the image that is being filmed
    if (key == 'i') { //keyPressed for a i command
    image(img,900,100,1900,900); //size of the loaded image
    image(img,random(width),random(height),random(width),random(height)); //size of the 2nd loaded image
    }else if (key == 'r'){ //reset command
    setup();  //resets form setup
    
  }
  }



  
 //Mini works-cited
/*
  http://forum.processing.org/one/topic/simple-still-image-capture-and-load.html
  http://processing.org/reference/libraries/video/Capture.html
http://processing.org/reference/keyPressed_.html
http://processing.org/reference/save_.html
http://processingjs.org/reference/tint_/
*/

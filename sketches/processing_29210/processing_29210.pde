
import hypermedia.video.*;
OpenCV opencv;
PImage bg;
PImage baby;
int numFrames= 47;//number of memories (frames)
PImage[] memories = new PImage [numFrames]; //creates the array
int currentFrame= 1;
int savedTime; //this will record the time when the function was last called
int timer1 = 5000; //how often we want to call the function in milliseconds


void setup () {
  smooth ();
  noStroke ();
  
  savedTime = millis();//Record the time at the start of the program (will be 0)
  size (1800, 900); 
  //opencv = new OpenCV(this);
  //opencv.capture (width/2,height); //open video stream
  bg = loadImage ("matrix.jpg");
    for ( int i = 1; i < 47; i++) {
    String imageName = "level." + nf(i, 1) + ".png";
    memories [i] = loadImage (imageName); //loeads each image
  }
 
}


void draw () {

background(bg); //how do i make background not overlap?
 frameRate(1);
  glitch ();
  collectitemsleft();
}

void collectitemsleft() {
  float r = random (width/2 );
  float r2 = random (height);
  //float r3 = random (80 ); //--> For image resize

  if (millis() < timer1*2) {
    image(memories[currentFrame], r, r2);
  }
    
   if (millis() > timer1*2 && (millis() < timer1*3)) {
    image(memories[currentFrame+1], r, r2);
  }

    
    
  if (currentFrame >= 47){
     currentFrame = 1; // Return to first frame
    } }



void glitch () {
  /* OPEN CV
   opencv.read(); //grab frame from screen
   image( opencv.image(), 0, 0 ); //display image
   image( opencv.image(), width, 0 ); //display image */
}



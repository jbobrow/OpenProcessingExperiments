
//this is a VideoShaker by boardmisha
//
//
//
///////////////////////////////////////////////////////////////////////////////////
//      HERE SPECIFY THE PARAMETERS OF SHAKING                                   //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////
//
//
//we are going to shake the picture horizontally and vertically
//if you call noise(value) one time and then call the same function from the same value again, it will again give you the same noise value again
//because the noise function is predetermined for every value and not accidental and not random
//in order for the horizontal and vertical directions of our shakes not to be identical to each other, we should set different initial values for xShake and yShake
float xShake=0.0; 
float yShake=-1.0; 

//shakes will not happen every frame but in random time intervals
float tShake=1.0;

//determine the shaking "violence", the bigger the more drastic
int violenceXShake=50;
int violenceYShake=50;


//determines if the direction of a shake at each step differs singnificantly from the previous shake
//for sure values between 0 and 1 affect somehow the shaking pattern but changing the numbers above 1, i cannot really see any difference
//[should read en.wikipedia.org/wiki/Perlin_noise to really see what to expect from which numbers]
float incXShake=3;
float incYShake=0.8;
float incTShake=1;

String filename="leaf5.m2v"; //put the video file that you want to run through the Shaker into the Sketch folder and write its name instead
int shakeThreshold = 70; //this parameter should be within 0 - 100 range, the lower the Threshhold the Shakier the video will be
//
///////////////////////////////////////////////////////////////////////////////////
//      THE CODE                                                                 //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////
//
//
//an included library that allows to work with video is called "Video"
import processing.video.*;

//Movie is a data type for video files
Movie myMovie;

//Unfortunately "Video" does not allow to save video files,
//this function is supported by an external library "GSVideo", 
//which has to be installed to the "libraries" folder in the "sketchbook" folder on Linux (the "Processing" folder on Windows)
import codeanticode.gsvideo.*;

//GSMovieMaker is a class that has metods to create movies by glueing frames together
GSMovieMaker mm;
int fps = 25;

void setup() {
  size(720, 576); //set here the dimension of your video file
  frameRate(fps); //frame rate, of displaying or of creating a new movie?

//Constructor for the datatype Movie is done with Movie(parent, filename)
//what is parent? it is said that parent is PApplet. what is PApplet? it is said PApplet a class that allows us to have access to all the Processing goodies.

//The Uncompressed Miscrosoft AVI file that I created with Premiere Pro could not be played.
//I don't know what was the problem with this file and the Video library
//mplayer opened the file OK, using ffv210 codec
//so I had to compress the file into some different format MPEG-2 container worked ok
//mplayer opens m2v with ffmpeg2 codec

  myMovie = new Movie(this, filename); 
  
  //here you specify the mode to play your video
  //"play" option plays the video only once, "loop" will play it again and again
  //however if the video does not have length
  myMovie.play(); 
  
  //now we need a new object wich will be the newly created shaking video
  //we cannot create such an object with the tools of "Video" library
  //but with GSvideo we can do it
  //the main example is here http://gsvideo.sourceforge.net/examples/MovieMaker/DrawingMovie/DrawingMovie.pde
  //
  //"width" is the width of the display window set in the "setup"
  //codecs that are supported by the library are:
  // THEORA
  // XVID
  // X264
  // DIRAC
  // MJPEG
  // MJPEG2K
  //*so maybe Microsoft AVI file could not be played because v210 codec is not supported by the library? But mpeg2 codec is neither in the list
  //anyways these are the container types supported
  // .ogg: OGG
  // .avi: Microsoft's AVI
  // .mov: Quicktime's MOV
  // .flv: Flash Video
  // .mkv: Matroska container
  // .mp4: MPEG-4
  // .3gp: 3GGP video
  // .mpg: MPEG-1
  // .mj2: Motion JPEG 2000
  //
  // it is said that some codec/container combinations don't seem to be compatible, for example THEORA+AVI or X264+OGG.
  //
  //
  //https://forum.processing.org/topic/gsvideo-no-such-gstreamer-factory
  //as it seems from the link above none of the codecs for moviemaking in GSvideo actually work but THEORA with OGG container
  //so maybe we need to wait for the fix
  //all quality settings are WORST, LOW, MEDIUM, HIGH and BEST
  //framerate for encoding should be the same as the project's framerate
  mm = new GSMovieMaker(this, width, height, filename.substring(0, filename.length()-4)+"Shaked.ogg", GSMovieMaker.THEORA, GSMovieMaker.BEST, fps);
    
  // There are two queues in the movie recording process: a pre-encoding queue and an encoding 
  // queue. The former is stored in the Java side and the later inside gstreamer. When the 
  // encoding queue is full, frames start to accumulate in the pre-encoding queue until its
  // maximum size is reached. After that point, new frames are dropped. To have no limit in the
  // size of the pre-encoding queue, set it to zero.
  // The size of both is set with the following function (first argument is the size of pre-encoding queue:
  mm.setQueueSize(0, 100);
  
  mm.start(); //start?
}

void draw() {
    background(0,0,0);
    float x=map(noise(xShake), 0.0, 1.0, -violenceXShake, violenceXShake);
    float y=map(noise(yShake), 0.0, 1.0, -violenceYShake, violenceYShake);
    float t=map(noise(tShake),0.0, 1.0, 0, 100);
    if (t>shakeThreshold) {
      image(myMovie, x, y);
    }
    else {
      image(myMovie, 0, 0);
    }  
    xShake=xShake+incXShake;
    yShake=yShake+incYShake;
    tShake=tShake+incTShake;
    loadPixels();
    // Add window's pixels to movie
    mm.addFrame(pixels);
    println("Number of queued frames : " + mm.getQueuedFrames());
    println("Number of dropped frames: " + mm.getDroppedFrames());
}


// movieEvent() function is called every time a new frame is available to read. We use the Movie.read() method to capture the current frame of the video
// which I guess will be displayed at the next run of draw() function
// [this movie event thing is not very clear]

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if (key == ' ') {
    // Finish the movie if space bar is pressed
    // I am not sure that not calling this function will crash the programm
    mm.finish();
    // Quit running the sketch once the file is written
    exit();
  }
}

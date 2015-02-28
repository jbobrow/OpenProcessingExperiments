
import processing.video.*;
Capture video;
int pix;
MovieMaker myMovie;

void setup() {
  size (340, 180); // Small 16*9 video
  println("press spacebar to stop the recording");
  //Variable = new MovieMaker(this, cameraWidth, cameraHeight, "Filename.mov", frameRate,  Codec, Quality);
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263,MovieMaker.BEST);
  video = new Capture(this, width, height, 25);
  background(0);
  noStroke();
  frameRate(5);
}
void draw() {
  // Draw Something Here

  //myMovie.addFrame(); // Adds what we just drew to the video file
}

void captureEvent(Capture c) {
  if (!c.available()) return;
  c.read();
  //copy(c, 0, 0, width, height, 0, 0, width, height);
  int rW = int(random(width));
  int rH = int(random(height));
  int w1 = int(random(width));
  int h1 = int(random(height));
  //copy(c, rW, rH, rW + 100, rH+100, rW, rH, int(random(width)), int(random(height)));
  int n = int(random(100));
  if(n<30){
    pix = 50;
  }else if (n>=30 || n<60){
    pix = 100;
  }else {
    pix = 200;
  }
  copy(c, rW, rH, rW + 100, rH+100, rW, rH, pix, pix); // copy random area from webcam and show at same position with bigger/smaller/orginal size
  copy(c, 0, 0, width, height, 0, 0, width/4, height/4);  // showing the orginal footage
  
  
  if(random(100)>0){
  //add color filter to footage with randomized color
  fill(random(255),random(255),random(255),int(random(70,80))); 
  //rect(int(random(width)),int(random(height)),100,100);
  rect(rW,rH,pix,pix);
 
  }

  myMovie.addFrame();
}

void keyPressed() {

    if (key == ' ') { // If we press spacebar...
    myMovie.finish(); // Stop recording
  }
}
void stop() {
  myMovie.finish(); // This finishes off the file properly...
  super.stop();
}



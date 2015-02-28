
import processing.video.*;
MovieMaker movie;
//set varies
boolean rec;
int n;
int varZero;
int prevN;
int prevZero;
int numPixels;
int prevPixels;
int[] prevCols;
Capture video;

void setup() {
  size(320, 240);
  frameRate = 30;
  video = new Capture(this, width, height, 72);
  numPixels = video.width * video.height;
  //Sets the number of pixels to be stored 
  prevPixels = ((numPixels*(width+1))/2); 
  //Sets the array to store these pixels.
  prevCols = new int[prevPixels];
  movie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);
  //Sets the movie recording function off by default.
  rec=false;
  loadPixels();
  noStroke();
}


void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
    //For each column of the image:
    //from left to right up to the end
    for (int x=0; x<width; x++) {
      n=(frameCount%(x+1));
      varZero= round((n*height)+(((sq(x)+x)*height)/2));
      //Declares the value of 'prevN'. This var will index to stored column
      prevN=((frameCount-x)%(x+1));
      prevZero=round((prevN*height) +(((sq(x)+x)*height)/2));
      //For each pixel in column 'x':
      //Drawing pixels
      for (int i=0; i<height; i++) {
        int ind=(x+i*width);
        prevCols[varZero+i]= video.pixels[ind];
        pixels[ind]=prevCols[prevZero+i];
      }
    }
    updatePixels();
    if (rec==true) {
      movie.addFrame();
      //Option set with keypressed to apply filters
      if (keyPressed==true && key=='1') {
        filter(INVERT);
      }
      if (keyPressed==true && key=='2') {
        filter(THRESHOLD);
      }
      if (keyPressed==true && key=='3') {
        filter(BLUR,6);
      }
      if (keyPressed==true && key=='4') {
        filter(POSTERIZE,4);
      }
    }
  }
}

void keyPressed () {
  //If SPACE key is pressed and recording is off, turn it on.
  if (key==' ' && rec==false) {
    rec=true;
    println("REC");
  }
  //If SPACE key is pressed and recording is on, turn it off.
  else if (key==' ' && rec==true) {
    rec=false;
    movie.finish();
    println("SAVED");
  }
}

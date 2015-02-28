
import processing.video.*;
MovieMaker movie;

boolean isRec;
int n;
int varZero;
int prevN;
int prevZero;
int numPixels;
int prevPixels;
int[] prevLines;
Capture video;

void setup(){
  size(640, 480);
  frameRate = 30;
  video = new Capture(this, width, height, 72);
  numPixels = video.width * video.height;
 
  prevPixels = ((numPixels*(height+1))/2); 
 
  prevLines = new int[prevPixels];
  movie = new MovieMaker(this, width, height, "recordMov.mov",
  30, MovieMaker.H263, MovieMaker.BEST);
  
  isRec=false;
  loadPixels();
  noStroke();
}


void draw(){
  if (video.available()){
    video.read();
    video.loadPixels();
  
    for (int y=1; y<height; y++){
	
	n=(frameCount%y);
	
	varZero= round((n*width)+(((sq(y)+y)*width)/2));
	
	prevN=((frameCount-(y-1))%y);
	
	prevZero=round((prevN*width) +(((sq(y)+y)*width)/2));

	for (int i=1; i<width; i++){
	  
	  int ind=((y*width)+i);
	  
	  prevLines[varZero+i]= video.pixels[ind];
	  
	  pixels[ind]=prevLines[prevZero+i];
	}
    }
    updatePixels();
    if (isRec==true){
	movie.addFrame();
    }
  }
}

void keyPressed (){
  //turn on recording.
  if (key==' ' && isRec==false){
    isRec=true;
    println("REC");
  }
  //trun off.
  else if (key==' ' && isRec==true){
    isRec=false;
    println("PAUSE");
  }
  //finish.
  else if (key==ESC){
    movie.finish();
    println("STOP");
  }
} 



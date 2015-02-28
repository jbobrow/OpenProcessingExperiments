
import krister.Ess.*;

PImage a;
Channel myChannel; 

String[][] aPixels;

//combined holds the concat. of r,g and b values in setup()
String combined;
String pixel;
color q;
String name = "meandfriend";

int c = 0;
int r = 0;
boolean process = true;

void setup() 
{

  // setup sound system
  // start up Ess 
  Ess.start(this); 

  // create a new Channel 
  myChannel=new Channel(); 

  // set the buffer size to 5 seconds 
  myChannel.initBuffer(myChannel.frames(5000)); 

  // load image
  a = loadImage(name + ".jpg");
  size(a.width, a.height);
  aPixels = new String[width][height];
  noFill();

//  image(a, 0, 0);

  //scan image pixel by pixel
//  for(int c=0; c<height; c++) {
//    for(int r=0; r<width; r++){
//      q = get(r,c);
//
//      int thered = 100 + ((int)red(q)*2);
//      float thegreen = (float)green(q) / 255;
//      int theblue = (int)blue(q);
//
//
//      // generate 3 seconds of a soft triangle wave 
//      myChannel.wave(Ess.SINE,thered,thegreen,0,myChannel.frames(theblue)); 
//
//      // play 
//      myChannel.play();  
//      //playsound();
//      //combined = "(" + (int)red(q) + "," + (int)green(q) + "," + (int)blue(q) + ") ";
//      // aPixels[r][c] = combined;
//    }
//  }

}

void draw() {
//  for(int c=0; c<height; c++) {
  //  for(int r=0; r<width; r++){
      q = a.get(r,c);
      set(r, c, q);
      int thered = 100 + ((int)red(q)*2);
      float thegreen = (float)green(q) / 255;
      int theblue = (int)blue(q);


      // generate 3 seconds of a soft sine or triangle or sawtooth wave 
      myChannel.wave(Ess.SINE,thered,thegreen,0,myChannel.frames(theblue)); 

      // play 
      myChannel.play();  
      //playsound();
      //combined = "(" + (int)red(q) + "," + (int)green(q) + "," + (int)blue(q) + ") ";
      // aPixels[r][c] = combined;
   // }
    if (r==width) {
    r = 0;
    c++;
    if (c == height) {
      process = false;
    }
    } else {
      r++;
    }
    
    
//  }
}

void audioChannelDone(AudioChannel ch) {
  println("AudioChannel "+ch+" is done playing.");
}


//void playsound(){

// red value = frequence
// green value = volume
// blue value = duration - total sample count


// generate 3 seconds of a soft triangle wave 
//  myChannel.wave(Ess.SINE,thered,thegreen,0,myChannel.frames(theblue)); 

// play 
//







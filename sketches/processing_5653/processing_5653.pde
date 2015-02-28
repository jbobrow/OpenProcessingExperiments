

// import minim library
import ddf.minim.*;
import ddf.minim.signals.*;

//thumbnail images
PImage thumb1;
PImage thumb2;
PImage thumb3;

//thumbnail image postions
int thumb1x= 50;
int thumb1y= 400;
int thumb2x =200;
int thumb2y = 400;
int thumb3x =350;
int thumb3y = 400;

//main images to be analyzed
PImage image1;
PImage image2;
PImage image3;

//current image to be analyzed
int activeimage = 0;

//note time and durations
long lastNoteTime;
boolean playNextNote = false;
int noteDuration;

//Minum sound generation
Minim minim;
AudioOutput out;
SineWave sinewave;

//color infor from current pixel
color q;

//current pixel position
int c = 0;
int r = 0;

//if sound processing is running
boolean process = false;



//create setup (runs once at the beginning)
void setup () {
  size (800, 600);
  background (0);
  stroke(255);
  smooth();

  //load thumbnail image info
  thumb1= loadImage("ursocoolimage2x100.jpg");
  thumb2= loadImage("ursocoolimage3x100.jpg");
  thumb3= loadImage("ursocoolimage4x100.jpg");


  //load main image info
  image1 = loadImage("ursocoolimage2.jpg");
  image2 = loadImage("ursocoolimage3.jpg");
  image3 = loadImage("ursocoolimage4.jpg");


  //Using Minum to get sound

  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out

  sinewave = new SineWave(440, 0, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sinewave.noPortamento();
  // add the oscillator to the line out
  out.addSignal(sinewave);
}

//create draw (one on each frame)
void draw(){

  //draw thumbnails

  image(thumb1, thumb1x, thumb1y);
  image(thumb2, thumb2x, thumb2y);
  image(thumb3, thumb3x, thumb3y);
  //image(thumb2, 0, 0);
  //image(thumb3, 0, 0);

  //draw white rect for outline of main image
  color (255, 255, 255);
  noFill();
  rect (249, 49, image1.width +1, image1.height +1); 

  //if sound processing is on
  if ( process == true){

    //if we are ready to move to the next pixel
    if (playNextNote == true){

      
      //r = (int)random(0, image1.width);
      //c = (int)random(0, image1.height);

      // grab color infor from the active imaage from the active pixel
      if (activeimage == 0){
        //image(image1, 50, 50);
        q =image1.get(r,c);
      } 
      else if (activeimage ==1){ 
        //image (image2, 50, 50);
        q =image2.get(r,c);
      }
      else{
        //image(image3, 50, 50);
        q =image3.get(r,c);
      }

      //draw the active pixel on the canvas
      set(r+250, c+50, q);

      //calculate the red, green and blue values of the active pixel
      float thered = map((float)hue(q), 0, 255, 220, 300);
      float thegreen = map((float)saturation(q), 0, 255, 0.3, 1.0);
      float theblue = map((float)brightness(q), 0, 255, 1, 8)*10;

      // Set the freq, volume and duration of the active color values
      sinewave.setFreq(thered);
      sinewave.setAmp(thegreen);
      noteDuration = (int)theblue;

      //print the values to the consol
      println (red(q)+" "+green(q)+" " +blue(q));

      //determine the next pixel
      if (r==image1.width) {
        r = 0;
        c++;
        if (c == image1.height) {

          imageDone();
        }
      } 
      else {
        r++;
      }
      playNextNote = false;



      //time when last note is played
      lastNoteTime = millis();
    }
    else{ 
      long elapsedTime = millis()-lastNoteTime;
      if(elapsedTime > noteDuration){
        playNextNote = true;

      }


    }
  }
}


void  mousePressed() {

  //if mouse is over image 1 then begin to analyze

  if(mouseX>thumb1x &&  mouseX<thumb1x+thumb1.width && mouseY> thumb1y && mouseY< thumb1y+thumb1.width){
    println("i clicked on image 1");
    activeimage= 0;
    startNewImage();
  }



  if(mouseX>thumb2x &&  mouseX<thumb2x+thumb2.width && mouseY> thumb2y && mouseY< thumb2y+thumb2.width){
    println("i clicked on image 2");
    activeimage =1;
    startNewImage();
  }



  if(mouseX>thumb3x &&  mouseX<thumb3x+thumb3.width && mouseY> thumb3y && mouseY< thumb3y+thumb3.width){
    println("i clicked on image 3");
    activeimage =2;
    startNewImage();
  }


}

//reset the values for analyzing the new image
void startNewImage(){
  playNextNote = true; 
  background(0);
  process= true;
  r=0;
  c=0;

  // sinewave.setAmp(0.5);


}

//stop playing sound when analyzation of active image is complete
void imageDone(){
  process =false;

  sinewave.setAmp(0);






}









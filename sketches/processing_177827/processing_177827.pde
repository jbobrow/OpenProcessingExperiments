
//
// Introduction to Computational Arts
// Final Project - Bringing It All Together (Project 3 (Processing, Sound and Image) - FF)
//

/*
I have created a slide show using processing code.
I am presenting overview of cool things which I learnt in 3 modules of this course.

KEYS INPUT FOR ALL SLIDES:
  Press ‘N’ for next slide
  Press ‘B’ for previous slide
  Press ‘M’ to mute my voice
  Press ‘U’ to un-mute my voice
  Press ‘DELETE’ or ‘BACKSPACE to restart slide show
  Press ‘S’ to save any slide

First Slide :  Introduction and controls for the slide show.

Second Slide : Overview of Processing module.
  Screenshots of all processing assignments and my recorded speech for processing module.
  MOUSE INPUT:
    MOUSE Pressed  - x,y coordinate recorded as start point
    MOUSE Released - x, y coordinate recorded as end point
    drag: draw -  creates basic shape(rectangle or ellipse), once drag is finished.
    The above basic shape would be filled with random color.
  
    After releasing the mouse, it would create 
    1. rectangle, if it is odd drag event.
      eg: if user drags(clicks n releases) mouse 1st, 3rd, 5th... times
    2. ellipse, if it is even drag event.
      eg: if user drags(clicks n releases) mouse 2nd, 4th, 6th... times
  KEYS INPUT:
    Press number 1,2,3 : change the strokeweight to 2, 5, 8 for next shape.

Third Slide : Overview of Visual Arts module.
    Screenshots of all visual assignments and my recorded speech for visual module.
    
Fourth Slide : Overview of Sound Arts module
    Screenshots of all sound assignments and my recorded speech for audio module.
    MOUSE INPUT:
      MOUSE Pressed  - very short audio clip having cat meow, my voice and cucckoo sound will start..
      MOUSE Pressed Again  - audio clip would be stopped.      
*/

//Import 'Minim' library files
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Declare global variables
Minim minim;
AudioPlayer cat;

// Global variable for my voice on each slides.
String[] audioFileNames = {"slide0", "slide1", "slide2", "slide3"};
AudioPlayer[] audioOnSlide = new AudioPlayer[audioFileNames.length];

// flag to mute my voice
boolean muteMyVoice = false;

// stroke style
color strokeColor = #CF09EA;
int strkwght = 2;

// location coordinate
float startX, startY;
float endX, endY;
boolean actionfinished = false;

// drag/shape count
int dragKount = 0;

// slide counter
int slideIndex = 0;

// color pallete of 10 colors
color[] palette={#77FF00,#E89F0C,#FF0000,#3E0CE8,#0DFFF2,#FFFBDD,#B1E879,#6DFF9D,#58E0E8,#6D93FF};

// Declare a PImage variable type
String[] imageNames = {"firstslide.png", "processingimg.png", "visualimg.png", "soundimg.png"};
PImage[] slides = new PImage[imageNames.length];

String[] footerTexts = {"", "Processing Module", "Visual Arts Module", "Sound Arts Module"};

// setup()
void setup(){
  size(800,600);
  colorMode(HSB, 360, 100, 100, 100);
  for(int i=0; i<imageNames.length; i++){
    slides[i]=loadImage(imageNames[i]);
  }
  
  minim = new Minim(this);
  cat = minim.loadFile("cat_koel.wav");

  for (int i=0; i<audioFileNames.length; i++){
    audioOnSlide[i]= minim.loadFile(audioFileNames[i]+".wav");
  }
  
  showFirstSlide();
}

//draw()
void draw(){ 
  
  // Drawing basic shapes only on 'processing module' slide.
  if(slideIndex == 1){
    if(actionfinished){
      //style
      strokeWeight(strkwght);
      stroke(strokeColor);
      
      int clrIndx = (int)random(0,10);
      fill(palette[clrIndx]);    
      if(dragKount % 2 == 0){
        // Set ellipseMode to CORNERS      
        ellipseMode(CORNERS);
        ellipse(startX, startY, endX, endY);
      }else{
        float wid = endX-startX;
        float hei = endY-startY;      
        rect(startX, startY, wid, hei);
      }
      actionfinished = false;
    }
  }
}

// create footer
void createFooter(){
  // style
  strokeWeight(1);
  stroke(#050505);
      
  // draw rectangle to show footer text
  fill(#A689BF);
  rect(0,560,800,40);
  
  // font color black.
  fill(#000000);
  textSize(20);
  textAlign(CENTER);
}

// This method would capture mouse press by user on slide 1(processing module) and slide 3(audio arts).
void mousePressed() {
  println("mouse is pressed."); 
  // record start point coordinate
  startX = mouseX;
  startY = mouseY;

  // 'processing module' slide footer will show shape being drawn by user
  if(slideIndex == 1){
    // create footer
    createFooter(); 
    
    // text in footer  
    text("Drawing " + (dragKount % 2 == 0 ? "rectangle" : "ellipse") + ".", width/2, height-10); 
  }else if(slideIndex == 3){
    // if user clicks on slide#3(audio arts), then it would play sound. Second click would stop the audio.
    if(cat.isPlaying()){
      off();
    }else{
      onn();
    }
  }
}

// This method is used to draw shapes on 'processing module' slide
void mouseReleased() {
  //record end point coordinate  
  endX = mouseX;
  endY = mouseY;
  println("mouse is released.");
  
  // 'Processing module' slide
  if(slideIndex == 1){
    // drag finished flag
    actionfinished = true;
    
    // drag/shape count
    dragKount++;
  }
}

// start the cat voice
void onn(){
  cat.rewind();
  cat.play();
}

// stop the cat voice
void off(){
  cat.pause();
}

void stop(){
  cat.close();
  minim.stop();
  super.stop();
}

void keyPressed(){
  switch(key){
    // Go to next slide
    case 'n':
    case 'N':
      if (slideIndex >=0 && slideIndex < 3){
        slideIndex++;
        showNextSlide(slideIndex);
      }else if (slideIndex == 3){          
        off();        
        slideIndex = 0;
        showFirstSlide();
      }
      break;
    // Go to previous slide      
    case 'b':
    case 'B':
      if(slideIndex > 0 && slideIndex <= 3){
        slideIndex--;      
        showNextSlide(slideIndex);
        if(slideIndex != 3 && cat.isPlaying()){
          println("cat playing");
          off();
        }
      }else if(slideIndex == 0){
        slideIndex = 3;
        showNextSlide(slideIndex);
      }
      break;
   // This is to erase drawing from 'processing slide'   
   case 'e':
   case 'E':
      if(slideIndex == 1 ){
        showNextSlide(slideIndex);
      }
      break;
   // This is to mute my voice:   
   case 'm':
   case 'M':
      muteMyVoice = true;
      offMyVoice(audioOnSlide[slideIndex]);
      break;
   // This is to un-mute my voice:   
   case 'u':
   case 'U':
      muteMyVoice = false;
      onnMyVoice(audioOnSlide[slideIndex]);
      break;
   // save in file 'screeencapture.png'
   // save in file 'screeencapture.png'
   case 's':
   case 'S':
    saveFrame("screeencapture.png");
    break;   
  }
}

void keyReleased(){
  
  // Clear the slide and start from first slide.
  if(key==DELETE || key==BACKSPACE){
    slideIndex = 0;
    showFirstSlide();
  }
  
  // Change the strokeweight based on user presses 1,2,3
  switch(key){
    case '1':
      strkwght=2;
      break;
    case '2':
      strkwght=5;    
      break;
    case '3':
      strkwght=8;    
      break;
  }
}

// show first slide without footer
void showFirstSlide(){
  background(360);
  image(slides[0],0,0,width,height);
  playAudio(0);
}

// Show the given slide number
void showNextSlide(int slideNum){
  println("slide number : " + slideNum);
  
  if(slideNum == 0){
    showFirstSlide();
  }else{    
    background(360);
    image(slides[slideNum], 0, 0, width, height-40);
    
    // create footer
    createFooter();
    
    // text in footer  
    text(footerTexts[slideNum], width/2, height-10); 
    playAudio(slideNum);    
  }
}

// Play the audio for the given slide number.
void playAudio(int slideNum){
  for(int i=0; i<audioFileNames.length; i++){
    if(i != slideNum){
      audioOnSlide[i].pause();
    }
  }
  
  if(audioOnSlide[slideNum].isPlaying()){
    return;
  }
  audioOnSlide[slideNum].rewind();  
  if(muteMyVoice == false){
    audioOnSlide[slideNum].play();    
  }
}

// start my voice
void onnMyVoice(AudioPlayer palyer){
//  palyer.rewind();
  palyer.play();
}

// stop my voice
void offMyVoice(AudioPlayer palyer){
  palyer.pause();
}



 /* The idea of my project is to explore the effect of sound and dessign interaction.   
 This sketch draws sinusoidal lines while an audio sample with a delay effect is played in loop.
 The frequency, color and localisation of the lines and the delay parameters depend on mouse imputes. */  

/* @pjs preload="image.jpg"; */

 
// ------ Import Minim library tu support audio------- 
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.spi.*; 
 

// ------------------------------- 
// ------ Global Variables -------
// -------------------------------


// ------ Drawing global Variables -------

float Nx; // discretization in x 
float Lx; // size of the grid in x
float Ny; // discretization in y 
float Ly; // size of the grid in y
boolean b=true; // decides if the sketch is restarted when mousePressed
PImage image; // auxiliary image for help  
 
// ------ Sound global Variables -------

 
Minim minim; //  To manage audio within the sketch
FilePlayer filePlayer; // To play audio files
AudioOutput out; // Sends the audio to the computer's sound card
Delay delay; // Audio delay effect 
boolean d=false; // decides if the the sound has delay or not 
 
 
// -------------------- 
// ------ Setup -------
// --------------------

void setup() { 
  
  // ------ draw setup -------
  size(800,600);
  colorMode(HSB,360,100,100); 
  background(360); 
  noFill(); 
  strokeWeight(4);
  frameRate(20);
  image = loadImage("image.jpg"); // load auxiliary image
  
  
  
 // ------ audio setup -------
  minim = new Minim(this); // create a Minim object for loading audio  
  out = minim.getLineOut(); // initialize the output
  AudioRecordingStream myFile = minim.loadFileStream("son.wav",1024,true); // set a file player with the sound "son.wav"
  filePlayer = new FilePlayer(myFile); // opens the sound and puts it in the "play" state. 
  filePlayer.loop(); // loop sound 
  delay = new Delay(0.2,.5,true,true); // initialize delay effect
  filePlayer.patch(out); //  send the file player to the output
  
  
  // ------ set instructions -------
  image(image,0,0,800,600);    
}

// -------------------- 
// ------ Draw -------
// --------------------

void draw(){  
  
  // ------ set discretization in x and y depending on the mouse position -------
  Nx=int(map(mouseX,0,width,0,25));  
  Lx=width/Nx;
  Ny=map(mouseY,0,height,500,1000);
  Ly=height/Ny; 
  
  // ------ draw sinusoidals lines -------  
  if (mousePressed){
  if(b) {background(360);}     
    for(float i=0; i<Nx; i+=1.5){ 
        for(float j=0; j<Ny; j++){
         stroke(map(j,0,Ny,0,360),map(mouseX,0,width,35,100),map(mouseY,0,height,25,95));  
         point((i+.5)*Lx+sin((j+.5)*Ly)*Lx*.5,(j+.5)*Ly); 
        }
    }
  } 
}

// --------------------------------- 
// ------ Interactive Inputs -------
// ---------------------------------

// ------ Mouse inputs -------
 
void mouseMoved(){ 
  
  
  // ------ Change delay parameters -------
  if(d){
    delay.setDelTime(constrain(map(mouseX,0,width,0.0001,0.1),0.0001,0.1));
    delay.setDelAmp(constrain(map(mouseY,0,height,0.75,0.0),0.75,0.0)); 
  }
  
}
 

// ------ Keyboard inputs -------

void keyPressed() { 
  
  // ------ save picture -------
  if (key=='s' || key=='S') saveFrame("screenShot.png");
  
  // ------ start again and get help -------
  if (key == ' ') {   
    image(image,0,0,800,600);  
    b=true;  
  } 
  
  // ------ set draw mode -------
  if(key=='b'){ b=!b; }
  
   
  // ------ delay on/off -------
  if(key=='d'){ 
    d=!d; 
    if(d){ filePlayer.patch(delay).patch(out); println("delay on");} 
    else{ filePlayer.unpatch(delay); filePlayer.patch(out); println("delay off");} 
   }
   
}  
 
 


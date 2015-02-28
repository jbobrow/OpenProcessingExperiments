
/*
ARTD 252 (Lab 2-4pm Josh Wardle)
 Leon Simon Sanchez
 04/25/2011
 
 Title: Plastic Problems
 
   Human impact in the environment is globally evident. The most ubiquitous human artifact by far
 is plastic. It is strong, flexible, pliable and non-degradable. Everything that makes plastic
 a superb material, also makes it an environmental hazard. With this sketch I hope to provoke 
 the user to think about plastic, its uses, and consequences of use. Is plastic inherently bad,
 or does it only become so when we mishandle its disposal and it subsequently enters into the 
 environment at large?  This sketch places the user in the world of a plush sea turtle in an 
 altered landscape. Swimming through the "soundscape", the user watches the pleasent
 visual feast and becomes a part of the musical experience. 
 
   The sketch takes a loaded song's waveform and outputs a histogram of the sound levels (frequency bands)
to the screen. The image is copied back at an angle and slowly fades to create a 3D effect. The other walls of
the space are composed of the trails made form the original background image. The cursor is a stop animation of
a plush turtle swimming through this environment. The user can control where the turtle swims by moving the mouse.
By clicking the mouse the frames of the animation are copied back along with the waveform, enhancing the 3 dimensional
aspect of the sketch.
 
 I watched the series of 5 tutorials by Andy Best at 
 -http://andybest.net/2010/01/5-processing-video-tutorials/
 In this program you'll find a modified version of his sound
 analyzer using FFT, using a loaded song (Gorillaz, Plastic Beach)
 intead of a stream from the microphone. In the future I would 
 like to do sketches that take sound from the sound card, 
 utilizing whatever sound stream the user is listening to, 
 iTunes, youtube, etc and make a visualizer for music.
 */

//FFT is a an algorithm for fast Fourier transform, which allows the sketch to split the sound
//into frequencies to be visualized as a bar graph.
//Loads the library for working with sound analysis.
//Minim is an audio library that uses the JavaSound API
//Loads the OpenGl library
import processing.opengl.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioPlayer song;
FFT fft;
//Variable to store the foreground frames to be repeated.
PImage fade;
//Initialize the variable that will store the background.
PImage bg;
//Sets up variables and array of images for the swimming turtle cursor.
int frame = 0;
//Number of frames in the cursor animation
int numberOfFrames = 19;
//Creates the array to store the frames of cursor animation
PImage[] images = new PImage[numberOfFrames];
//Sets the width and height of the fade image.
float rWidth, rHeight;
//Stores the stroke weight for each bar drawn to the screen
int w;
//Value used to cycle through the HSV color spectrum for the Fourier transform of the sound file
int hValue;



void setup()
{
  //Sets the screen size to the same size as background image,
  //and uses the OpenGl renderer for smoother rendering.
  size(1024, 768, OPENGL);
  //Removes arrow cursor
  noCursor();
  //loads the background image into "bg"
  frameRate(20);
  bg = loadImage("oceanPolluted.jpg");
  minim = new Minim(this);
  //loads the song to be played and analyzed.
  song = minim.loadFile("Plastic Beach.mp3", 2048);
  //Sets the song to loop when finished.
  song.loop();
  // Creates an FFT object .
  fft = new FFT(song.bufferSize(), song.sampleRate());
  //Averages contigous frequency bands logarithmically into groups
  fft.logAverages(63,7);
  stroke(255);
  //Sets the width of the bars, changing the multiplier will make them skinnier or wider(smaller number wider bars)
  w = width/(1*fft.avgSize());
  strokeWeight(w);

  //Sets the background image to the loaded one
  image(bg, 0, 0);
  //Sets the boundaries of the saved image to later use to give the equalizer a fade effect
  fade = get(0,0, width, height);
  //Setting the width and height of the fade image, making it 99% original size will assist 
  //in the fade effect
  rWidth = width*0.99;
  rHeight =height *0.99;
  hValue = 0;

  //Loop to load each image for the swimming turtle cursor.
  for(int i = 0; i < images.length; i++) {
    images [i] = loadImage (i + ".gif");
  }
}

void draw()
{
  //Draws the background.
  image(bg, 0, 0);
  //Sets color that the sound visualizer will have, and allows for the slow fade (254 is a little transparent).
  tint(255, 255, 255, 254);
  //Loads the frame saved in previous iteration and prints to screen and positions it moving backwards
  //along the left wall
  image(fade, (width-rWidth)/2, (height-rHeight)/2, rWidth, rHeight);
  noTint();
  //Does not draw outlines on the fourier transfo
  stroke(255);
  //Analyzes the song as a mix of two stereo channels, and iterates through the sound spectrum.
  fft.forward(song.mix);
  //Changes color mode to hue saturation and brightness, so as to be able to cycle through the color spectrum
  colorMode(HSB);
  //As program iterates the value HValue changes by one and so the rainbow effect
  stroke(hValue, 255, 255);
  colorMode(RGB);
  //Cycles through the color by adding 1 to the hue value
  hValue +=1;
  //To reset the hue to zero when it reaches 255, since there are only 256 color values
  if(hValue >255) {
    hValue = 0;
  }
  //Iterates until every part of the spectrum is drawn
  for(int i = 0; i < fft.specSize(); i++)
  {
    // Draws the line for frequency i. The multiplier makes the bars larger on screen.
    line(i, height, i, height - fft.getBand(i)*16);
    //If mouse is pressed a print of the turtle is copied backwards along with the waveform
    if (mousePressed == true) {
      image (images[frame], mouseX, mouseY);
      
    }
  }
  //Sets fade to the previous screen rendered, starting from the corner (0,0) to the window's width and height
  fade = get(0,0, width, height);
  fill(255);
  //Change stroke color to white
  stroke(255);
  //The foreground will be more visible as it will be colored white, standing out from the colored bars
  for(int i = 0; i < fft.specSize(); i++)
  {
    // Draws the line for frequency i. The multiplier makes the bars larger on screen.
    line(i, height, i, height - fft.getBand(i)*16);
  }
  //Cycles through 1 frame of the cursor animation every iteration
  frame = (frame + 1) % numberOfFrames;
  //The animation will appear as the cursor, noCursor(); removes the arrow cursor
  
  image (images[frame], mouseX, mouseY);
  
}

void stop()
{
  // Good form to close the minim object when done using it.
  song.close();
  minim.stop();

  super.stop();
}



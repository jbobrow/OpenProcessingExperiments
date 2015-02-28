
 /*
 / Flowline Visualizer
 / Version 0.2
 / Chris Thomas 2011
 / Chris.debug.Thomas@gmail.com
*/

 /*
 / Summary
 / This Visualizer works off 3 simple concepts.
 / First a colored line is drawn through the center of the screen.
 / Then each column of pixels is shifted vertically with wrapping, according to the wavefrom amplitude.
 / Finally Pixels on the barrier between the top and bottem screen have their color modified.
*/

 /*
 / Credits
 / Thanks to Damien for creating the exceptionally easy to use Minim sound library.
 / Thanks to Cyjet for releasing awesome Music under Creative Commons.
 / http://soundcloud.com/cyjet/sets/isometry/
 / The song used in this example is called Prism.
*/

// Minum Setup
import ddf.minim.*;
Minim minim;
AudioPlayer wave;

// Graphics Buffers
PImage buffer; // Holds entire screen during modification
PGraphics rainbow; // Used for single-pixel bands at top and bottem of screen

// Constants
static int WIDE = 900; 
static int TALL = 256; 
static int AUDIO_BUFFER_LENGTH = 4096; // small values make the visualizer look better, but cause skipping.
static int AMPLITUDE = 32; // Multiplier for the waveform, quiet songs may need more. 16-32 is good for most songs.
// The Demo song is queit, so 32 is the default

// global Variables
int vshift; //holds the waveform amplitude for each shift.
int yy; //the calculated destination of each pixel during shift.
int col=0; // color, oscillates over time.

void setup()
{
   // Graphics Setup
   size(WIDE, TALL, P2D);
   colorMode(HSB); // This visualization uses hue-shifting to set the colors.
   background(0);
   rectMode(CORNERS); // Used for the centerline
   buffer = createGraphics(WIDE, TALL, P2D); //whole screen buffer
   rainbow = createGraphics(WIDE, 1, P2D); // Single pixel line
   
   //This block of code initializes the rainbow line
   rainbow.beginDraw();
   rainbow.background(255);
   rainbow.endDraw();  
   
   //Sound Setup
   minim = new Minim(this);
   wave = minim.loadFile("Cyjet - Prism.mp3",AUDIO_BUFFER_LENGTH);
   wave.play();
   
}
 
void draw()
{
  //Main Pixel Shifter
  loadPixels(); //this loads the pixel data for the visible screen, which is not obvious.
  buffer.loadPixels(); // This one is more clear about what it is loading.
  
  for (int ix = 0; ix < width; ix++ ){ 
      vshift=int(wave.mix.get(ix)*AMPLITUDE); // capture waveform data
      for(int iy = 0; iy < height; iy++) {     
          yy=iy+vshift; //Here we calculate the source pixel
          if (TALL<=yy){yy=yy-TALL;} // bounds checking and wrapping
          if (0>yy){yy=TALL+yy;} // bounds checking and wrapping
          buffer.pixels[ix+iy*width]=pixels[ix+yy*width]; // copies the source pixel from the screen to the destination pixel on our buffer.
      }
  }  
  buffer.updatePixels(); //applies our changes to the pixel array
  // Note: updating the screens pixel array isn't necessary, because we only read from it.
  
  //This block sets the new color of the line
  rainbow.beginDraw();
  rainbow.colorMode(HSB);
  rainbow.background(col,255,255);
  rainbow.endDraw();
  buffer.blend(rainbow, 0, 0, width, 1, 0, 0, width, 1, SUBTRACT); // here we do our barrier color modification.
  // This technique makes the older pixels more destinct looking than the fresh pixels from the center.
  // Without this, the whole screen becomes a mess of rainbow bright colors without contrasting dark areas.
  
  image(buffer,0,0); // Apply our lovingly pixel-shifed buffer to the screen
  
  //Center Line Code
  col++;
  if (255<col){col=0;} // loops the color
  stroke(col,128,255); // looks nicer than full saturation
  fill(col,255,255);
  rect(0,height/2+2,width,height/2-2); // A wide center line looks better.
  
  //println(frameRate); // disabled for release

}
 
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  wave.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();
  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}


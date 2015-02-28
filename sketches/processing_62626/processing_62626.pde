
//see the examples on the different tabs
//Example 1 is ready to go
//you can only uncomment and work with one example at a time.
//to "uncomment" the sketch, delete the /* and */ at the beginning and end of the body of code
//to "comment" the sketch, place the body of code between /* and */

// create your final project here in this sketch

//Create "empty" variables that represent our animated sprites. 
//We create these at the very beginning so we have the option to
//reference them in multiple places.
Animation check7;
Animation dino7;

// First, you'll need to reference a library of functions for audio
import ddf.minim.*;
//Next, you'll need to create two "empty" variables one will be the actual audio player capability
//the other will be the actually audio player with the audio file loaded
AudioPlayer player;
Minim minim;

//The setup function is defined and called before anything is done.
//This holds all of our initial setup parameters such as screen size, and frame rate.
void setup()
{
   size(640, 360, P3D);  //set the size of the display area
  frameRate(7);  //setting the frame rate is very important in determining the speed of our sprites  
 //to instantiate an animation use this function 
  //"new Animation("locationOfSpriteFramesWithTheCommonNameForAllFiles", lastFrameNumber, numberOfPlacesInEachFrameNumber,"frameExtension") 
  check7 = new Animation("check7/DinoAntwoordAnimation", 284, 5, ".png");  //instantiate a copy of an animated sprite using our nifty new animation class
  dino7 = new Animation("dino7/DinoDanceAnimation", 125, 5, ".png"); //instantiate another for another

  //instantiate a new the audio player
   minim = new Minim(this);  
  // load a soundfile, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile ("Soundtrack/05 Fatty Boom Boom.mp3", 2048);   
 // play the file
 //You can experiment by adding this to your draw function
// and making it dependent on a condition (i.e. mousePressed)
  player.play(); 
  

}

//the draw function is defined here and is called every time a frame is drawn 
//If you want to update something on a frame by frame basis, it goes here
void draw()
{
 //Draw the background sprite for the frame.
 // We'll call a function that will display the latest frame from our sequence
 //Additionally, we'll draw this sprite frame at the pixel coordinates (0,0) 
 check7.display(0, 0);
 
 //Draw the foreground sprite for the frame
 //Use the same function but lets place the sprite at specific coordinates
 //change the coordinate numbers and rerun the program to see the effect
 dino7.display(170, 65);
 }



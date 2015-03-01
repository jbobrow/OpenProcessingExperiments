

//  - Project 3 - Mockup code. It is part of 'My Game' full project
// This is to demonstrate the concept of this solution and 
// enable exporting it to OpenProcessing.('My Game' full project has 37 MB at cannot be uploaded in OpenProcessing.
//Import 'Minim' relevant library file

import ddf.minim.*;

//Declare global variables for audio sounds (5 sounds):

Minim minim;
AudioSample Goats;
AudioSample Horses;
AudioSample Dogs;
AudioSample Crows;
AudioSample calm;

// Declare all PImage type variables (5 images)
PImage Mosaic;
PImage Goat;
PImage Horse;
PImage Dog;
PImage Crow;


//Load my background images from the project's  sketch data files
void setup() {
  size (800, 600);
Mosaic = loadImage("Mosaic.jpeg");
Goat = loadImage("Goat.jpeg");
Horse = loadImage("Horse.png");
Dog = loadImage("Dog.png");
Crow = loadImage("Crow.png");

//Load all Sounds participating in this mock-up
minim = new Minim(this);
Goats = minim.loadSample("Goats.wav");
Horses = minim.loadSample("Horses.wav");
Dogs = minim.loadSample("Dogs.wav");
Crows = minim.loadSample("Crows.wav");
calm = minim.loadSample("calm.wav");
  }
// Draw my background image (named Mosaic) on the canvas at (0,0)
// Set conditions for triggering each animal sound and present its full screen image
// When the user clicks the mouse over a certain animal on the canvas, the animal's 
// image is covering the whole canvas.
// While pressing the 'a' (lower case) while the cursor is on a certain image, the sound
//of that animal appears until the piece of sound is done. 
// Pressing the 'a' case can be done simultaneously with clicking the mouse. The user may click
//the 'a'  several times (at the same location or after moving to other locations on the canvas. 
//This will cause the system to play several sounds at once, if pieces are still running.

// This piece of code will create a bigger image while clicking the mouse over a certain animal.
void draw(){
image(Mosaic, 0, 0); 
  if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 300 &&  mousePressed == true){
  ;image(Dog , 0, 0);
} else  if (mouseX > 0 && mouseX < 400 && mouseY > 300 && mouseY < 600 &&  mousePressed == true){
  image(Horse , 0, 0); 
  } else  if (mouseX > 401 && mouseX < 800 && mouseY > 0 && mouseY < 300 &&  mousePressed == true){
    image(Goat , 0, 0); 
  }  else if (mouseX > 401 && mouseX < 800 && mouseY > 301 && mouseY < 600 &&  mousePressed == true){
      image(Crow, 0, 0); 
  }  
}

// This code will create the sound of the appropriate animal/ bird while pressing the 'a' case when the
//mouse is over the subjected animal's image
 void keyPressed() { if  (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 300 && key == 'a' ) {Dogs.trigger();}
else  if (mouseX > 0 && mouseX < 400 && mouseY > 300 && mouseY < 600 &&   key == 'a' ) { Horses.trigger(); }
else  if (mouseX > 401 && mouseX < 800 && mouseY > 0 && mouseY < 300 &&  key == 'a' ){ Goats.trigger();} 
else if (mouseX > 401 && mouseX < 800 && mouseY > 301 && mouseY < 600 &&  key == 'a' ){Crows.trigger(); }     
else if (mouseX > 800 && mouseX < 0 && mouseY > 600 && mouseY < 0 &&  key == 'a' ){calm.trigger(); }   

 }
 
 


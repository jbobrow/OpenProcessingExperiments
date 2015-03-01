




//Assignment week 15 
// This Ideia is to show all bits of what I did durring the course
// I like to show some of I work 

// Working with Images in Processing 


import ddf.minim.*; //import minim on project 

Minim minim;
AudioSample siren; // play back the file 

int maxImages = 5; // munbers of  images
int imageIndex = 0; // Initial image to be displayed is the first

// Declaring an array of images.
PImage[] images = new PImage[maxImages]; // if a array of images I can control the images 

void setup() {  // size of the canvas 
  size(800,600);
  minim = new Minim (this);
  siren = minim.loadSample("sirenpolice.wav");
  
  
  // this os a loop that loads into index the images 
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "Assignment" + i + ".jpg" ); 
  }
}

void draw() {
  // Displaying one image
  background(0);  // place a black background in the canvas 
  image(images[imageIndex],0,0); // where the image start to be draw 
}

void mousePressed() {

  imageIndex = int(random(images.length)); // a new image when the mouse is clicked
  if ( mousePressed ) siren.trigger(); // sound is trigger
}


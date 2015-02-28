
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound1;
AudioPlayer mysound2;

PImage myImage;
int pointX = 0;
int x;


int counter = 0;
PImage[] images = new PImage[4];  // an array holding 4 images
 
void setup() {
  size(500,255);
  background(200);
  
  images[0] = loadImage( "Jerusalem.jpg" );
  images[1] = loadImage( "newyork1.jpg" );
  images[2] = loadImage( "telaviv.jpg" );
  images[3] = loadImage( "boston.jpg" );
  
  
  minim = new Minim(this);                        // cerate a new Minim object
  mysound1 = minim.loadFile("turn_left.mp3");     // load the MP3
  mysound1.loop();                                // set it to loop
  mysound2 = minim.loadFile("turn_right.mp3");    // load the MP3
  mysound2.loop(); 
}
 
void draw() {
  
 // imageMode(CENTER);
  image(images[counter], 0, 0);   // make an image and place it
  
  int imageWidth = images[counter].width;
   
  if (mouseX > 400) {
   pointX = pointX + ((mouseX-200)/50);
   
   mysound1.setGain(8);
   mysound2.setGain(-45);  
  }
   
   if (mouseX < 100) {
   pointX = ((mouseX-200)/50) + pointX;
   
   mysound1.setGain(-45);
   mysound2.setGain(8);  
   }
   
  for (int x = 1; x < 5; x++) {
    image(images[counter], pointX, 0); // load image
    image(images[counter], pointX - (x*imageWidth), 0);
    image(images[counter], pointX + (x*imageWidth), 0);
  }
   
}
 
 void mousePressed() {
  if(counter < 3) {
    counter++;
 } else {
   counter = 0;
 }
}
    
 // this function gets called when you close out of your app
 void stop()
 {
  // always close Minim audio classes when you finish with them
 mysound1.close();
 mysound2.close();
  
  // always stop Minim before exiting
 minim.stop();
 
 super.stop();
 }


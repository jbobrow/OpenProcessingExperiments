
//Final Project 

// Define Color Palette for Starry Night 
color[] stars = {#323954, #B4B9CC, #435172, #D2BAA7, #9F8B7B};
color[] palette = stars;
float counter = 0; 

//Declare a PImage variable type
PImage nightsky;

//Setup Code Block (load image and audio files from HDD)
void setup() {
  size(1000,673);
  nightsky = loadImage("nightsky.jpg");
  minim = new Minim(this);
  guitar = minim.loadSample("Guitar.wav");
  colorMode (HSB, 360,100 , 100);
  image(nightsky, 0, 0);
}

//Draw Code Block and Mouse Input
void draw() {
if (mousePressed) {
    fill(random (0,360), random(50, 100), random(50,100));
    strokeWeight (3);
    
     //Set stroke color to random palette color
    stroke(palette[int(random(1,5))]);
    //Set stroke weight randomly
    strokeWeight(int(random(1,6)));
    //Set fill color randomly from palette
    fill(palette[int(random(1,5))]);
    // Set triangle location x to random of screen width
    float x = random(width);
    float y = random(height);
    //set shape parameters
    triangle(x, y, x+20, y, x+10, y+30);
    triangle(x, y+20, x+10,y-10, x+20, y+20);
    counter += random(1, +2);
  }
}

// Audio in Processing
//Import 'Minim' library files
import ddf.minim.*;

//Declare Global Vairables
Minim minim; 
AudioSample guitar; 
color strokeColor = color (random (0,360), random(50, 100), random(50,100));


//Key Triggers
void keyPressed(){
  if ( key == 'c') guitar.trigger();
  if ( key == 'c') println("sample triggered");
  if (key == DELETE || key == BACKSPACE) background (360);
}
  



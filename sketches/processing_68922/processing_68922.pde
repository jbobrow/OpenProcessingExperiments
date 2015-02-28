
/* This sketch takes an image and randomizes each pixel color within a ranged which is derived from the original color.
I used processing.org reference sketches for loading an image and randomizing a value. */

//Declare image in this section so that it is global & can be referenced in
//void setup() as well as in void draw().
PImage me;

void setup() {
size(300, 502);
//name & load the specific image to be used
me = loadImage("mary.jpg");
}

void draw () {
//Declare variables to be used later      
  float randr;
  float randg;
  float randb;

  
 //load the pixels of the image to be manipulated 
 loadPixels();
 //Loop that goes through each pixel in the image and stores its location in "loc"
  for (int y = 0; y < height; y++){
    for (int x = 0 ; x < width; x++){
      int loc = x + y*width;
 //Now the loop grabs the color value of each pixel       
      //this one takes the red value of a particular pixel and assigns it to variable called "r"
      float r = red(me.pixels[loc]);
      //this one takes the green value of the same pixel and assigns it to variable called "g"
      float g = green(me.pixels[loc]);
      //this one takes the blue value of the same pixel and assigns it to variable called "b"
      float b = blue(me.pixels[loc]);
      
      
//Now the loop goes through to see what the current color values of each aspect of each pixel & changes that value 
//based upon whether it is larger or smaller than another given value.  
      
      //if the red value is less than 100, a random number between 0 and 255 is generated and will be stored for later use. 
      //if the original value is not larger than 100, a number between 127 and 255 is generated instead.
      if ( r < 100) {
      randr = random(0,255);}
      else {
      randr = random(127, 255);}
     
      //same as above, but green, and the mouse position on the y plane influences the random number 
      //if the value is less than 100
      if ( g < 100) {
      randg = random(0,255);}
      else {
      randg = random(127, mouseY);}
      
      //same as above, but blue, and the mouse position on the x plane influences the random number 
      //if the value is less than 100
      if ( b < 100) {
      randb = random(0,255);}
      else {
      randb = random(mouseX, 255);}

      //Now the loop displays each pixel in order & with its new, altered color.
      pixels [loc] = color (randr,randg,randb); 
    }
  }
  updatePixels();
  
  //These are rectangles drawn across the bottom of the screen, 
  //each variously affected by the position of the mouse's x & y location
  noStroke();
  fill(mouseX-45, 150, 255, mouseY-200);
  rect(0, 472, 30, 30);
  fill(mouseY-45, 255, 15, mouseX-200);
  rect(30, 472, 30, 30);
  fill(255, mouseX-45, 240, mouseY-200);
  rect(60, 472, 30, 30);
  fill(mouseX-45, mouseX-45, 255, mouseX-200);
  rect(90, 472, 30, 30);
  fill(mouseX-45, 150, mouseX-45, mouseY-200);
  rect(120, 472, 30, 30);
  fill(12, 150, mouseX-45, mouseX-200);
  rect(150, 472, 30, 30);
  fill(mouseX-45, mouseX-45, 63, mouseY-200);
  rect(180, 472, 30, 30);
  fill(mouseX-45, 150, 255, mouseX-200);
  rect(210, 472, 30, 30);
  fill(mouseX-45, 15, mouseX-45, mouseY-200);
  rect(240, 472, 30, 30);
  fill(mouseX-45, 255, mouseX-45, mouseX-200);
  rect(270, 472, 30, 30);

}




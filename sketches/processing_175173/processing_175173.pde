
//working with Images in Processing
//Declare a PImage variable type
PImage fractal;
 //Declare a PImage variable type
PImage spider;
//Declare a PImage variable type
PImage trap;
//Declare a PImage variable type
PImage bee;
//Load an image file from HDD
/*Don't forget to add the file to your sketch 'data' folder */
// Import 'Minim' library files
import ddf.minim.*;
//Delare global variables
Minim minim;
void setup () {
  size (800, 600);
  fractal = loadImage ("fractal.jpg");
  spider = loadImage ("spider.jpg");
  trap = loadImage ("trap.jpg");
    bee = loadImage("bee.jpg");
 //Draw the image to the screen at (0,0)
   image (fractal, 0, 0, 800, 600);
  image (spider, 100, 300, 200, 300);

image (bee, 400, 400,127, 102);
image (trap, 500, 200, 80, 160);
AudioPlayer bee;
//Load audio file from HDD
minim = new Minim(this);
bee = minim.loadFile("bee.wav");
bee.play ();}
// Draw code block (anything goes)

void draw(){
 textSize (28);
fill (0);
textAlign (CENTER);

text ("Trapped in a beautiful web - a spider’s comfy bed", 400,50);
 


} 

    
    
   

 



  
 
























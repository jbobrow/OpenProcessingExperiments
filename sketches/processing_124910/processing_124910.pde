
/* Instructions
  * Press 'f' to play the sound of the virtual gull
  * Press 'g' to play the audio recording of a seagull
  * Press 'v' to start the background sound again
  * Press and drag the mouse to draw, to space out the 
     rectangles, move the mouse faster
  * Press 's' on the keyboard to save screenshot
  * Press delete or backspace to clear canvas
  * Press case '1' to give fill to the ellipse
  * Press case '2' to revert to original setting
  * Press case '3' to place single big ellipse


*/
//Import'Minim' libary files
import ddf.minim.*;
//Declear global variables
Minim minim;
AudioPlayer wave;
AudioSample seagull;
AudioSample fake;
AudioSample vave;
//Declare a PImage variable type 
PImage gull;
PImage robot;

//color strokeColor = color(0,10);
float posX; 
float posY; 

// hue of the brush
float penHue;  

void setup() {
  size (1000, 800);
   background(#FFFFFF); 
  gull = loadImage ("gull.png"); 
  robot = loadImage ("robot.png"); 
  //Load audio file 
  minim = new Minim(this);
  wave = minim.loadFile("wave.mp3");
  wave.play();

 seagull = minim.loadSample("seagull.wav");
  fake = minim.loadSample("fake.wav");
 vave = minim.loadSample("vave.mp3");
 colorMode(HSB, 360, 100, 100, 100);
  noFill();
}
//Draw the image to the screen at 0,0
void draw () {
 image (gull, 110, 200); 
  image (robot, 450, 200);
}
//Creat a key trigger
void keyPressed(){
   if ( key == 'g' || key == 'G') seagull.trigger();
   if ( key == 'g' || key == 'G') println("sample triggered");
   if ( key == 'f' || key == 'F') fake.trigger();
   if ( key == 'f' || key == 'F') println("sample triggered");
   if ( key == 'v' || key == 'V') vave.trigger();
   if ( key == 'v' || key == 'v') println("sample triggered");
}

void mousePressed() {
   // set random hue
  penHue = random(200);  
  
}

void mouseDragged() {
 
 {
  pushMatrix();
   
   translate(posX,posY);
  // rotate(radians(15));
  strokeWeight(2);
    stroke(penHue,35,90,255);
   ellipse(pmouseX-posX,pmouseY-posY, 50,50);
  popMatrix(); 
}
}
//keyPressed()

void keyReleased() {
  if (key == DELETE || key ==BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
switch(key){
  case '1' : 
  // gives the rectangle a fill
  fill(penHue,35,100,255);

  break;
  //change back to original settings
  case '2' :
  noFill();
  break;
  
  //places a big rectangle where the mouse is pointing
  case '3' :
  
   ellipse(pmouseX-posX,pmouseY-posY, 80,80);

  
}
}


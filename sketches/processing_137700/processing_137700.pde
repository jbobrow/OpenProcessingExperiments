

//declare a pimage variable type
PImage fractal;


//Import 'Minis' library files
import ddf.minim.*;
//Declare global variables
Minim minim;
AudioPlayer bells;

//load audio file from hdd
//load an image file from hdd
/*don't forget to add the file 
to your sketch 'data' folder */
//gLOBAL variables
color strokeColor = color(0,365);
void setup() {
  minim = new Minim(this);
  bells = minim.loadFile("1.mp3");
  bells.play();
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  fractal = loadImage("1.jpg");
}
//draw code block (anything goes)
//draw the image to the screen at (0,0)
void draw () {
  image(fractal, 0, 0, 800, 600);
  if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  //map(value; start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+300, 0, height, 5, 120);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  //style
  strokeWeight(2);
  stroke(strokeColor);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++) {
     float x = 0 + cos(angle*i*2) * radius;
     float y = 0 + sin(angle*i*5) * radius;
     vertex(x, y);
    
  }
  endShape();
  popMatrix();
}
}


void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(0);
  if (key == 's' || key == 'S') saveFrame("screenshot.png"); }


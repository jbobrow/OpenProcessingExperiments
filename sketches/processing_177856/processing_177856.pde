
//CHRISTMAS TREE
//There is not enough snow today in my yard. 
//For the Christmas sake bring more snow
//to the photo of my christmas-tree.

//Decare global variables
//declare MINIM for adding a sound
Minim minim;
AudioPlayer bell;

//declare a PImage variable type
PImage tree;

//import 'minim' library files
import ddf.minim.*;

//Setup
void setup() {
  size(717, 800);
  colorMode(HSB, 360, 100, 100, 100);
  tree = loadImage("c_tree.png");
  background(tree);
  noStroke();
  smooth();
}

//Define "snow" Color Palette
color[] snow = {#ffffff, #DCFFF5, #dce3ff};
color[] palette = snow;



void draw() {
  textSize(28);
  text("Need more snow!", 20, 70);
  
//Mouse Input   
//drawing snow
  if(mousePressed) {
    float d = random(2, 15);
    fill(palette[int(random(0, 3))], int(random(30, 100)));
    ellipse(mouseX+int(random(-2, 10)), mouseY+int(random(-2, 6)), d, d);
  }
  
}

//mouseReleased()
void mouseReleased () {
  //Every time a mouse button is released the sound played.
  minim = new Minim(this);
  bell = minim.loadFile("bells.wav");
  bell.play();
  
 }
 
//Keyboard Input
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(tree);
//Screenshot Saving Capability
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
 
 }
 


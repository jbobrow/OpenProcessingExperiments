
PImage a;  // Declare variable "a" of type PImage

float xpos; 
float ypos; 
float drag = 40;

void setup() {
  size(600, 600);
    smooth();
  // The file "bowtie.gif" must be in the data folder
  // of the current sketch to load successfully
  //To add a file to the sketch go to Sketch-Add File
  a = loadImage("bowtie.gif");  // Load the image into the program 

}

void draw() {
  // Displays the image at its actual size at point (0,0)
 background(255);
  
  float difx = mouseX - xpos-a.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-a.width);
  }  
  
  float dify = mouseY - ypos-a.height/2;
  if (abs(dify) > 1) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-a.height);
  }  
 
  // Display the sprite at the position xpos, ypos
  image(a, xpos, ypos);
 
}

 


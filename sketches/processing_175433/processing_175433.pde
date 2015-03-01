
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
// Import 'Minin' library files
import ddf.minim.*;
 
// Declare global variables
Minim minim;
AudioSample Sound;
// Load audio file from HDD
 
// Declare a PImage variable type
PImage img;
int smallPoint, largePoint;
 
// Load an image file from HDD
/* Don't forget to add the file to your sketch 'data' folder; */
 
void setup() {
  size(900, 600);
  img = loadImage("Project 3.png");
  smallPoint = 10;
  largePoint = 30;
  imageMode(CENTER);
  noStroke();
  background(255);
 
  minim = new Minim(this);
  Sound = minim.loadSample("Sound 2.mp3");
}
 
// Draw code block (anything goes)
 
void draw () {
  image(img, 450, 300);
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 500);
  ellipse(x, y, pointillize, pointillize);
}


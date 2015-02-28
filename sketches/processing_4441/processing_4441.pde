
//Chris Galea, Arch 1391, Project 2 
//Inspired by Mark Fonacier's "Sound Waves in Action"
//Located at http://www.openprocessing.org/visuals/?visualID=1762
 


float maxheight = 100;
  float heightUp = random(20, maxheight);
  float colourtest = 30;
  PImage bg;
  

void setup () {
  size (400, 600);
  frameRate(8);
  colorMode(HSB, height/2);
  bg = loadImage("posterbig.jpg");
  
}

void draw() {
background(bg);
  
 for (int test = 0; test < width; test += 10) { 
    fill (colourtest+heightUp,400,400,220); 
    rect(test, 300, 10, -heightUp);
    rect(test, 300, 10, heightUp);
   
    

   
  
   if(keyPressed) {
   heightUp = random(20, maxheight)+50;
  } else {
   heightUp = random(20, maxheight);
  }
  
  }}
  
void mousePressed() {
  if (maxheight < 400) {
  maxheight += 10;}
  else {maxheight = 50;}
}



PImage img ; 
PFont font ;  
PImage door; 

void setup() {

  img = loadImage("kittens.jpg");
  font = loadFont ("Baskerville-Italic-48.vlw");
  door = loadImage ("garageDoor.jpg");

  
size(441, 353);
smooth();



}

void draw() {
 
  background(255);
  
  



//tint (33, 234, 44);
image(img, 0, 0);
fill(255);
textFont (font, 35);
text ("'The one on the left is called Phillip' ", 200, 100, 200,200);
 image(door, 0, mouseY * -1);



}



//I have been working for the past few weeks with the concept of the night sky, and the stars, for my final project I will continue with this concept 
//The idea with this, my final project is for the user to paint its own stars over the Chicago sky 
//The user is going to be able to control where the stars will be placed and when and how the sky is goig to turn into black, by pressing the letter keys or by pressing the space bar (this will turn the sky completly black)  
//VG2014

int rectWidth;
PImage moon;

//Setup 
void setup() {
  size(600, 600);
  noStroke();
  background(#FFFFFF);
  rectWidth = width/20;
  moon = loadImage("moon.jpg");
  }
  
  
// Draw
void draw(){
}


//Mouse Input
void mousePressed() {
  colorMode(HSB, width, height, 100);
  fill( mouseY, mouseX, 75);
  ellipse( mouseX, mouseY, random(3,5),random(5,3));
  
//Screenshot Saving Capability 
  saveFrame("ellipse.png");
}

//Keyboard Input
void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } else { 
    // It's a letter key, fill a rectangle
    fill(#000000);
    float x = map(keyIndex, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
    image(moon, 0, 300);
  }
}



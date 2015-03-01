
//This is a program to help drawing Mandalas.
//I think the symmetrical shapes are quite relaxing, and it is a fun tool to draw with.
//I hope you like it!

//-----INSTRUCTIONS:-----
//Just click and drag the mouse on the canvas to draw
//Move the mouse to the right side of the canvas changes colors
//Press S on the keyboard to save a screenshot
//Press N on the keyboard to get a new white canvas
//Press C on the keyboard to change colors

//global variables
int rd = 120;     //red component in color
int gd = 40;      //green component in color
int bd = 80;      //blue component in color
int tamQuad = 10; //size of "square brush"
int x = 600;      //drawing area limit
int y = 600;      //drawing area limit


PImage webImg;


//setup
void setup(){
  size (800,600); //a square canvas would be better, but assignment requires this ratio
    String url = "https://processing.org/img/processing-web.png";
  // Load image from a web server
  webImg = loadImage(url, "png");
}

//draw
void draw(){
  
  image(webImg, 0, 0);
  
  if (mouseX > x){ //when mouse is on the right side, new colors are chosen
    rd = (int) random (255);
    gd = (int) random (255);
    bd = (int) random (255);
  }
}

//mouse input
void mouseDragged(){
    fill(rd,gd,bd);
    stroke (0, 0, 250, 90);
    if (mouseX < x){ //does not draw on the right
      rect (mouseX, mouseY, tamQuad, tamQuad);
      rect (x-mouseX, mouseY, tamQuad, tamQuad);
      rect (mouseX, y-mouseY, tamQuad, tamQuad);
      rect (x-mouseX, y-mouseY, tamQuad, tamQuad);
      rect (mouseY, mouseX, tamQuad, tamQuad);
      rect (x-mouseY, mouseX, tamQuad, tamQuad);
      rect (mouseY, y-mouseX, tamQuad, tamQuad);
      rect (x-mouseY, y-mouseX, tamQuad, tamQuad);
    }
}

//keyboard input
void keyPressed (){
  if (key == 's' || key == 'S') saveFrame ("screenshot.png");
  if (key == 'n' || key == 'N') background (255,255,255);
  if (key == 'c' || key == 'C') {
    rd = (int) random (255);
    gd = (int) random (255);
    bd = (int) random (255);
  }
}



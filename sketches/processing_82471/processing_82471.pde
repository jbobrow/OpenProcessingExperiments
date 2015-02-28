
boolean button = false; 
PImage img; 
PImage img2; 
String[] headlines = {
  "Camembert", 
  "Emmental", 
  "Gruyere", 
  "Mimolette", 
  "Roquefort", 
  "Boursin",
}; 
PFont f; 
float x; 
int index = 0; 
int picturePos;

void setup() { 
  size (400, 400); 
  smooth(); 
  img = loadImage("manchego2.gif"); 
  img2 = loadImage("bluecheese2.gif"); 
  background(255); 
  f= createFont ("Handwriting-Dakota", 16, true);
  frameRate (40); 
  x = width;
}

void draw() {
  
  if (mousePressed) {
    
    background(img);
  } 
  else {
image (img2, 0, 0, width, height); 
  }
    textFont(f, 40);
    textAlign (LEFT); 
    text (headlines[index], x, 390); 
    fill(#FCBB38);
    x = x - 2; 
    float w = textWidth (headlines[index]); 
    if (x < -w) {
      x = width; 
      index = (index + 1) % headlines.length;
    }
  }




//KYLE LLESES
//PS4-2

PImage a;
PFont font;

float position = 60;
float r = random(10);

void setup() {
  size(600, 600);
  
  //Load image and font
  a=loadImage("AH.png");
  font = loadFont("Impact-48.vlw");
}

void draw() {

  translate(width/position, height/position);

  background(0);
  smooth();

  //Codes for chaotic scene
  
  for (int gridY=0; gridY<position; gridY++) {
    for (int gridX=0; gridX<position; gridX++) {
      
      //control amount of cloned images
      float shiftX = random(-mouseX, mouseX)/2;
      float shiftY = random(-mouseX, mouseX)/2;

      float posX = width/position * gridX;
      float posY = height/position * gridY;


      image (a, posX+shiftX, posY+shiftY, mouseY/2, mouseY/2) ;
    }
  }
  fill (0, 0, 0);
   textSize(150);
   text ("CHAOS", 30, 320);
}



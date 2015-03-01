

import ddf.minim.*;
Minim minim;
AudioSample laugh;

float positionY;
float positionX;
float positionZ;

float speedX;
float speedY;
float rightLeft;
float upDown;

float aceleracionX;
float aceleracionY;

int botonX;
int botonY;
int botonAncho;
int botonAlto;

String hh = "Happy Holidays!";

color ballColor;

  PImage photo1;
  PImage photo2;
  PImage photo3;
  PImage photo4;

  
  void setup () {
  
    size (800, 600);
    
    minim = new Minim(this);
    laugh = minim.loadSample("laugh.wav");
    
   fill(#7FDE4A);
  textSize (40); 
  textAlign (CENTER);
  text (hh, width/2, height/2);
  
  photo1 = loadImage("beach.png");
  photo2 = loadImage ("ph-luli.png");
  photo3 = loadImage ("ph-matias.png");
  photo4 = loadImage ("enjoy-life.png");
  
  positionX = 0;
  positionY = 10;
  positionZ = 500;
  
  speedY = 1;
  speedX = 6;
  //change speed # = ball falls faster 
  rightLeft = 0;
  upDown = 0;
  
  aceleracionX = 1.8;
  
  botonX = 10;
  botonY = 10;
  botonAncho = 10;
  botonAlto = 10;
  
  ballColor = color (100,100,100);
  
}

  void draw () {
    
   image (photo1, 0,0, 800,600); 
   image (photo2, 0,0, 800,600); 
   image (photo3, 0,0, 800,600);
   image (photo4, 0,0, 800,600);
   
   fill (ballColor);
   
   // if the mouse is pressed or the mouse is on the right of 
   // the screen the kids and text will disapear and just
   //the background image will remain.  Additionally the 
   // ball will change colors every time the mouse is clicked.
   
    if (mousePressed || mouseX > width/2) {
      background (photo1);
      }  
      
  //if (keyPressed || mouseX > width/2) {
   // loadImage (photo4);
   
  // }

ellipse (positionX, positionZ, 70, 70);

positionX = positionX + speedX;
positionZ = positionZ + speedY;

rightLeft = random (-8,8);
positionX = positionX + rightLeft;

upDown = random (-8,5);
positionZ =  positionZ + upDown;

if (positionX > width) {
  positionX = width;
  speedX = speedX *-1;
}
}

//create a key trigger
void keyPressed () {
  if (key == 'b') laugh.trigger();
  if (key == 'b') println("sample trigger");
}
 
  
 void mousePressed () {
 if (mouseX > botonX && mouseX < botonX + botonAncho && mouseY > botonY && mouseY < botonY + botonAlto);
ballColor = color ( random (255), random (255), random (255));
 
} 
  


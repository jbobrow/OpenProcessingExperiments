
/*
Vis 40 Final Project
author: Sean Song
title: "Virtual Closet"
instructions: Click the button to try on different outfits.
              Press any key to save an image of the current style.
*/



import processing.video.*;
Capture myCapture;

int buttonX = 597;
int buttonY = 80;
int buttonW = 150;
int buttonH = 50;
int bgColor = 0;
PImage[] imgs = new PImage[11];
PImage wardrobe;
int imgCounter = 0;
int imgW = 200;
int imgH = 480;
PFont font;



void setup(){
   size(854,626);
   smooth();
   PFont font;
  font = loadFont("HelveticaNeue-Bold-18.vlw");
  textFont (font); 

   myCapture = new Capture(this, 120, 90, 30); //camera dimensions, framerate
   wardrobe = loadImage("wardrobe.jpg");
   background(wardrobe);
   imgs[0] = loadImage("a.png");
   imgs[1] = loadImage("b.png");
   imgs[2] = loadImage("d.png");
   imgs[3] = loadImage("c.png");
   imgs[4] = loadImage("e.png");
   imgs[5] = loadImage("f.png");
   imgs[6] = loadImage("g.png");
   imgs[7] = loadImage("h.png");
   imgs[8] = loadImage("i.png");
   imgs[9] = loadImage("j.png");
   imgs[10] = loadImage("k.png");
}


void captureEvent(Capture myCapture) {
  myCapture.read();
}

 
void draw(){
   PImage wardrobe;
   rect(buttonX, buttonY, buttonW, buttonH); //draw button
   strokeWeight(3);
   text("Change Clothes", 605, 150); //text, x, y
   
   image(imgs[imgCounter],330,130,imgW,imgH);
   image(myCapture, 370, 40);
}
 
void mousePressed(){
   if((mouseX > buttonX && mouseX < buttonX+buttonW) && (mouseY > buttonY && mouseY < buttonY+buttonH)) {
     background(wardrobe); //reload background image after each button press
     

     imgCounter++;
 if(imgCounter>=11){
       imgCounter = 1; //once array is complete, start at second outfit again
     }
   }
}

void keyPressed(){
 save("image.jpeg");
}


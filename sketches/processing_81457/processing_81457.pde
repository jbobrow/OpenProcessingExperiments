
// Created by Fatima Zahrah Rashid from scratch

PImage img1; 
PImage img2;
PImage img3;
int a=0;

void setup(){
  size(453,600); //size of sketch
  smooth();
  noFill();
  stroke(255);
  frameRate (30); //speed of sketch
    img1 = loadImage ("background.png");
            img3 = loadImage ("knife.png");
                image (img1,0,0);
}

void mouseReleased () {
  if (mouseX>97 && mouseX<138 && mouseY>35 && mouseY<157){
      img1 = loadImage ("background2.png");
      image (img1,0,0);
      cursor (img3);
      a=10;
  }
}

void draw(){
   if (mouseX>225 && mouseX<395 && mouseY>440 && mouseY<500 && a==10) {
  fill (100,0,0);
   noStroke();
   ellipse (mouseX-5, mouseY-125, 10, 40);
     fill (50,0,0);
   noStroke();
   ellipse (random(mouseX-10, mouseX), random(mouseY-145,mouseY-105), 1, 2);
   ellipse (random(mouseX-10, mouseX), random(mouseY-145,mouseY-105), 1, 2);
   ellipse (random(mouseX-10, mouseX), random(mouseY-145,mouseY-105), 1, 2);
  
  }
  
  if (mousePressed){
          image (img1,0,0);
  }
} 


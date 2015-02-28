
// Created by Fatima Zahrah Rashid from scratch
 
PImage img1; 
PImage img2;
PImage img3;
PImage img4;
float a = 78; //varriable for button1 x
float b = 393; //varriable for button1 y
float c = 195; //varriable for button2 x
float d = 393; //varriable for button2 y
float e = 0;

void setup(){
  size(359,501); //size of sketch
  smooth();
  noFill();
  stroke(255);
  frameRate (30); //speed of sketch
  img1 = loadImage ("kettle.JPG");
    img2 = loadImage ("button1.png");
      img3 = loadImage ("button2.png");
        img4 = loadImage ("firah.png");
      image (img1,0,0); // kettle
image (img2,a,b); //button 1
image (img3,c,d); //button 2
}
void draw(){
bezier(65,150, random(-65,65), random(-150,150), random(-65,65),random(-150,150), 65,150);
image (img4,80, 225); //firah
image (img1,e,0); // kettle
image (img2,a,b); //button 1
image (img3,c,d); //button 2
if (a<mouseX && mouseX<a+img2.width && b<mouseY && mouseY<b+img2.height && mousePressed == true)
   { // if the mouse is over the button1
      background (img1); //kettle
      e = -359;
      img2 = loadImage ("button1.1.png");
      image (img2,a,b);
      img3 = loadImage ("button2.png");
      image (img3,c,d);
      stroke(255,255,255,20);


   
}
if (c<mouseX && mouseX<c+img3.width && d<mouseY && mouseY<d+img3.height && mousePressed == true)
   { // if the mouse is over the button1
      image (img1,0,0); // kettle
      img2 = loadImage ("button1.png");
      image (img2,a,b);
      img3 = loadImage ("button2.1.png");
      image (img3,c,d);
       e = 0;
  
}

}





// Created by Fatima Zahrah Rashid from scratch
 
PImage img1; 
PImage img2;
PImage img3;
float a=92;
float b=193;
void setup(){
  size(517,486); //size of sketch
  smooth();
  noFill();
  stroke(255);
  frameRate (30); //speed of sketch
  img1 = loadImage ("background.jpg");
    img2 = loadImage ("bread1.png");
        img3 = loadImage ("bread2.png");
          background(img1);

      image(img2,a,95);
      image(img3,b,100);
}
void draw(){
            background(img1);
      image(img2,a,95);
      image(img3,b,100);

if (mouseX>108 && mouseX<156 && mouseY>140 && mouseY<170 && mousePressed == true){
a=-657;
}

if (mouseX>208 && mouseX<265 && mouseY>154 && mouseY<186 && mousePressed){
b=-657;
}

if (mouseY>194 && mouseY<225 && mouseX>106 && mouseX<152 && mousePressed){
a=92;
}

if (mouseX>207 && mouseX<264 && mouseY>215 && mouseY<248 && mousePressed){
b=193;
}
}


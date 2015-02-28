
// Created by Fatima Zahrah Rashid from scratch
 
PImage img1;
PFont font;
void setup(){
  size(600,338); //size of sketch
  smooth();
  noFill();
  stroke(255);
  frameRate (7); //speed of sketch
  img1 = loadImage ("fruit.JPG");
  background(img1);


}
void draw(){
 tint(255, 50);
 image(img1,0,0);
  font = createFont ("StarberrySwirlDelight.ttf", random(6,50));
    textFont (font);
  fill (random(0,255),random(0,255),random(0,255));
    text ("pick me", random(150,480), random(15,240));
      fill (random(0,255),random(0,255),random(0,255));
        text ("omnomnom", random(150,480), random(15,240));
 
}


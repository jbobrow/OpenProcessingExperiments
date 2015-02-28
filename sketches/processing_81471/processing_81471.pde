
// Created by Fatima Zahrah Rashid from scratch
 
PImage img1;
float a=1;
float b=10;
void setup(){
  size(525,295); //size of sketch
  smooth();
  noFill();
  stroke(255);
  frameRate (30); //speed of sketch
  img1 = loadImage ("pan.JPG");

}
void draw(){
  background(img1); 
  stroke(200);
  noFill();
  ellipse (random(230,390),random (80,240),random(a,b),random(a,b));
  ellipse (random(230,390),random (80,240),random(a,b),random(a,b));
  ellipse (random(230,390),random (80,240),random(a,b),random(a,b));
  ellipse (random(230,390),random (80,240),random(a,b),random(a,b));
  ellipse (random(230,390),random (80,240),random(a,b),random(a,b));
  ellipse (random(230,390),random (80,240),random(a,b),random(a,b));
  if(keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) { // when the up arrow is pressed, star gets bigger
        a +=1;
        b +=1;
      }
       
      else if (keyCode == DOWN) { // when the down arrow is pressed, 
                                  // star gets smaller
        a -=1;
        b -=1;
      }
    }
  } 
}


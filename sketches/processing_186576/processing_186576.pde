
float pressure;
float d;
PImage img;
boolean dead = false;
import ddf.minim.*;
 
AudioPlayer pig;
AudioPlayer gun;
Minim minim;//audio context

 
void setup() {
  size(527, 800);
  background(#515A4C);
  smooth();
  img = loadImage("bullet.jpg");
  minim = new Minim(this);
  pig = minim.loadFile("pig.mp3");
  gun = minim.loadFile("gun.mp3");
}
 
void draw() {
  strokeWeight(3);
  stroke(1, 30);
  line(mouseX,mouseY,pmouseX,pmouseY);
}
 
void mousePressed() {
   //draw footprints
  pressure = random(1,10);
  d = random(5,50);
//  pig.play();
//  pig.rewind();
   

  strokeWeight(pressure);
  stroke(0);
  noFill();
  ellipse(mouseX,mouseY,d,d);
}
 
void keyPressed() {
  if (dead == false) {
    background(#2A4335);
    // Background image - gun
    image(img,0,0); 
//    gun.play();
//    gun.rewind(); 
//    dead = true;
  } else {
    background(100);
    dead = false;
  }
}




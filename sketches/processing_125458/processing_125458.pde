
import ddf.minim.*;
PImage clock;
float r = 300;
Minim minim;
AudioSample sp;

void setup() {
  size(1000, 800);
  clock = loadImage("ClockProject.jpg");
 minim = new Minim(this);
 sp = minim.loadSample("spoons.wav");
 noStroke();
  
}

void draw() {
  
  if(mousePressed) {


 
  imageMode(CENTER);
  image(clock, width/2, height/2);
  
  translate(width/2, height/2);

  
  fill(255);
  rotate(r/100);
  rect(0, 0, 10, 150);
  r = r-.25;
  }
 
 
}

void keyPressed() {
  if (key == 'p' ) sp.trigger();
}




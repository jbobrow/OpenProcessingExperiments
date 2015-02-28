
/* @pjs font="FuturaStd-Light.otf"; */

float i = 50;
PImage surface; PImage dough; PImage pin;
PFont font = createFont("Futura", 14);

void setup() {
   size(500,375);
   background(255); 
   surface = loadImage("surface.jpg");
   dough = loadImage("dough.png");
   pin = loadImage("pin.png");
   cursor(pin);
  }

void draw() {
  fill(0);
  image(surface,0,0);
  imageMode(CENTER);
  image(dough,250,188,50+i,50+i);
  textFont(font);
  noStroke();
  fill(255);
  text("Click & Drag to roll out the dough!", 20,350);
}

void mouseDragged(){
 i +=1; 
 if (i > 300) {
  i = 300; 
 }
}


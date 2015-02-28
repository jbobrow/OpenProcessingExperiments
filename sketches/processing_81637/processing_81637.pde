
/* @pjs font="FuturaStd-Light.otf"; */

float i = 50;
PImage surface; PImage dough; PImage heart; PImage heartshape;
PFont font = createFont("Futura", 14);

void setup() {
   size(500,375);
   background(255); 
   surface = loadImage("surface.jpg");
   dough = loadImage("dough.png");
   heart = loadImage("heart.png");
   cursor(heart);
   image(surface,0,0);
  imageMode(CENTER);
  image(dough,250,188);
  }

void draw() {
  
  if (mousePressed == true){
    PImage heartshape;
    heartshape = loadImage("heartshape.png");
    imageMode(CENTER);
    image(heartshape,mouseX,mouseY);
  }
  
  fill(0);
  textFont(font);
  noStroke();
  fill(255);
  text("Click to cut cookies out of the dough!", 20,350);
}


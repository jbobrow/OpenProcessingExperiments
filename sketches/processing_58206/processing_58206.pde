
PFont fontA;
PImage myimage;

void setup(){
   size(1000, 1000);

fontA = loadFont ("Ceriph0556-48.vlw");
myimage = loadImage("land.jpg");

textFont(fontA, 70);
}

void draw(){
  image(myimage, mouseX, mouseY, random(550), random(900));
  
  fill(219, 130, 178);
  text("Come On, Let's Go.", 100, 500);
 
  
}


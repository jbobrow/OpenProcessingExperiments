
PImage sam;

void setup() {
  size(1000, 800);
  sam = loadImage("sam.png");
   background (0);
}

void draw() {

image(sam,mouseX,mouseY);
  
  
}





PImage bg;
PImage ship;


void setup() {
  background(255);
  size(600, 540);
  bg = loadImage("bgrgb.jpg");
 ship= loadImage("ship.png");


  
}

void draw(){
  image(bg,0,0);

  
    float d = dist(mouseX, mouseY, pmouseX, pmouseY);
   image(ship, mouseX, mouseY);
  
  }




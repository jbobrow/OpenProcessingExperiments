
/*Mexico map, current situation 2014*/
/*global variables*/

PImage mapamexico;
PImage calaverita;
                                                                             
/*setup*/
void setup() {
size(974, 720);
/*colorMode(HSB, 360, 100, 100, 100);*/
colorMode (RGB, 100);
mapamexico = loadImage("mapamexico.png");
calaverita = loadImage("calaverita.png");     
background(mapamexico);
}

void draw() {
   if (mouseButton == LEFT) {
    
     /*EXPERIMENTO CALAVERA*/
image (calaverita, mouseX, mouseY);
tint (100, 10);
  }
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(mapamexico);
}


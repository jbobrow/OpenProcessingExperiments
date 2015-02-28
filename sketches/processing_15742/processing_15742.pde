
PImage[] images = new PImage[21];

void setup() {

 size(650,400);
 
 for(int i=0; i<21; i++) {
   images[i] = loadImage("cuadro_" + i + ".png");
 }  

}

void draw() {
 image( images[mouseX/32], 0, 0);
}

void mouseMoved() {
  println("mouseX / 32 = " + mouseX/32); 
}


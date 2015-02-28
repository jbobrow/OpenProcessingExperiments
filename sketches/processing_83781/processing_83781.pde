
PImage img;
void setup() {
  size(1000,700);
    smooth();
    img = loadImage("PROCESSINGZ copy.jpg");
}
void draw() {
   image(img, 0, 0, width, height);
   noStroke();
   fill(70,130,180,150);
rect(0,map(hour(),0,23,0,height),width,height);
}







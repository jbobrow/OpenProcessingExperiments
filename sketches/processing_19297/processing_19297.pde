
//Romina De Grote  
//Image sketch using the mask function

void setup() {
  size(800,600);
  background(0);
  noStroke();
  smooth();

}

void draw() {
  PImage img = loadImage("otoño.jpg");
  rect(mouseX+5,0,mouseY,800); 
  loadPixels();
  img.mask(pixels);
  image(img, 0, 0, 800,600);
}



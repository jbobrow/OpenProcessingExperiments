

PImage img;
PImage img2;
float offset = 0;
float easing = 0.03;

void setup() {
  size(640, 480);
  img = loadImage("12345.jpg");  
  size (660, 500);
  img2= loadImage("Untitled-1.jpg");
}

void draw() { 
  image(img, 0, 0);  
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 126); 
  image(img2, offset, 190);
}




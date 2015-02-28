


PImage img;
float offset = 5;
float easing = 0.08;

void setup() {
  size(748, 748);
  img = loadImage("j.jpg");   
}

void draw() { 
  image(img, 0, 0);  
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 100);  
  image(img, offset, 0);
}








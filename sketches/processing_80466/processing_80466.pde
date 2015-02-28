
PImage img;
PImage img2;

void setup(){
  size(400,400);
  img = loadImage("Unknown.jpeg");
  img2 = loadImage("Unknown-1.jpeg");
  frameRate(5000);
}

void draw(){
  
  tint(255,50, random(width),random(height));
  
  image(img, random(width),random(height));
  
  tint(mouseX,mouseY,mouseX,mouseY);
  image(img2,mouseX,mouseY);
  
}



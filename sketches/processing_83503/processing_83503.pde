
PImage img;
float d;
void setup(){
  size(600, 600);
  smooth();
  img = loadImage("Yjunction.jpg");
  
}

void draw(){
  background(0);
  translate(0, sin(radians(d)) * 30);
  image(img, 0, 0);
  d += 10;
}

void mousePressed(){
    noLoop();
}

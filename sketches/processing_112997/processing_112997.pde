
PImage girl;
PImage girl_2;

void setup() {
  size(480, 640);
  smooth();
  girl = loadImage("girl.png");
  girl_2 = loadImage("girl_2.png");
  imageMode(CENTER);
}

void draw() {
  background(255);
  image(girl,mouseX, 520);
  
  if(mousePressed == true) {
    image(girl_2, mouseX, 520);
  }
}
  



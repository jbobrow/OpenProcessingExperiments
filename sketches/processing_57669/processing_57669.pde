
PImage myImage;

void setup() {
  size(1000, 685);
  myImage = loadImage("building3.jpg");
  
  background(mouseX, mouseY, mouseX);
  //(155, 134, 134)
  stroke(1000);
  frameRate(20);
  
}

void draw() {
  fill(0, 0, 5, 5);
  rect(mouseX, 0, random(4000), random(4000));
  
  tint(random(155), random(134), random(90), 4);
  smooth();
  image(myImage, 0, 0);
  
  
}




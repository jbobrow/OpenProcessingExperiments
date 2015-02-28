
//Global Varti

//Declare a PImage variable type
PImage test;

//Setup and load an image file from HDD
void setup(){
  size(800, 697);
  colorMode(HSB, width, height, 100);
  background(random (width), random(height), random (100));
  test = loadImage("lobo editado.jpg");
}

//Draw the image to the screen at
void draw() {
  image(test, 0, 0, 420, 697);
  noStroke();
  fill(mouseY, mouseX, 50);
  ellipse(600, 600, 80, 50);
  ellipse(600, 580, 40, 70);
  ellipse(560, 560, 25, 25);
  ellipse(640, 560, 25, 25);
  ellipse(580, 530, 25, 25);
  ellipse(620, 530, 25, 25);
  pushMatrix();
  translate(-50, -200);
  ellipse(600, 600, 80, 50);
  ellipse(600, 580, 40, 70);
  ellipse(560, 560, 25, 25);
  ellipse(640, 560, 25, 25);
  ellipse(580, 530, 25, 25);
  ellipse(620, 530, 25, 25);
  popMatrix();
  //imput
  
  
}





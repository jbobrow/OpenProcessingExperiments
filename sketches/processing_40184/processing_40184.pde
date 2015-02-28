

PImage pic;

void setup() {
  size(300, 300);
  colorMode(HSB, 100);
  pic = loadImage("comppic.jpg");
  noStroke();
  smooth();
  background(100);
  frameRate(4);
}

void mousePressed() { //allows change in composition
  int a = int(random(0, pic.width));    
  int b = int(random(0, pic.height));   

  color palette = pic.get(a, b);
  background(palette);
}


void draw() {
  for (int i = -140; i <200; i +=40) {
    for (int j = -140; j <200; j +=40) { //nested loop creates a grid to lay the funtion
      colorSphere(i, j);
    }
  }
}



void colorSphere(float x, float y) { //uses colors from image and creates a dynamic sphere
  pushMatrix();
  translate(x, y);
  int a = int(random(0, pic.width));    
  int b = int(random(0, pic.height));   

  color palette = pic.get(a, b); //gets color from image      
  fill(palette);
  ellipse(width/2, height/2, random(5, 40), random(5, 40));
  popMatrix();
}




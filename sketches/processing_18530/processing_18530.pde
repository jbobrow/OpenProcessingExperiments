
Bird redBird, greenBird, yellowBird;

void setup() {
  size(200,200);
  smooth();
  
  redBird     = new Bird(25, 200, 31, 255, 76, 5, 3);
  greenBird   = new Bird(100, 200, 70, 2, 211, 112, 1);
  yellowBird  = new Bird(170, 200, 20, 217, 255, 5, 6);
}

void draw() {
  
  backgroundColor();
  
  redBird.display();
  if ((mouseX > 0 && mouseX < width/3) || (mousePressed)) {
  redBird.move();
  }
  
  greenBird.display();
  if ((mouseX > width/3 && mouseX < width - width/3) || (mousePressed)) {
  greenBird.move();
  }
  
  yellowBird.display();
  if ((mouseX > width - width/3 && mouseX < width) || (mousePressed)) {
  yellowBird.move();
  }
}




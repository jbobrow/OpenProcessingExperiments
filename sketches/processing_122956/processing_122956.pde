
float numR = (random(250));
float numG = (random(250));
float numB = (random(250));
float mySize; 
int valueOp = 0;



void setup() {
  size (800, 800);
  background(255);
  frameRate(12);
  mouseX = (width/2); 
  mouseY =(height/2);
}


void mouseMoved() {
  valueOp = valueOp + 5;
  if (valueOp > 100) {
    valueOp = 0;
  }
  fill(numR, numG, numB, 40);
}


void draw() {

  mySize = (random(8, 30));
  stroke(156, 159, 188);
  //fill(random(255), random(255), random(255), 40);
  line(mouseX, mouseY, (width/2), (height/2));
  ellipse(mouseX, mouseY, mySize, mySize);
  //fill(random(255), random(255), random(255), 40);

  if (mousePressed == true) {
    background(255);
    noFill();
    numR = (random(250));
    numG = (random(250));
    numB = (random(250));
  }
}




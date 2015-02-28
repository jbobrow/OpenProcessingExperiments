
Boolean over = false;
float leftBoundry = 20;
float rightBoundry = 60;
float topBoundry = 20;
float bottomBoundry = 60;

void setup() {
  size(450, 450);
  background(255); 
  noStroke();
  fill(255, 0, 0);
  smooth();
}

void draw() {
  background(255);
  rect(leftBoundry, topBoundry, 40, 40);
  if((mouseX > leftBoundry) && 
    (mouseX < rightBoundry) && 
    (mouseY > topBoundry) && 
    (mouseY < bottomBoundry)) {
    fill(255, 255, 0);
    over = true;
  } 
  else {
    fill(255, 0, 0);
    over = false;
  }
  if(mousePressed) {
    fill(0,191,255);
    rect(75, 75, 300,300);
    rect(390,390,40,40);
  }   
}




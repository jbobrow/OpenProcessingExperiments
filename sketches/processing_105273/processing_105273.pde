
int buttonX, buttonY, buttonSize;

PImage cage;

boolean button;

void setup() {
  
  cage = loadImage("cage.jpg");
  size(cage.width, cage.height);
  
  imageMode(CENTER);
  
  buttonX = width/3;
  buttonY = height - 40;
  buttonSize = 20;

  button = false;

}

void draw() {
  background(255);
  
  strokeWeight(1);
  
  // slider bar
  rectMode(CENTER);
  noStroke();
  fill(0);
  rect(buttonX, buttonY, 100, 3);
  
  if (button) {
    // draw the image
    image(cage, width/2, height/2);
    
    stroke(0);
    fill(255, 0, 0);
    // draw the button
    ellipse(buttonX, buttonY, buttonSize, buttonSize);
  }
  
  else {
    fill(0);
    stroke(0);
    ellipse(buttonX, buttonY, buttonSize, buttonSize);
  }
  
  if (mouseX > buttonX-buttonSize/2 && mouseX < buttonX + buttonSize/2 && mouseY > buttonY-buttonSize/2 && mouseY < buttonY + buttonSize/2) {
    stroke(255, 0, 0);
    strokeWeight(3);
    ellipse(buttonX, buttonY, buttonSize, buttonSize);
  }
}

void mouseClicked() {
  // slider bar
  rectMode(CENTER);
  noStroke();
  fill(0);
  rect(buttonX, buttonY, 100, 3);
  
  if (mouseX > buttonX-buttonSize/2 && mouseX < buttonX + buttonSize/2 && mouseY > buttonY-buttonSize/2 && mouseY < buttonY + buttonSize || mouseX == buttonX && mouseY == buttonY) { 
    button = !button;
    println(button);
  }

}






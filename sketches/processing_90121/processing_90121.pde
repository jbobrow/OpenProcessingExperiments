
//Creative Computing
//Fervido Frias
//February 19, 2013.

void setup() {
  size(400, 400);
  noStroke();
  background(255, 255, 255);
  rect(225, 0, 175, 175);
  rect(0, (height-175), 175, 175);
  rect((width-175), (height-175), 175, 175);
}

void draw() {

  if ((mouseX< 175) && (mouseX>0) && (mouseY<175) && (mouseY>0)) {
    fill(random(200), random(156), random(98));
    quad(0, random(80), 31, random(197), 218, random(207), 191, 0);
  } 
  else { 
    background(255, 255, 255);
  }

  if ((mouseX>0) && (mouseX<175) && (mouseY<400) && (mouseY>215)) {
    ellipse(mouseX, mouseY, mouseX, mouseY);
  }

  if ((mouseX> 216) && (mouseX<400) && (mouseY>214) && (mouseY<400)) {
    fill(random(89), random(23), random(46));
    rectMode(CENTER);
    rect(mouseX, mouseY, (mouseX-3), (mouseY*7));
    if (mousePressed) {
      fill(89, 77, 170);  
      ellipse(mouseX, mouseY, mouseX, mouseY);
    }
  }
  if ((mouseX>215) && (mouseX<400) && (mouseY>0) && (mouseY<175)) {
    fill(random(6), random(9), random(225));
    rectMode(CORNER);
    rect(0, 0, 400, 400);
  }
}




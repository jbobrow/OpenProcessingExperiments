
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  noStroke();
  background(255);

  //&& and
  // || or

  if ((mouseX>500) && (mouseY<200) ) {
    fill(20, 58, 38);
  }
  else if ((mouseX<70) && (mouseY<70) && (mousePressed) ) {
    fill(random(255), random(255), random(255));
  }
  else if (mouseX<200) {
    background(29, 39, 27);
    fill(0, 225, 0); //left?
  }
  else if (mouseX>400) {
    fill(255, 0, 0); //right?
    if (!mousePressed) {
      background(random(255), random(255), random(255));
    }
  }
  else {
    fill(230, 200, 0); //midle.. whatevers left
    background(58, 38, 200);
  }

  //ellipse(width/2, height/2, 200, 200);
  rect(mouseX, mouseY, 200, 200);
}




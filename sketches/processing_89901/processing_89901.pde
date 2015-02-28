
//Valentina Pherson
//February 19, 2013
//Mouse Interaction in 4 Parts

void setup() {
  size(400, 600);
}

void draw() {
  //upper right
  fill(248,109,114);
  if ((mouseY > 0) && (mouseY < 300) && (mouseX > 200) && (mouseX < 400) ) {
    fill(137, 41, 90);
    if (mousePressed == true) {
      fill(50, 164, 89);
    }
  }
  rect(200, 0, 200, 300);
  //upper left
  if ((mouseX >0) && (mouseX <200) && (mouseY <300) && (mouseY>0)) {
      line(mouseX, mouseY, 100, 150);
      fill(248, 109, 114, 100);
      ellipse(mouseX, mouseY, 20, 10);
        }
  //bottom left
  if ((mouseX>0) && (mouseX<200) && (mouseY<600) && (mouseY> 300)) {
    fill (random(0,255),random(0,255), random (0,255), 90);
    ellipse(mouseX, mouseY, 40,20);
}
  //bottom right
  if ((mouseX>200) && (mouseX<400) && (mouseY>300) && (mouseY <600)) {
  fill(137, 41, 90, 40);
  rect(mouseX, mouseY, 40,40);
  if (mousePressed == true) {
    fill(50, 164, 89, 90);
    ellipse(mouseX+20, mouseY+20, 10,150);
   }
  }
}

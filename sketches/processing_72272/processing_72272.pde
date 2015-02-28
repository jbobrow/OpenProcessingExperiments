
//Lauren Zito
//Introduction to Digital Media Fall 2012
//Section B
//09.13.2012

//make it rain as a flower blows in the storm

int value = 0;
int randomBlue = 0;
int randomRed = 0;
boolean raining = false;

void setup() {
  size(1200, 600);
  noFill();
}

void draw() {
  background(0);
  
  if (keyPressed == true) {
    fill(255);
  } else {
    fill(129, 160, 183, 200);
  }
  rect(0, 0, 1200, 600);
  //overcast sky



  fill(36, 93, 21);
  beginShape();
  vertex(0, 400);
  vertex(1200, 400);
  vertex(1200, 600);
  vertex(0, 600);
  endShape(CLOSE);
  //grass

  fill(255, 183, 0);
  ellipse(20, 20, 100, 100);
  //sun
  
  int randomPoint = int(random(width));
  {
    fill(119, 163, 206);
    if (mousePressed) {
      for (int i = 0; i < 600; i++) {
        ellipse(randomPoint, i+1, 10, 10);
        //rain
      }
    }
  }
  
  randomBlue = int(random(255));
  smooth();
  randomRed = int(random(200));

  fill(randomRed, 0, 0);
  bezier(mouseX, mouseY, 1000, 0, 400, 0, mouseX, mouseY);
  //red petal
  fill(211, 84, 82);
  bezier(mouseX, mouseY, 875, 0, 375, 0, mouseX, mouseY);
  //orange petal
  fill(255, 211, 64);
  bezier(mouseX, mouseY, 670, 0, 425, 0, mouseX, mouseY);
  //yellow petal
  fill(99, 206, 83);
  bezier(mouseX, mouseY, 700, 0, 150, 0, mouseX, mouseY);
  //green petal
  fill(94, 222, 214);
  bezier(mouseX, mouseY, 500, 0, 200, 0, mouseX, mouseY);
  //aqua petal
  fill(0, 0, randomBlue);
  bezier(mouseX, mouseY, 375, 0, 175, 0, mouseX, mouseY);
  //blue petal

  fill(25, 64, 5);
  triangle(mouseX, mouseY, 597, 500, 603, 500);
  //stem
  
  if (key == 's') { 
    save("LaurenZito.png");
}
}

void mouseClicked() {
  raining = !raining;
  //make it rain
}

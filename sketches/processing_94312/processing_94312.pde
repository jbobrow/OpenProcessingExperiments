

void setup() {
  size(800, 800);
  noStroke();
  background(255);
}

//country sky
void drawShape1() {
  pushMatrix();
  translate(random(-15, 15), random(-15, 15));
  scale(random(3, 10));
  fill(random(1, 150), 116, 217, random(1, 150));
  ellipse(0, 0, 10, 10);
  translate(random(-5, 5), random(-5, 5));
  fill(212, 244, 250, random(1, 150));
  ellipse(0, 0, 5, 5);
  popMatrix();
}

//city sky
void drawShape2() {
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  scale(random(3, 10));
  fill(78, 36, 138, random(1, 130));
  ellipse(0, 0, 10, 10);
  translate(random(-5, 5), random(-5, 5));
  scale(random(0.01, 0.07));
  fill(250, 237, 125);
  triangle(0, 0, 25, 0, 10, -5);
  popMatrix();
}

//flowers
void drawShape3() {
  pushMatrix();
  translate(random(-10, 10), random(-10, 10));
  scale(random(0.05, 3));
  //flower blossom
  fill(255, random(1, 255), random(1, 255), random(1, 160));
  quad(0, 0, 10, -20, 0, -10, -10, -20);
  //leaves
  fill(134, 170, random(1, 150), random(1, 120));
  rect(0, 0, 3, 20);
  ellipse(5, 8, 10, 3);
  ellipse(-5, 11, 10, 3);
  popMatrix();
}

//city
void drawShape4() {
  pushMatrix();
  translate(random(-30, 30), random(-10, 10));
  scale(random(0.1, 3));
  //building
  fill(random(1, 100), random(1, 160));
  rect(0, 0, 20, 40);
  //windows
  fill(250, 244, random(0, 255), random(1, 130));
  rect(2, 2, 7, 7);
  rect(11, 2, 7, 7);
  rect(2, 11, 7, 7);
  rect(11, 11, 7, 7);
  rect(2, 20, 7, 7);
  rect(11, 20, 7, 7);
  //door
  fill(255, 193, 158, random(1, 130));
  rect(6.5, 30, 7, 10);
  popMatrix();
}


void draw() {

  if ( mousePressed && (mouseButton == LEFT)) {
    if (mouseX <= 400 && mouseY <=400) {
      if (mousePressed) {
        translate(mouseX, mouseY);
        drawShape1();
      }
    } 
    else if (mouseX >= 400 && mouseY <= 400) {
      if (mousePressed) {
        translate(mouseX, mouseY);
        drawShape2();
      }
    } 
    else if (mouseX <= 400 && mouseY >= 400) {
      if (mousePressed) {
        translate(mouseX, mouseY);
        drawShape3();
      }
    } 
    else if (mouseX >= 400 && mouseY >= 400) {
      if (mousePressed) {
        translate(mouseX, mouseY);
        drawShape4();
      }
    }
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    background(255);
  }
}



int x, y;
int eSize;

void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
}

void keyPressed() {
  switch(key) {
  case 'a':
    background(255);    //keshigomu
    break;
/*
  case'c':
    noStroke();
    fill(mouseX, mouseY, 255);
    ellipse(mouseX, mouseY, 30, 30);
    break;

  case'r':
    noStroke();
    fill(mouseX, mouseY, 255);
    rect(mouseX, mouseY, 30, 30);
    break;
*/
  case't':
    noStroke();
    fill(random(50), mouseY, random(200));
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(20), mouseY+random(20));
    vertex(mouseX+random(15), mouseY+random(15));
    vertex(mouseX+random(5), mouseY+random(5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5), mouseY+random(-5));
    vertex(mouseX+random(-15), mouseY+random(-15));
    vertex(mouseX+random(-20), mouseY+random(-20));
    endShape(CLOSE);
    break;
  }
}



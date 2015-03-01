
int x, y;

void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
}

void mouseDragged() {
  if (key == '1') {//white
    noStroke();
    fill(random(180, 250), random(180, 250), random(180, 250), 40);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '2') {//red
    noStroke();
    fill(random(160, 250), random(80), random(20), 50);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '3') {//yellow
    noStroke();
    fill(random(210, 250), random(210, 250), random(10), 60);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '4') {//green
    noStroke();
    fill(random(150), random(150, 250), random(50), 50);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '5') {//cyan
    noStroke();
    fill(random(10), random(180, 230), random(170, 250), 40);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '6') {//blue
    noStroke();
    fill(random(50), random(70), random(100, 230), 50);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
    //    break;
  }
  if (key == '7') {//maz
    noStroke();
    fill(random(170, 200), random(50), random(180, 250), 40);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '8') {//black
    noStroke();
    fill(random(0, 50), random(0, 50), random(0, 50), 40);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
  if (key == '9') {//wtf
    noStroke();
    fill(random(50,250), random(50, 250), random(50, 250), 40);
    beginShape(TRIANGLE_FAN);
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(0), mouseY+random(0));
    vertex(mouseX+random(-5, 5), mouseY+random(-5, 5));
    vertex(mouseX+random(-15, 15), mouseY+random(-15, 15));
    vertex(mouseX+random(-30, 30), mouseY+random(-30, 30));
    endShape(CLOSE);
  }
}
void keyPressed() {
  switch(key) {
  case 'a':
    background(255);    //delete
    break;
  }
}



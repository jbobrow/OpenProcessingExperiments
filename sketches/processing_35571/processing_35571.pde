
void setup() {
  size(300, 300);
  colorMode(RGB);
  background(0, 100, 200);
}

int x = 2;
int y = 20;

void draw() {
  // grass
  fill(0, 160, 70);
  rect(0, 240, 300, 300); 

  noStroke();
  fill(255);
  //cloud 1
  ellipse(60, 60, 40, 40);
  ellipse(80, 50, 40, 40);
  ellipse(70, 70, 40, 40);
  ellipse(100, 65, 40, 40);
  //cloud 2
  ellipse(220, 40, 40, 40);
  ellipse(240, 30, 40, 40);
  ellipse(270, 55, 40, 40);
  ellipse(245, 60, 40, 40);
  ellipse(265, 35, 40, 40);
}


void mouseDragged() {
  //sun control
  background(0, 100, 200);
  // grass
  fill(0, 160, 70);
  rect(0, 240, 300, 300);
  fill(255, 255, mouseY, mouseX);
  noStroke();
  ellipse(50, mouseY, 20+x, 20+x);

  noStroke();
  fill(255);
  //cloud 1
  ellipse(60, 60, 40, 40);
  ellipse(80, 50, 40, 40);
  ellipse(70, 70, 40, 40);
  ellipse(100, 65, 40, 40);
  //cloud 2
  ellipse(220, 40, 40, 40);
  ellipse(240, 30, 40, 40);
  ellipse(270, 55, 40, 40);
  ellipse(245, 60, 40, 40);
  ellipse(265, 35, 40, 40); 

  //flower
  fill(255, 100, mouseY);
  ellipse(174, 238, 10, 10);
  ellipse(180, 233, 10, 10);
  ellipse(174, 226, 10, 10);
  ellipse(164, 233, 10, 10);
  ellipse(164, 226, 10, 10);
  //flower
  fill(100, 255, mouseY);
  ellipse(174+y, 238, 10, 10);
  ellipse(180+y, 233, 10, 10);
  ellipse(174+y, 226, 10, 10);
  ellipse(164+y, 233, 10, 10);
  ellipse(164+y, 226, 10, 10);
  //flower
  fill(255, 0, mouseY);
  ellipse(174+2*y, 238, 10, 10);
  ellipse(180+2*y, 233, 10, 10);
  ellipse(174+2*y, 226, 10, 10);
  ellipse(164+2*y, 233, 10, 10);
  ellipse(164+2*y, 226, 10, 10);
  //flower
  fill(50, 200, mouseY);
  ellipse(174+3*y, 238, 10, 10);
  ellipse(180+3*y, 233, 10, 10);
  ellipse(174+3*y, 226, 10, 10);
  ellipse(164+3*y, 233, 10, 10);
  ellipse(164+3*y, 226, 10, 10);
  //flower
  fill(100, 50, mouseY);
  ellipse(174+4*y, 238, 10, 10);
  ellipse(180+4*y, 233, 10, 10);
  ellipse(174+4*y, 226, 10, 10);
  ellipse(164+4*y, 233, 10, 10);
  ellipse(164+4*y, 226, 10, 10);
  //flower
  fill(255, 75, mouseY);
  ellipse(174+5*y, 238, 10, 10);
  ellipse(180+5*y, 233, 10, 10);
  ellipse(174+5*y, 226, 10, 10);
  ellipse(164+5*y, 233, 10, 10);
  ellipse(164+5*y, 226, 10, 10);
  //flower
  fill(75, 50, mouseY);
  ellipse(174+6*y, 238, 10, 10);
  ellipse(180+6*y, 233, 10, 10);
  ellipse(174+6*y, 226, 10, 10);
  ellipse(164+6*y, 233, 10, 10);
  ellipse(164+6*y, 226, 10, 10);
  x++;
}



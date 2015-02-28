
void setup () {
  size(300, 300);
  background(85);
}


void draw() {


  background(85);

  stroke(255);
  strokeWeight(8);
  fill(113, 48, 92);
  rect(50, 50, 50, mouseY);


  fill(224, 185, 86);
  rect(275, 100, -mouseY, 100);


  stroke(255);
  strokeWeight(2);
  fill(61, 103, 152);
  ellipseMode(CENTER);
  ellipse(225, 100, mouseX, 75);

  fill(21, 129, 16);
  ellipseMode(CENTER);
  ellipse(75, 220, 75, mouseX);
}

void mouseDragged() {
  //thirds grid layout:black
  stroke(0);
  strokeWeight(1);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);

  //sixths grid layout:grey
  stroke(162);
  strokeWeight(1);
  line(150, 0, 150, 300);
  line(0, 150, 300, 150);
  line(50, 0, 50, 300);
  line(250, 0, 250, 300);
  line(0, 50, 300, 50);
  line(0, 250, 300, 250);

background(255
    );
}













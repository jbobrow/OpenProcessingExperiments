
void setup() {
  size(1280, 720);
  smooth();
}

void draw() {

  background(0);
  //SHAPE VERDE
  stroke(138, mouseX, mouseY);
  strokeWeight(abs( mouseX - pmouseX ));
  noFill();
  bezier(mouseX, mouseY, 450, 1, 830, 1, mouseX, mouseY);
  line(mouseX, mouseY, 620, 470);
  line(mouseX, mouseY, 660, 470);

  //tentaculos
  bezier(mouseX, mouseY, 420, 400, 660, 600, 520, 580);
  bezier(mouseX, mouseY, 870, 400, 650, 600, 780, 580);

  //ojos
  stroke(255);
  strokeWeight(7);
  ellipseMode(RADIUS);
  ellipse(pmouseX, pmouseY, 20, 30);
  ellipse(pmouseY-10, 250, 20, 30);
  //pupilas azules
  fill(0, 0, mouseX);
  ellipse(pmouseX, 250, 10, 10);
  ellipse(pmouseY, 250, 10, 10);
  noFill();
  //boca
  stroke(mouseY, 71, 220);
  rect(pmouseX, 320, 80, 50, 18);
}

void mousePressed() {
  ellipse(mouseX, mouseY, 50, 50);
}

void keyPressed() {
  textSize(32);
  fill(255, 0, mouseX);
  text("HELLO", width/2, height/2);
}




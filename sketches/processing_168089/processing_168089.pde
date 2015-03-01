

void setup() {
  size(1280, 720);
  background(0);
  smooth();
}

void draw() {

  //SHAPE VERDE
  stroke(138, 227, 62);
  strokeWeight(10);
  noFill();
  bezier(520, 202, 450, 1, 830, 1, 760, 202);
  line(520, 202, 620, 470);
  line(760, 202, 660, 470);
  //tentaculos
  bezier(620, 473, 420, 400, 660, 600, 520, 580);
  bezier(660, 472, 870, 400, 650, 600, 780, 580);

  //ojos
  stroke(255);
  strokeWeight(7);
  ellipseMode(RADIUS);
  ellipse(600, 250, 20, 30);
  ellipse(680, 250, 20, 30);
  //pupilas azules
  fill(0, 0, 255);
  ellipse(600, 250, 10, 10);
  ellipse(680, 250, 10, 10);
  noFill();
  //boca
  stroke(250, 71, 220);
  rect(600, 320, 80, 50, 18);
}






float rotateAmountPuTri;
float rotateAmountPuCir;


void setup () {
  size (800, 600);
  ellipseMode(CENTER);
}

void draw () {
  background (166, 233, 255);

  //grass
  for (int i=0; i<799; i++) {
    stroke(69, 189, 71);
    strokeWeight (1);
    line(2*i+1, 560, 2*i+1, 600);
  }
  //flower stem
  stroke(69, 189, 71);
  strokeWeight (4);
  line(400, 450, 400, 600);

  //clouds
  noStroke();
  fill(255);
  ellipse(90, 80, 110, 90);
  ellipse(120, 55, 70, 70);
  ellipse(140, 80, 80, 80);
  ellipse(160, 70, 60, 60);

  ellipse(700, 80, 90, 80);
  ellipse(650, 90, 80, 80);
  ellipse(670, 60, 60, 60);

  //triangles
  noStroke();
  fill(129, 13, 224);
  triangle(250, 60, 220, 120, 280, 120);
  fill(247, 107, 9);
  triangle(350, 60, 320, 120, 380, 120);
  fill(232, 213, 12);
  triangle(450, 60, 420, 120, 480, 120);
  fill(224, 17, 108);
  triangle(550, 60, 520, 120, 580, 120);

  //circles
  fill(129, 13, 224);
  ellipse(250, 160, 60, 60);
  fill(247, 107, 9);
  ellipse(350, 160, 60, 60);
  fill(232, 213, 12);
  ellipse(450, 160, 60, 60);
  fill(224, 17, 108);
  ellipse(550, 160, 60, 60);

  //squares
  fill(129, 13, 224);
  rect(220, 200, 60, 60);
  fill(247, 107, 9);
  rect(320, 200, 60, 60);
  fill(232, 213, 12);
  rect(420, 200, 60, 60);
  fill(224, 17, 108);
  rect(520, 200, 60, 60);


  drawPurpleTriangle();
  drawPurpleCircle();

}

void drawPurpleTriangle() {
  fill(129, 13, 224,150);
  pushMatrix();
  translate(400, 400);
  rotate(rotateAmountPuTri);
  triangle(0, 10, 100, 110, 0, 110);
  triangle(10, 0, 110, 0, 110, -100);
  triangle(0, -10, 0, -110, -100, -110);
  triangle(-10, 0, -110, 0, -110, 100);
  rotateAmountPuTri = rotateAmountPuTri + 0.03;
  popMatrix();
}


void drawPurpleCircle() {
  fill(129, 13, 224,150);
  pushMatrix();
  translate(400, 400);
  rotate(rotateAmountPuCir);
  ellipse(30, 0, 50, 50);
  ellipse(0, -30, 50, 50);
  ellipse(-30, 0, 50, 50);
  ellipse(0, 30, 50, 50);
  rotateAmountPuCir = rotateAmountPuCir - 0.05;
  popMatrix();
}




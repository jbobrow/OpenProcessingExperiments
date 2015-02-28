
void setup() {
  size(600, 600);
}

void draw() {
  int q = mouseX;
  int w = mouseY;

  background(240);

  fill(200, 0, 0, 50);
  noStroke();
  ellipse(200, 200, 350, 350);
  //redbase


  strokeWeight(0);
  stroke(0);
  fill(150, 0, 0);
  ellipse(330, 330, 100, 100);
  //red



  strokeWeight(80);
  fill(100, 0, 100);
  ellipse(200, 200, 210, 210);
  //purple

  strokeWeight(1.5);
  line(202, 504, 562, 337);
  line(448, 47, 448, 350);
  line(379, 65, 551, 173);
  line(417, 205, 510, 205);
  line(425, 225, 547, 228);

  noFill();
  strokeWeight(10);
  arc(407, 267, 150, 100, 0, HALF_PI);

  strokeWeight(5);
  stroke(200, 200, 230);
  arc(121, 556, 100, 100, PI, TWO_PI);
  stroke(240, 200, 90);
  arc(221, 556, 100, 100, PI, TWO_PI);
  stroke(250, 100, 100);
  arc(321, 556, 100, 100, PI, TWO_PI);
  stroke(240, 200, 90);
  arc(421, 556, 100, 100, PI, TWO_PI);

  strokeWeight(1);
  stroke(0, 0, 0);
  arc(121, 556, 100, 100, PI, TWO_PI);
  arc(221, 556, 100, 100, PI, TWO_PI);
  arc(321, 556, 100, 100, PI, TWO_PI);
  arc(421, 556, 100, 100, PI, TWO_PI);

  line(19, 556, 540, 556);
}

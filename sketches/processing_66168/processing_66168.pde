
void setup() {
  size(800, 600);
  background(255, 212, 180);
  noStroke();
  smooth();

  beginShape(TRIANGLES);
  fill(198, 234, 237);
  vertex(220, 0);
  vertex(320, 600);
  vertex(420, 0);
  endShape();

  fill(255, 255, 255);
  rect(80, 320, 100, 200);

  noFill();
  stroke(0, 0, 0);
  bezier(130, 430, 200, 300, 300, 390, 350, 400);
  bezier(350, 400, 450, 430, 550, 450, 600, 300);
  bezier(600, 300, 630, 200, 620, 180, 650, 150);

  fill(0, 0, 0);
  noStroke();
  ellipse(600, 120, 50, 50);
  ellipse(700, 120, 80, 80);
  ellipse(700, 220, 30, 30);
  ellipse(665, 60, 20, 20);
  ellipse(615, 45, 40, 40);
  ellipse(700, 40, 25, 25);
  ellipse(750, 40, 10, 10);
  ellipse(720, 65, 10, 10);
  ellipse(670, 18, 5, 5);
  ellipse(670, 180, 10, 10);
  ellipse(750, 180, 20, 20);
  ellipse(650, 250, 20, 20);
  ellipse(570, 270, 30, 30);
  ellipse(510, 300, 45, 45);
  ellipse(560, 330, 15, 15);
  ellipse(520, 360, 20, 20);
  ellipse(570, 400, 10, 10);
  ellipse(545, 425, 5, 5);

  noFill();
  stroke(0, 0, 0);
  curve(750, 500, 500, 500, 750, 300, 400, 100);

  arc(600, 120, 60, 60, PI/2, PI);

  //The world of truth has opened up my eyes
  //1, 2.3 what's blinding my mind

  String world = "The world of truth has opened up my eyes; ";
  int one = 1;
  String comma =", ";
  float twothree = 2.3;
  String blind = " what's blinding my mind";

  print(world + one + comma + twothree + blind);
}



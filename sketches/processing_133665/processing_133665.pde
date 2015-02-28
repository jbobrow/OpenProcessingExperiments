
void setup() {
  background(63, 61, 83);
  size(900, 300); //size of window
  fill(0);
  stroke(255);

  //fartest left buildings
  rect(0, 185, 50, 115);

  //tallest left building
  rect(50, 100, 60, 200);
  quad(55, 80, 105, 90, 105, 100, 55, 100);
  strokeWeight(4);
  stroke(227, 34, 34);
  point(55, 80);
  point(105, 90);
  strokeWeight(1);
  stroke(255);

  //buildings left of space needle
  rect(120, 170, 50, 130);
  rect(110, 210, 30, 90);
  rect(130, 190, 50, 110);
  quad(220, 140, 230, 140, 250, 170, 200, 170);
  strokeWeight(4);
  stroke(227, 34, 34);
  point(220, 140);
  point(230, 140);
  strokeWeight(1);
  stroke(255);
  rect(200, 170, 50, 130);
  rect(180, 175, 40, 125);
  rect(240, 210, 40, 90);
  rect(290, 120, 60, 180);
  rect(310, 140, 50, 160);
  rect(280, 210, 40, 90);

  //space needle
  //left back legs
  strokeWeight(7);
  stroke(255);
  line(383, 82, 396, 140);
  line(396, 140, 375, 300);
  //top
  strokeWeight(1);
  stroke(255);
  ellipseMode(CORNER);
  ellipse(370, 72, 60, 10);
  rect(373, 64, 54, 10);
  ellipseMode(CENTER);
  ellipse(400, 60, 80, 15);
  ellipse(400, 55, 54, 10);
  quad(380, 40, 420, 40, 410, 55, 390, 55);
  line(400, 20, 400, 40);
  strokeWeight(4);
  stroke(227, 34, 34);
  point(400, 20);
  strokeWeight(1);
  stroke(0);
  //base
  fill(0);
  rect(394, 82, 10, 218);
  //left front legs
  strokeWeight(7);
  stroke(255);
  line(400, 82, 405, 140);
  line(405, 140, 390, 300);
  //right front legs
  line(415, 82, 405, 140);
  line(405, 140, 420, 300);

  //buildings right of space needle
  fill(0);
  strokeWeight(1);
  stroke(255);
  rect(440, 110, 40, 190);
  rect(455, 75, 40, 225);
  rect(520, 150, 50, 150);

  //slanted building
  quad(480, 180, 530, 200, 530, 300, 480, 300);

  rect(620, 150, 40, 150);

  //art deco top building
  rect(585, 120, 50, 180);
  triangle(585, 120, 610, 95, 635, 120); 
  line(590, 115, 630, 115);
  line(595, 110, 625, 110);
  line(600, 105, 620, 105);
  line(605, 100, 615, 100);
  rect(607, 91, 6, 6);
  //horizontal lines under triangle
  line(585, 130, 635, 130);
  line(585, 145, 635, 145);
  line(585, 160, 635, 160);
  //vertical lines under triangle
  line(595, 120, 595, 160);
  line(607, 120, 607, 160);
  line(612, 120, 612, 160);
  line(625, 120, 625, 160);
  strokeWeight(4);
  stroke(227, 34, 34);
  point(607, 91);
  point(613, 91);
  strokeWeight(1);
  stroke(255);

  //buildings right of art deco building
  rect(700, 120, 50, 180);
  rect(650, 200, 60, 100);
  rect(730, 140, 30, 160);
  rect(760, 180, 50, 120);
  quad(770, 165, 800, 165, 810, 180, 760, 180);
  rect(810, 200, 50, 100);
  rect(870, 210, 50, 190);
  rect(850, 220, 50, 80);

  save("seattle.tif");
  save("seattle.tga");
}




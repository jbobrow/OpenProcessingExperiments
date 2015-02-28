
void setup()
{
  size(241, 420);
  background(255, 244, 36);
  strokeWeight(7);
  stroke(0,0,0);
  fill(68, 169, 223);
  triangle(0, 210, 120, 0, 120, 210);
  strokeWeight(4);
  fill(128, 0, 255);
  triangle(0, 210, 241, 120, 120, 210);
  strokeWeight(6);
  fill(255, 0, 0);
  triangle(120, 152, 76, 120, 220, 145);
  fill(153, 48, 65);
  translate(40, 150);
  rect(30, 20, 55, 55);
  stroke(10);
  fill(83, 162, 204);
  ellipse(150, 210, 55, 55);
  fill(255, 255, 255);
  strokeWeight(4);
  translate(0, -75);
  rect(-35, 175, 150, 90);
  translate(-10, 70);
  fill(255, 128, 0);
  rect(5, 100, 30, 15);
  fill(0, 255, 64);
  rect(50, 75, 50, 65);
  line(25, 40, 30, 400);
  line(30, 400, 400, 120);
  translate(40, 50);
  quad(38, 31, 86, 20, 69, 63, 30, 76);
}



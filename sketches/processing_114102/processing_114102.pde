

void setup() {
  size(999, 600);
}
void draw() {

  //1. landskab, sol, baggrund


  //jord

  background(40, 176, 247);
  fill(85, 50, 27);
  rect(0, 150, 999, 999);
  fill(255, 255, 255);
  line(0, 150, 999, 150);
  fill(255, 247, 8);

  //sol

  stroke(255, 255, 0);
  ellipse(970, 0, 150, 150);
  stroke(0, 0, 0);
  fill(255, 255, 255);
  fill(0, 255, 0);
  rect(0, 150, 999, 20);
  fill(255, 255, 255);
  
  //2.Flere stickmen, skyer og huse
  
  //flere stickmen

  stickman(0, 0);
  stickman(20, 0);
  stickman(95,0);
  stickman(265,0);

  //flere skyer

  skyer(0, 0);
  skyer(-100, 0);
  skyer(125, -20);
  skyer(-160, -45);
  skyer(-275, -62);
  skyer(-290, -37);
  skyer(-305, -40);
  skyer(-320, -62);
  skyer(-340, -37);

  //flere huse

  fill(18, 250, 244);
  tegnhus(50, 10);
  fill(255, 255, 255);
  fill(250, 134, 18);
  tegnhus(150, 10);
  fill(255, 255, 255);
  fill(250, 18, 247);
  tegnhus(220, 10);
  fill(255, 255, 255);
  fill(18, 42, 250);
  tegnhus(290, 10);
  fill(255, 255, 255);
}

  //3. Funktioner der skaber flere huse

  //huse

void tegnhus(int x, int y) {

  rect(50+x, 100+y, 40, 40);
  beginShape();
  vertex(50+x, 100+y);
  vertex(90+x, 100+y);
  vertex(70+x, 90+y);
  vertex(50+x, 100+y);
  endShape();
}

  //skyer

void skyer(int x, int y) {

  stroke(255, 255, 255);
  ellipse(620+x, 40+y, 25, 25);
  ellipse(630+x, 50+y, 25, 25);
  ellipse(630+x, 60+y, 25, 25);
  ellipse(620+x, 70+y, 25, 25);
  ellipse(610+x, 70+y, 25, 25);
  ellipse(600+x, 65+y, 25, 25);
  ellipse(590+x, 55+y, 25, 25);
  ellipse(600+x, 50+y, 25, 25);
  ellipse(600+x, 45+y, 25, 25);
  ellipse(610+x, 50+y, 25, 25);
  stroke(0, 0, 0);
}

  //stickman

void stickman(int x1, int y1) {

  line(150+x1, 150+y1, 160+x1, 120+y1);
  line(160+x1, 120+y1, 170+x1, 150+y1);
  line(160+x1, 120+y1, 160+x1, 100+y1);
  line(160+x1, 100+y1, 150+x1, 120+y1);
  line(160+x1, 100+y1, 170+x1, 120+y1);
  line(160+x1, 100+y1, 160+x1, 95+y1);
  fill(0, 255, 0);
  ellipse(160+x1, 90+y1, 15, 15);
  fill(255, 255, 255);
}


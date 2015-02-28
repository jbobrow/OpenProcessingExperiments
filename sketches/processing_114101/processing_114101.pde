

void setup() {
  size(999, 600);
}
void draw() {
  
//landskab, sol, baggrund
  
  
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
  
//stickman
  
  line(150, 150, 160, 120);
  line(160, 120, 170, 150);
  line(160, 120, 160, 100);
  line(160, 100, 150, 120);
  line(160, 100, 170, 120);
  line(160, 100, 160, 95);
  ellipse(160, 90, 15, 15);

//flere skyer

  skyer(0,0);
  skyer(-100,0);
  skyer(125,-20);
  
//flere huse
  
  tegnhus(0, 10);
  tegnhus(150, 10);
  tegnhus(220, 10);
  tegnhus(290, 10);
}

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



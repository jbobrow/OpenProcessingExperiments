
void setup() {
  size(400, 400);
  frameRate(10);
}

void draw() {
  
  int r = (int) random(255);
  int g = (int) random(255);
  int b = (int) random(255);
  println(r);
  
  background(255, 255, 255);
  line(30, 0, 30, 400);
  line(250, 0, 250, 400);
  line(0, 80, 400, 80);
  line(0, 320, 400, 320);
  line(0, 190, 400, 190);
  line(310, 0, 310, 400);
  line(80, 0, 80, 400);
  rectMode(CORNERS);
  fill(r, g, b);
  rect(310, 0, 250, 60);
  fill(g, r, b);
  rect(30, 80, 80, 160);
  fill(b, g, r);
  rect(80, 190, 250, 240);
  line(140, 0, 140, 190);
  line(80, 160, 250, 160); 
  line(90, 240, 90, 320);
  line(130, 240, 130, 320);
  line(165, 240, 165, 320);
  line(235, 240, 235, 320);
  line(230, 240, 230, 320);
  fill(g, b, r);
  rect(180, 355, 250, 400);
  fill(b, r, g);
  rect(165, 320, 200, 355);
  fill(r, b, g);
  rect(0, 320, 30, 400);
  line(310, 300, 400, 300);
  fill(0, 255, b);
  rect(310, 200, 400, 280);
  line(0, 20, 250, 20);
  line(0, 60, 80, 60);
  line(250, 125, 400, 125);
  line(360, 0, 360, 190);
  fill(90, g, 120);
  rect(310, 370, 400, 400);
  line(80, 355, 400, 355);
}



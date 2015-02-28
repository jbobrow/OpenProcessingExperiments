
int x = 50;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255,255,255);

  smooth();
  fill(0,0,0);
  ellipse(195, 172, 28.67, 28.67);
  ellipse(309, 171, 28.67, 28.67);
  ellipse(231, 271, 10.67, 10.67);

  ellipse(283, 271, 10.67, 10.67);
  ellipse(220, 320, 83, 19.50);
  ellipse(296, 320, 83, 19.50);
  ellipse(259, 330, 108.50, 13);
  ellipse(88, 169, 15.50, 28.50);
  ellipse(424, 169, 15.50, 28.50);
  fill(255, 255, 255);
  float xpos = map(mouseX, 10, width, 20, 300);
  float dia = map(mouseX, 0, width, 20, 300);
  ellipse(xpos, height/3, dia, dia);


  noStroke();



  fill(0,0,0);
  rect(223, 382, 72, 115.50);
  rect(130, 130, 107, 11.50);
  rect(266, 129, 107, 11.50);
  rect(421, 240, 15, 259.50);
  rect(79, 241, 15, 258.50);
  rect(85, 422, 339.50, 80.50);
}




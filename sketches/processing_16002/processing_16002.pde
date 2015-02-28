
void setup() {
  size(600,600);
}

void draw() {
  smooth();
  star(int(random(310,390)),0,0);
  star(int(random(310,390)),300,0);
  star(int(random(310,390)),-300,0);
}

void star(int gg, int transX, int transY) {
  pushMatrix();
  translate(transX,transY);
  beginShape();
  smooth();
  noStroke();
  fill(0);
  vertex(200,315);
  vertex(300,300);
  vertex(350,200);
  vertex(398,300);
  vertex(500,315);
  vertex(420,380);
  vertex(430,480);
  vertex(352,425);
  vertex(270,480);
  vertex(282,380);
  vertex(200,315);


  endShape();
  fill(255);
  ellipse(320,320,20,20);
  ellipse(382,320,20,20);
  ellipse(352,380,20,50);

  fill(0);
  noStroke();
  ellipse(gg,320,5,5);
  ellipse(gg,320,5,5);
  popMatrix();
}



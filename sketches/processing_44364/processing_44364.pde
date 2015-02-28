
float a = 0;
float b = 500;
float c = 45;
float d= 90;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {

  drawCross();
}

void drawCross() {  
  background (34, 67, 128);
  fill(0);
  noStroke();
  rect(a, a, c, c, 5, 5);
  rect (b-45, a, c, c, 5, 5);
  rect (a, b-45, c, c, 5, 5);
  rect (b-45, b-45, c, c, 5, 5);

  fill (34, 65, 12, 60);
  rect(a, a, d, d, 5, 15);
  rect (b-d, a, d, d, 15,15);
  rect (a, b-d,d, d, 15, 15);
  rect (b-d, b-d, d, d, 15, 15);
  
    fill (234, 85, 62, 40);
  rect(a, a, d, d, 95, 95);
  rect (b-d, a, d, d, 95,95);
  rect (a, b-d,d, d, 95, 95);
  rect (b-d, b-d, d, d, 95, 95);


  fill(mouseY, mouseX, 78, 98);
  stroke (mouseY, mouseY, mouseX);
  ellipse(mouseX, mouseY, 45, 45);
}



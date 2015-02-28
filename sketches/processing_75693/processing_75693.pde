
//Austin Ahn
//Introduction to Digital Media Fall 2012. 1b
//Section A
// 9.11.12

float randomDiameter = 0; //global variable= integer
float strokeGrey =0; //global variable= fine

void setup() {
  size (1200, 600);
  background (0, 180, 200);
  
}

void draw() {
  smooth();
  stroke (strokeGrey);
  strokeWeight (6);
  //background (255);
  fill (0);

  for (int i = 0; i < 1200; i = i+3) {
    line(0, 400, i+1, 600);
  }
  for (int i = 10; i < 200; i = i+100) {
    line(0, 200, 80+i, 0);
  }
  stroke(255);

  for (int i = 0; i < 600; i = i+5) {
    line(0, i*6, 1200, i);
  }

  //randomDiameter=random(200,400)
  if (randomDiameter <200) {
    randomDiameter++;
  }
  else {
    randomDiameter=0;
  }
  ellipse (mouseX, mouseY, randomDiameter, randomDiameter);
  //rect (mouseX, mouseY, 40, 100);
  ellipse (randomDiameter, randomDiameter, 300, randomDiameter);
  
}

void mouseClicked() {
  if (strokeGrey==0) {
    strokeGrey= 255;
  }
  else {
    strokeGrey=0;
  }}

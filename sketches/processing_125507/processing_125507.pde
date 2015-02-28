
float x = 200;
float y = 200;

float x1 = 300;
float y1 = 300;

float x2 = 400;
float y2 = 100;

float x3 = 100;
float y3 = 400;

float x4 = 200;
float y4 = 100;

float x5 = 300;
float y5 = 10;


void setup() {
  size(400, 400);
  rectMode(CENTER);
}


void draw() {
  background(255/2);
  fill(0, 255/2);
  ellipse(x, y, 20, 20);

  x = (mouseX - x) /50 + x;
  y = (mouseY - y) /50 + y;


  fill(0, 255/4);
  ellipse(x1, y1, 30, 30);

  x1 = (mouseX - x1) /75 + x1;
  y1 = (mouseY - y1) /75 + y1;

  fill(0, 255/2);
  ellipse(x2, y2, 50, 50);

  x2 = (mouseX - x2) /100 + x2;
  y2 = (mouseY - y2) /100 + y2;

  fill(255, 255/2);
  ellipse(x3, y3, 80, 80);

  x3 = (mouseX - x3) /30 + x3;
  y3 = (mouseY - y3) /30 + y3;

  noStroke();
  fill(255, 255/6);
  rect(x4, y4, 110, 110);
  x4 = (mouseX - x4) /10 + x4;
  y4 = (mouseY - y4) /10 + y4;

  fill(0, 255/6);
  rect(x5, y5, 10, 10);
  x5 = (mouseX - x5) /30 + x5;
  y5 = (mouseY - y5) /35 + y5;

  //hintergrund
  stroke(0, 50);
  strokeWeight(1);
  for (int s = 0; s < 50; s++) {
    line(pow(s, 2)-600, pow(s, 2)+10, pow(s, 2)+800, pow(s, 2)-600);
  }

  for (int s1 = 0; s1 < 50; s1++) {
    line(pow(s1, 2)-600, pow(s1, 2)+40, pow(s1, 2)+600, pow(s1, 2)-600);
  }
  //linie
  line(40, mouseY, 360, mouseY);
  line(mouseX, 360, mouseX, 40);
}


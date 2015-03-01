
float diameter; 
float angle = 0;

void setup() {
  size(640, 360);
  noSmooth();
  diameter = height - 100;
  noStroke();
  noStroke();
  fill(255, 204, 0);
}

void draw() {

  background(255);
  PImage img;
  img = loadImage("disco-ball1.jpg");
  image(img, 0, 0);

  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/4;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;

  fill(255);
  ellipse(width/2, height/2, d1, d1);
  fill(0, 0, 100);
  ellipse(mouseY, 300, d1, d1);
  fill(0, 0, 100);
  ellipse(mouseX, 450, d1, d1);
  fill(0, 0, 100);
  ellipse(200, mouseX, d1, d1);
  fill(255);
  ellipse(450, mouseY, d1, d1);

  angle += 1;

}




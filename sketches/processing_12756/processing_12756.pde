
// Assignment # 3
// Name: Natalie Kato
// E-mail: nkato@brynmawr.edu   
// Date: September 23, 2010 

float x1;
float y1 = 50;
float w1 = 35;
float h1 = 35;
int speed = 1;
int clickChange = 1;
float x2 = 500;
float y2 = 0;
float w2 = 10;
int fillColor = 0;

void setup() {
  size(500, 500);
  smooth();
  frameRate(2);
}

void draw() {
  //purple background.
  background(255); 

  //creates snow.
  if (clickChange == -1) {
    background(225, 180, 225);
    for (; y2 < height; y2++) { 
      drawSnow(x2, y2, w2, fillColor);
    }

    y2 = 0;
  }

  //creates penguins along x and y axis.
  for(x1 = 50; x1 < width; x1 += 81) {
    for(y1 = 30; y1 < height; y1 += 125) {
      drawPenguin(x1, y1, w1, h1, fillColor);
    }
    drawPenguin(x1, y1, w1, h1, fillColor);
  }
}

void drawPenguin(float x, float y, float w, float h, int fillColor) {
  noStroke();
  fill(fillColor + 242, fillColor + 205, fillColor + 83);

  //penguin feet.
  ellipse(x, y + 70, w + 10, h - 30);

  //penguin body.
  stroke(1);
  if (clickChange == -1) {
    fill(random(0, 255), random(0, 255), random(0, 255));
  } 
  else {
    fill(fillColor);
  }
  ellipse(x, y + 40, w + 20, h + 30);

  //penguin head.
  ellipse(x, y, w + 5, h);

  //penguin eyes.
  strokeWeight(2);
  stroke(255);
  fill(0);
  ellipse(x - 5, y - 2, w - 30, h - 30);
  ellipse(x + 5, y - 2, w - 30, h - 30);

  //penguin mouth.
  noStroke();
  fill(fillColor + 242, fillColor + 205, fillColor + 83);
  triangle(x - 6, y + 5, x + 6, y + 5, x, y + 15);

  //penguin stomach.
  fill(fillColor + 255);
  ellipse(x, y + 45, w - 5, h + 15);

  //penguin wings.
  fill(fillColor);
  stroke(1);
  beginShape();
  curveVertex(x - 15, y + 25);
  curveVertex(x - 15, y + 25);
  curveVertex(x - 28, y + 45);
  curveVertex(x - 35, y + 52);
  curveVertex(x - 27, y + 30);
  curveVertex(x - 20, y + 28);
  endShape();
  beginShape();
  curveVertex(x + 15, y + 25);
  curveVertex(x + 15, y + 25);
  curveVertex(x + 28, y + 45);
  curveVertex(x + 35, y + 52);
  curveVertex(x + 27, y + 30);
  curveVertex(x + 20, y + 28);
  endShape();
}
void drawSnow(float x, float y, float w, int fillColor) {
  //snow.
  fill(fillColor + 255);
  noStroke();

  x = random(0, width);
  w = random(5, 20);
  ellipse(x, y, w, w);
}

void mousePressed() {
  clickChange = clickChange * -1;
}



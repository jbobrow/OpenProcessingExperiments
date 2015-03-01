

float posX = 0;
float posY = 0;
PFont font1;

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255, 102, 178);
  fill(0);
  for (int i = 0; i < 30; i++) {
    for (int j=0; j<30; j++) {
      drawShape(i, j);
    }
  }

  textAlign(CENTER);
  font1 = loadFont("Bauhaus93-48.vlw");
  textFont(font1, 40);
  fill(0);
  text("Psycadelic", width/2, height/2);
}

void drawShape(int counti, int countj) {
  pushMatrix();
  translate(posX + counti * 40 + 10, posY + countj *40 +10);
  rotate(frameCount/2);
  if (counti%2 == 0) {
    fill(51, 255, 255);
    ellipse(0, 0, 40, 20);
  } else {
    fill(255, 255, 51);
    rect(0, 0, 20, 20);
  }
  popMatrix();
}






//modulate your lines
//plus random effect


import processing.pdf.*;

float circleX;
float circleY;

void setup() {
  size(900, 700);
  circleX = width/2;

  beginRecord(PDF, "output#########.pdf");
  background(0);
}

void draw() {
  if (mousePressed) {
    circleX = random(width);
    circleY = random(height);
    stroke(255);
    strokeWeight(0.5);
    noFill();


    line(300, 350, mouseX, mouseY);
    line(250, 450, circleX, circleY);
    line(280, 489, mouseX, mouseY);
    line(298, 250, circleX, circleY);
    line(300, 400, mouseX, mouseY);
    line(300, 450, circleX, circleY);
    line(550, 390, mouseX, mouseY);
    line(600, 430, circleX, circleY);
    line(540, 320, mouseX, mouseY);


    endShape();
  }
}

void keyPressed() {
  if (key == 'r');
  endRecord();
}


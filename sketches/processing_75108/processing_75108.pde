
// Oliver Haimson 
// Assignment 07A
// Copyright 2012

boolean black2, black3, black7, black8;

void setup() {
  size(200, 500);
  smooth();
  noStroke();
  // draw circles
  for (int i=50; i<500; i+=100) {
    fill(0);
    ellipse(50, i, 100, 100);
    fill(255);
    ellipse(150, i, 100, 100);
  }
  // draw arrows
  stroke(255);
  drawArrow(50, 50, 1);
  drawArrow(50, 50, -1);
  drawArrow(30, 150, -1);
  drawArrow(70, 150, -1);
  drawArrow(30, 250, 1);
  drawArrow(70, 250, 1);
  drawArrow(50, 350, -1);
  drawArrow(50, 450, 1);
  stroke(0);
  drawArrow(150, 50, 1);
  drawArrow(150, 50, -1);
  drawArrow(130, 150, -1);
  drawArrow(170, 150, -1);
  drawArrow(130, 250, 1);
  drawArrow(170, 250, 1);
  drawArrow(150, 350, -1);
  drawArrow(150, 450, 1);
  black2 = true;
  black3 = true;
  black7 = false;
  black8 = false;
}

void draw() {
}

void mousePressed() {
  // button 1
  if (dist(mouseX, mouseY, 50, 50) <= 50) {
    fill(255);
    noStroke();
    ellipse(50, 50, 100, 100);
    stroke(0);
    drawArrow(50, 50, 1);
    drawArrow(50, 50, -1);
  }
  // button 6
  else if (dist(mouseX, mouseY, 150, 50) <= 50) {
    fill(0);
    noStroke();
    ellipse(150, 50, 100, 100);
    stroke(255);
    drawArrow(150, 50, 1);
    drawArrow(150, 50, -1);
  }
  // button 2
  else if (dist(mouseX, mouseY, 50, 150) <=50) {
    black2=!black2;
    if (black2) {
      fill(255);
      noStroke();
      ellipse(50, 150, 100, 100);
      stroke(0);
      drawArrow(30, 150, -1);
      drawArrow(70, 150, -1);
    }
    else {
      fill(0);
      noStroke();
      ellipse(50, 150, 100, 100);
      stroke(255);
      drawArrow(30, 150, -1);
      drawArrow(70, 150, -1);
    }
  }
  // button 7
  else if (dist(mouseX, mouseY, 150, 150) <=50) {
    black7=!black7;
    if (black7) {
      fill(255);
      noStroke();
      ellipse(150, 150, 100, 100);
      stroke(0);
      drawArrow(130, 150, -1);
      drawArrow(170, 150, -1);
    }
    else {
      fill(0);
      noStroke();
      ellipse(150, 150, 100, 100);
      stroke(255);
      drawArrow(130, 150, -1);
      drawArrow(170, 150, -1);
    }
  }
  // button 4
  else if (dist(mouseX, mouseY, 50, 350) <=50) {
    fill(255);
    noStroke();
    ellipse(50, 350, 100, 100);
    stroke(0);
    drawArrow(50, 350, -1);
  }
  // button 9
  else if (dist(mouseX, mouseY, 150, 350) <=50) {
    fill(0);
    noStroke();
    ellipse(150, 350, 100, 100);
    stroke(255);
    drawArrow(150, 350, -1);
  }
}

void mouseReleased() {
  // button 1
  if (dist(mouseX, mouseY, 50, 50) <= 50) {
    fill(0);
    noStroke();
    ellipse(50, 50, 100, 100);
    stroke(255);
    drawArrow(50, 50, 1);
    drawArrow(50, 50, -1);
  }
  // button 6
  else if (dist(mouseX, mouseY, 150, 50) <= 50) {
    fill(255);
    noStroke();
    ellipse(150, 50, 100, 100);
    stroke(0);
    drawArrow(150, 50, 1);
    drawArrow(150, 50, -1);
  }
  // button 3
  else if (dist(mouseX, mouseY, 50, 250) <= 50) {
    black3=!black3;
    if (black3) {
      fill(255);
      noStroke();
      ellipse(50, 250, 100, 100);
      stroke(0);
      drawArrow(30, 250, 1);
      drawArrow(70, 250, 1);
    }
    else {
      fill(0);
      noStroke();
      ellipse(50, 250, 100, 100);
      stroke(255);
      drawArrow(30, 250, 1);
      drawArrow(70, 250, 1);
    }
  }
  // button 8
  else if (dist(mouseX, mouseY, 150, 250) <= 50) {
    black8=!black8;
    if (black8) {
      fill(255);
      noStroke();
      ellipse(150, 250, 100, 100);
      stroke(0);
      drawArrow(130, 250, 1);
      drawArrow(170, 250, 1);
    }
    else {
      fill(0);
      noStroke();
      ellipse(150, 250, 100, 100);
      stroke(255);
      drawArrow(130, 250, 1);
      drawArrow(170, 250, 1);
    }
  }
  // button 5
  else if (dist(mouseX, mouseY, 50, 450) <=50) {
    fill(255);
    noStroke();
    ellipse(50, 450, 100, 100);
    stroke(0);
    drawArrow(50, 450, 1);
  }
  // button 10
  else if (dist(mouseX, mouseY, 150, 450) <=50) {
    fill(0);
    noStroke();
    ellipse(150, 450, 100, 100);
    stroke(255);
    drawArrow(150, 450, 1);
  }
}

void drawArrow(float x, float y, float updown) {
  strokeWeight(7);
  strokeJoin(ROUND);
  line(x, y-30, x, y+30);
  line(x, y-30*updown, x-15, y-15*updown);
  line(x, y-30*updown, x+15, y-15*updown);
}

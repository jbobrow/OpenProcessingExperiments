
// Assignment # 2
// Name: Sandra Tamarin
// E-mail: stamarin@haverford.edu
// Course: CS 110 - Section 001
// Submitted: 9/18/12

// Description: Randomly-generated skyscrapers and trees on the edge of water,
// that change size and color when a key is pressed. If the mouse is pressed, 
// depending on its X and Y positions, either a cloud, a bird, or one of two 
// different sizes of randomly-colored fish will be drawn. When a key is
// pressed again, the background changes and everything that has been added
// from mouse presses disappears.

void setup() {
  size(500,600);
  smooth();
}

void draw() {
}

void mousePressed(){
  // set fish size variables
  float fishW = 70;
  float fishH = 35;
  
  // draw clouds if mouse pressed in upper 1/4 of window
  if ((mouseY <= height/4)) {
    noStroke();
    fill(255, 255, 255, 220);
    ellipse(mouseX, mouseY, 80, 40);
    ellipse(mouseX+60, mouseY, 70, 35);
    ellipse(mouseX+30, mouseY-20, 60, 30);
    
  } // draw birds if mouse pressed in 2nd 1/4 of window
    else if ((mouseY <=height/2) && (mouseY >= height/4)) {
    noStroke();
    fill(240);
    ellipse(mouseX, mouseY, 10, 10);
    ellipse(mouseX-10, mouseY+5, 20, 10);
    fill(0);
    ellipse(mouseX+1, mouseY-2, 2, 2);
    fill(255, 200, 100);
    triangle(mouseX+5, mouseY-4, mouseX+10, mouseY, mouseX+5, mouseY+4);
    fill(240);
    triangle(mouseX-15, mouseY+5, mouseX-10, mouseY-5, mouseX-5, mouseY+5);
    
  } // draw small fish if mouse pressed in 3rd 1/4 of window
    else if ((mouseY > height/2 + 11) && (mouseY < 3*height/4)) {
    float r = random(0, 255);
    float g = random(0, 255);
    float b = random(0, 255);
    fill(r, g, b, 120);
    noStroke();
    ellipse(mouseX, mouseY, fishW/3, fishH/3);
    triangle(mouseX-20, mouseY-7, mouseX-11, mouseY, mouseX-20, mouseY+7);
    fill(0);
    ellipse(mouseX+7, mouseY-1, 2, 2);
    
  } // draw big fish if mouse pressed in bottom 1/4 of window
    else if (mouseY >= 3*height/4){
    float r = random(0, 255);
    float g = random(0, 255);
    float b = random(0, 255);
    noStroke();
    fill(r, g, b, 120);
    ellipse(mouseX, mouseY, fishW, fishH);
    triangle(mouseX-55, mouseY-15, mouseX-35, mouseY, mouseX-55, mouseY+15);
    fill(0);
    ellipse(mouseX+25, mouseY-4, 4, 4);
  }
}

void keyPressed() {
  // call drawBackground
  drawBackground();
}

void drawBackground() {
  // draw midline and sky
  line(0, height/2, width, height/2);
  fill(100, 200, 255);
  rect(0, 0, 2*width, 2*height);
  
  // draw random buildings
  for (int x = 0; x < width; x+=60) {
    float rectW = random(60, 100);
    float rectH = random(200, 400);
    float rectColor = random(50, 200);
    rectMode(CENTER);
    stroke(0);
    fill(rectColor);
    rect(x, height/2, rectW, rectH);
  }
  
  // draw random trees
  for (int x = 0; x < width; x+=50) {
    float rectW2 = random(5, 20);
    float rectH2 = random(60, 200);
    fill(100, 60, 40);
    rect(x, height/2, rectW2, rectH2);
    float r = random(0, 100);
    float g = random(50, 255);
    float b = random(0, 100);
    fill(r, g, b);
    ellipse(x, height/2 - rectH2/2, 5*rectW2, rectH2/4);
    ellipse(x, height/2 + rectH2/2, 5*rectW2, rectH2/4);
  }
  
  // draw water
  fill(40, 100, 150, 220);
  rect(0, height, 2*width, height);
}


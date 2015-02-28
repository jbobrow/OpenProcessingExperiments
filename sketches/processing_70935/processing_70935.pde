
/*****************************************
 * Assignment 2
 * Name: Emma Sawin
 * E-mail: esawin@haverford.edu
 * Course:  CS 110 - Section 01
 * Submitted: 9/19/2012
 *
 * This program randomly generates a background of rainclouds
 * and rain, and regenerates this background when a key is 
 * pressed. When the mouse is clicked, it generates a lightning
 * bolt or varying size where the click was.
 *
***********************************************/


void setup() {
 size(700,700);
 smooth();
 drawBackground();
}

void draw() {  
}

//lightning bolt appears when a key is pressed, wherever the mouse is
void mousePressed() {
  stroke(200, 200, 0);
  //wieght of lightning bolt is larger when mouse is higher on the screen
  strokeWeight((700 - mouseY) / 30);
  strokeCap(PROJECT);
  
  //shape of bolt depends on left or right side of screen
  if (mouseX < 350) {
    line(mouseX, mouseY, mouseX + 30, mouseY + 50);
    line(mouseX + 30, mouseY + 50, mouseX - 10, mouseY + 100);
    line(mouseX - 10, mouseY + 100, mouseX + 20, mouseY + 150);
  }
  
  else {
    line(mouseX, mouseY, mouseX - 30, mouseY + 50);
    line(mouseX - 30, mouseY + 50, mouseX + 10, mouseY + 100);
    line(mouseX + 10, mouseY + 100, mouseX - 20, mouseY + 150);
  }
}

//when any key is pressed, image is cleared and background randomly regenerates
void keyPressed() {
  drawBackground();
}

//this is the code for randomly generating the background
void drawBackground() {
  background(45, 0, 150); 
  //randomly generate 6 clouds
  int i = 1;
  
  while (i < 7) {
    
    float cloudX = random(50, 650);
    float cloudY = random(60, 270);
    
    noStroke();
    fill(random(125, 175));
    //these 5 ellipses are one cloud
    ellipse(cloudX + (random(-50, 50)), cloudY + (random(-30, 30)), 100, 70);
    ellipse(cloudX + (random(-50, 50)), cloudY + (random(-30, 30)), 100, 70);
    ellipse(cloudX + (random(-50, 50)), cloudY + (random(-30, 30)), 100, 70);
    ellipse(cloudX + (random(-50, 50)), cloudY + (random(-30, 30)), 100, 70);
    ellipse(cloudX + (random(-50, 50)), cloudY + (random(-30, 30)), 100, 70);
    
    int j = 1; 
    
    //randomly generate 100 raindrops below each cloud
    while (j < 101){
      fill(0);
      ellipse(random(cloudX - 80, cloudX + 80), random(cloudY + 50,700), 2, 15);
      j++;
    } 
    i++;
  }
}

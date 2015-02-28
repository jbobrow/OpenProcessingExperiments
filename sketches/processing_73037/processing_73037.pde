
/*****************************************
 * Assignment 03
 * Name:         Angela Mastrianni  
 * E-mail:       amastriann@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    10/2/12
 * 
 * This is a sketch of a landscape with balloons, flowers, clouds and sun. When the mouse is
 near the sun the flowers are yellow, when the mouse is anywhere in the sky the flowers are 
 purple and when the mouse is located somewhere in the grass the flowers are red. When the mouse
 is over the flowers, they alternate random colors. If you press the mouse on the clouds, rain 
 appears. Pressing a key clears the background and resets it.
***********************************************/


//set up sketch
void setup() {
  size(500, 500);
  drawBackground();
}


void draw() {
//draw flowers
  float x;
  for (x=0; x<500;x=x+30) {
    drawFlowers(x, 390, 10, 10);
  }
}

/******
 Function:drawBackground
 draws the background
 Inputs:none
 Outputs:none
 ******/

void drawBackground () {
  background(0, 165, 200);
//draw Sun
  fill(212,212,0);
  strokeWeight(0);
  ellipse(425,50,75,75);
//draw grass
  fill(0, 200, 0);
  rect(0, 425, 500, 75);
//add clouds and balloons
  strokeWeight(1);
  fill(255);
  drawClouds(random(70, 100), random(60, 80), random(70, 100), random(30, 50));
  drawClouds(random(250, 300), random(30, 60), random(70, 100), random(30, 50));
  drawClouds(random(400, 425), random(90, 110), random(100, 125), random(30, 50));
  drawBalloons(random(50, 150), random(150, 300), random(50, 70), random(90, 115));
  drawBalloons(random(150, 300), random(150, 300), random(50, 70), random(90, 115));
  drawBalloons(random(300, 400), random(150, 300), random(50, 70), random(90, 115));
}
/*****
 Function: drawClouds
 draws a Cloud
 Inputs:x,y,width,height
 Outputs:none
 ********/
void drawClouds(float x, float y, float objectWidth, float objectHeight) {
  ellipse(x, y, objectWidth, objectHeight);
  ellipse(x-100, y, objectWidth, objectHeight);
  ellipse(x-60, y+15, objectWidth, objectHeight);
}

/*******
 Function:drawBalloons
 draws a balloon
 Inputs:x,y,width,height
 Ouputs:none
 ******/
void drawBalloons(float x, float y, float objectWidth, float objectHeight) {
  strokeWeight(3);
  fill(random(0, 225), random(0, 225), random(0, 225));
  ellipse(x, y, objectWidth, objectHeight);
//add string to balloon
  line(x, y+(objectHeight/2), x, y+((objectHeight/2)+100));
}

/*******
 Function:drawFlowers
 draws a flower
 Inputs:x,y,width,height
 Outputs:none
 *******/
void drawFlowers(float x, float y, float objectWidth, float objectHeight) {
//stem
  fill(0, 200, 0);
  rect(x-3, y, objectWidth-5, objectHeight+25);
//change color of flowers when mouse is over them
  if (mouseY<405 && mouseY>385) {
    fill(random(255), random(255), random(255));
  } 
//change color of flower based on position
  if (mouseY>400) {
    fill(170,0,0);
  }
  if (mouseY<390) {
    fill(170,0,170);
  }
    if (mouseX>338 && mouseX<462 && mouseY>13 && mouseY<87){
    fill(212,212,0);
  }
//petals
  ellipse(x, y+5, objectWidth, objectHeight+10);
  ellipse(x-10, y, objectWidth+10, objectHeight);
  ellipse(x, y-5, objectWidth, objectHeight+10);
  ellipse(x+10, y, objectWidth+10, objectHeight);
  fill(0);
  ellipse(x, y, objectWidth, objectHeight);
}

//makes the clouds rain
void mousePressed () {
  if (mouseY>30 && mouseY<110) {
  for (int x=0; x<500; x=x+25) {
    fill(0, 150, 200);
    strokeWeight(1);
    ellipse(x, random(125, 500), 10, 20);
  }
  }
}

//clears and redraws background
void keyPressed () {
  drawBackground();
}



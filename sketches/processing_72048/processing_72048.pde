
/*****************************************
 * Assignment 3
 * Name: Emma Sawin
 * E-mail: esawin@haverford.edu
 * Course:  CS 110 - Section 01
 * Submitted: 9/26/2012
 *
 * This is a sketch of several trees. There is 
 * a sun that can follows the mouse, and its 
 * position affects the light of the picture, the 
 * like of the trees, and the position of the 
 * shadows of the trees
 *
***********************************************/


void setup() {
 size(500,500);
 smooth();
 background(180, 190, 255);
 rectMode(CORNER);
 noStroke();
 fill(100, 200, 100);
 rect(0, 350, 500, 250);
}
 
//below are the randomly generated locations and sizes of trees and clouds
float tree1X = random(30, 160);
float tree2X = random(170, 310);
float tree3X = random(320, 470);

float tree1Y = random(370, 470);
float tree2Y = random(370, 470);
float tree3Y = random(370, 470);

float tree1Width = random(10, 40);
float tree2Width = random(10, 40);
float tree3Width = random(10, 40);

float tree1Height = random(100, 200);
float tree2Height = random(100, 200);
float tree3Height = random(100, 200);

float cloud1X = random(30, 160);
float cloud2X = random(170, 310);
float cloud3X = random(320, 470);

float cloud1Y = random(50, 250);
float cloud2Y = random(50, 250);
float cloud3Y = random(50, 250);

float cloud1Width = random(50, 100);
float cloud2Width = random(50, 100);
float cloud3Width = random(50, 100);

float cloud1Height = random(25, 50);
float cloud2Height = random(25, 50);
float cloud3Height = random(25, 50);

void draw(){
  //first draw the sky
  background(180 - mouseY / 2, 190 - mouseY / 2, 255 - mouseY / 2);
  rectMode(CORNER);
  noStroke();
  //draw a sun where the mouse is
  fill(255, 255, 170);
  ellipse(mouseX, mouseY, 50, 50);
  //draw the grass
  fill(150 - mouseY / 2, 255 - mouseY / 1.5, 150 - mouseY / 2);
  rect(0, 350, 500, 250);
  //call the two functions to draw three shadows and three trees and three clouds
  drawCloud(cloud1X, cloud1Y, cloud1Width, cloud1Height);
  drawCloud(cloud2X, cloud2Y, cloud2Width, cloud2Height);
  drawCloud(cloud3X, cloud3Y, cloud3Width, cloud3Height);
  
  drawShadow(tree1X, tree1Y, tree1Width, tree1Height);
  drawShadow(tree2X, tree2Y, tree2Width, tree2Height);
  drawShadow(tree3X, tree3Y, tree3Width, tree3Height);
  
  drawTree(tree1X, tree1Y, tree1Width, tree1Height);
  drawTree(tree2X, tree2Y, tree2Width, tree2Height);
  drawTree(tree3X, tree3Y, tree3Width, tree3Height);
}

/** Draws the shadow of a tree
 *
 * @param x the x-coordinate of the base of the tree.
 * @param y the y-coordinate of the base of the tree.
 * @param objectWidth the width of the tree.
 * @param objectHeight the height of the tree.
 * side effect: draws shadow of tree
 */ 
void drawShadow(float x, float y, float objectWidth, float objectHeight) {
  strokeWeight(2 * objectWidth);
  stroke(0, 0, 0, 100);
  line(x, y, x + (x - mouseX) * mouseY / 600, y + mouseY * (objectHeight / 200));
  noStroke();
}

/** Draws a tree
 *
 * @param x the x-coordinate of the base of the tree.
 * @param y the y-coordinate of the base of the tree. 
 * @param objectWidth the width of the tree.
 * @param objectHeight the height of the tree.
 * side effect: draws tree
 */ 
void drawTree(float x, float y, float objectWidth, float objectHeight) {
  //draw tree trunk
  fill(100 - mouseY / 5, 30 - mouseY / 20, 30 - mouseY / 20);
  beginShape();
  curveVertex(x - 2 * objectWidth, y);
  curveVertex(x - objectWidth, y);
  curveVertex(x - objectWidth / 2, y - objectHeight / 2);
  curveVertex(x - objectWidth, y - objectHeight);
  curveVertex(x - 2 * objectWidth, y - objectHeight);
  vertex(x + objectWidth, y - objectHeight);
  curveVertex(x + objectWidth, y - objectHeight);
  curveVertex(x + objectWidth, y - objectHeight); 
  curveVertex(x + objectWidth / 2, y - objectHeight / 2);
  curveVertex(x + objectWidth, y);
  curveVertex(x + 2 * objectWidth, y);
  endShape();
  //draw leaves, leaves light up when mouse is over them
  if (mouseX < (x + 2 * objectWidth) & mouseX > (x - 2 * objectWidth) & mouseY < (y - objectHeight) & mouseY > (y - objectHeight - 60)){
    fill(50 - mouseY / 10 + 40, 100 - mouseY / 5 + 40, 50 - mouseY / 10);
  }
  else{
    fill(50 - mouseY / 10, 100 - mouseY / 5, 50 - mouseY / 10);
  }
  ellipse(x - objectWidth, y - objectHeight, 2 * objectWidth, 30);
  ellipse(x + objectWidth, y - objectHeight, 2 * objectWidth, 30);
  ellipse(x - objectWidth - 10, y - objectHeight - 25, 3 * objectWidth, 30);
  ellipse(x + objectWidth + 10, y - objectHeight - 25, 3 * objectWidth, 30);
  ellipse(x, y-objectHeight-20, 2.5 * objectWidth, 60);
}

/** Draws a cloud
 *
 * @param x the x-coordinate of the cloud.
 * @param y the y-coordinate of the cloud.  
 * @param objectWidth the width of the cloud.
 * @param objectHeight the height of the cloud.
 * side effect: draws cloud
 */ 
void drawCloud(float x, float y, float objectWidth, float objectHeight){
  fill(255 - mouseY / 1.7);
  ellipse(x, y, objectWidth, objectHeight);
  ellipse(x + .5 * objectWidth, y, objectWidth, objectHeight);
  ellipse(x + .25* objectWidth, y + .5 * objectHeight, objectWidth, objectHeight);
}

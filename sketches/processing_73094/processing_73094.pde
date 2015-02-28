
/*****************************************************************************
 Assignment #3
 Name: Sandra Tamarin
 E-mail: stamarin@haverford.edu
 Course: CS 110 - Section 001
 Submitted: 10/3/12
 
 A chemistry lab. There are six randomly-sized and -located flasks on a shelf,
 as well as three randomly-sized and -located test tubes in a rack on the desk.
 As the mouse moves, the level of liquid in the test tubes changes, and if
 the mouse is pressed while over a test tube, smoke comes out of it. There is
 also a bunsen burner on the table. If the mouse is pressed while over the
 flame of the bunsen burner, there is an explosion.
 ******************************************************************************/

// declare arrays
float [] flask1 = new float [7];
float [] flask2 = new float [7];
float [] flask3 = new float [7];
float [] flask4 = new float [7];
float [] flask5 = new float [7];
float [] flask6 = new float [7];

float [] testTube1 = new float [7];
float [] testTube2 = new float [7];
float [] testTube3 = new float [7];

// initiate global variables
float endExplosion = width;
float changeInExplosion = 100;


void setup() {
  size(500, 600);
  frameRate(30);
  smooth();
  
  // declare variables for each array
  flask1 [0] = random(10, 83);
  flask1 [1] = random(120, 170);
  flask1 [2] = random(30, 60);
  flask1 [3] = random(80, 110);
  flask1 [4] = random(0, 255);
  flask1 [5] = random(0, 255);
  flask1 [6] = random(0, 255);

  flask2 [0] = random(95, 150);
  flask2 [1] = random(120, 170);
  flask2 [2] = random(30, 60);
  flask2 [3] = random(80, 110);
  flask2 [4] = random(0, 255);
  flask2 [5] = random(0, 255);
  flask2 [6] = random(0, 255);

  flask3 [0] = random(166, 245);
  flask3 [1] = random(120, 170);
  flask3 [2] = random(30, 60);
  flask3 [3] = random(80, 110);
  flask3 [4] = random(0, 255);
  flask3 [5] = random(0, 255);
  flask3 [6] = random(0, 255);

  flask4 [0] = random(255, 330);
  flask4 [1] = random(120, 170);
  flask4 [2] = random(30, 60);
  flask4 [3] = random(80, 110);
  flask4 [4] = random(0, 255);
  flask4 [5] = random(0, 255);
  flask4 [6] = random(0, 255);

  flask5 [0] = random(340, 415);
  flask5 [1] = random(120, 170);
  flask5 [2] = random(30, 60);
  flask5 [3] = random(80, 110);
  flask5 [4] = random(0, 255);
  flask5 [5] = random(0, 255);
  flask5 [6] = random(0, 255);

  flask6 [0] = random(430, 470);
  flask6 [1] = random(120, 170);
  flask6 [2] = random(30, 60);
  flask6 [3] = random(80, 110);
  flask6 [4] = random(0, 255);
  flask6 [5] = random(0, 255);
  flask6 [6] = random(0, 255);

  testTube1 [0] = random(0, 255);
  testTube1 [1] = random(0, 255);
  testTube1 [2] = random(0, 255);
  testTube1 [3] = random(250, 275);
  testTube1 [4] = random(390, 405);
  testTube1 [5] = random(30, 50);
  testTube1 [6] = random(110, 130);

  testTube2 [0] = random(0, 255);
  testTube2 [1] = random(0, 255);
  testTube2 [2] = random(0, 255);
  testTube2 [3] = random(340, 365);
  testTube2 [4] = random(390, 405);
  testTube2 [5] = random(30, 50);
  testTube2 [6] = random(110, 130);

  testTube3 [0] = random(0, 255);
  testTube3 [1] = random(0, 255);
  testTube3 [2] = random(0, 255);
  testTube3 [3] = random(430, 450);
  testTube3 [4] = random(390, 405);
  testTube3 [5] = random(30, 50);
  testTube3 [6] = random(110, 130);
}


void draw() {
  background(220, 220, 170);

  // draw lab bench
  fill(0);
  rectMode(CORNER);
  rect(0, 3*height/4, 2*width, height/4);
  // draw shelf
  fill(100, 60, 20);
  rect(0, 110, width, 80);

  // draw rack
  strokeWeight(8);
  stroke(220, 50, 50);
  line(250, 425, width, 425);
  line(250, 425, 225, 475);
  line(250, 425, 250, 550);
  line(225, 475, 225, height);
  line(225, height, 250, 550);
  line(250, 550, width, 550);
  line(225, height, width, height);
  line(333, 425, 333, 550);
  line(333, 550, 306, height);
  line(416, 425, 416, 550);
  line(416, 550, 391, height);
  line(500, 425, 500, 550);
  line(500, 550, 475, height);
  strokeWeight(1);
  
  // run each array
  drawFlask (flask1 [0], flask1 [1], flask1 [2], flask1 [3], flask1 [4], flask1 [5], flask1 [6]);
  drawFlask (flask2 [0], flask2 [1], flask2 [2], flask2 [3], flask2 [4], flask2 [5], flask2 [6]);
  drawFlask (flask3 [0], flask3 [1], flask3 [2], flask3 [3], flask3 [4], flask3 [5], flask3 [6]);
  drawFlask (flask4 [0], flask4 [1], flask4 [2], flask4 [3], flask4 [4], flask4 [5], flask4 [6]);
  drawFlask (flask5 [0], flask5 [1], flask5 [2], flask5 [3], flask5 [4], flask5 [5], flask5 [6]);
  drawFlask (flask6 [0], flask6 [1], flask6 [2], flask6 [3], flask6 [4], flask6 [5], flask6 [6]);

  drawTestTube (testTube1 [0], testTube1 [1], testTube1 [2], testTube1 [3], testTube1 [4], testTube1 [5], testTube1 [6]);
  drawTestTube (testTube2 [0], testTube2 [1], testTube2 [2], testTube2 [3], testTube2 [4], testTube2 [5], testTube2 [6]);
  drawTestTube (testTube3 [0], testTube3 [1], testTube3 [2], testTube3 [3], testTube3 [4], testTube3 [5], testTube3 [6]);

  drawBunsenBurner(width/4, 425, 40, 190);
}


void drawTestTube(float testTubeR, float testTubeG, float testTubeB, float testTubeX, float testTubeY, float testTubeChangeInX, float testTubeChangeInY) {
  // draw test tube
  fill(255, 255, 255, 100);
  stroke(1);
  beginShape();
  vertex(testTubeX, testTubeY);
  vertex(testTubeX, testTubeY + testTubeChangeInY);
  vertex(testTubeX + testTubeChangeInX/2, testTubeY + 3*testTubeChangeInY/2);
  vertex(testTubeX + testTubeChangeInX, testTubeY + testTubeChangeInY);
  vertex(testTubeX + testTubeChangeInX, testTubeY);
  endShape(CLOSE);

  // make level of liquid in test tubes change based on mouseY
  float d = dist (mouseX, testTubeY, mouseX, mouseY);
  if (d >= testTubeY - 2.6*testTubeChangeInY) {
    d = testTubeY - 2.6*testTubeChangeInY;
  }

  // draw liquid in test tube
  fill(testTubeR, testTubeG, testTubeB, 200);
  beginShape();
  vertex(testTubeX, testTubeY + d);
  vertex(testTubeX, testTubeY + testTubeChangeInY);
  vertex(testTubeX + testTubeChangeInX/2, testTubeY + 3*testTubeChangeInY/2);
  vertex(testTubeX + testTubeChangeInX, testTubeY + testTubeChangeInY);
  vertex(testTubeX + testTubeChangeInX, testTubeY + d);
  endShape(CLOSE);

  // if mouse pressed over test tube, draw smoke
  if (mousePressed && mouseX >= testTubeX && mouseX <= testTubeX + testTubeChangeInX && mouseY >= testTubeY && mouseY <= testTubeY + testTubeChangeInY) {
    fill(150, 150, 150, 240);
    noStroke();
    ellipse(testTubeX - testTubeChangeInX/8, testTubeY-testTubeChangeInY/12, 1.5*testTubeChangeInX, testTubeChangeInY/4);
    ellipse(testTubeX + testTubeChangeInX, testTubeY-testTubeChangeInY/12, 1.5*testTubeChangeInX, testTubeChangeInY/4);
    ellipse(testTubeX + testTubeChangeInX/2, testTubeY-testTubeChangeInY/4, 1.5*testTubeChangeInX, testTubeChangeInY/4);
  }
}


void drawBunsenBurner(float bunsenBurnerX, float bunsenBurnerY, float bunsenBurnerW, float bunsenBurnerH) {

  // draw rest of rack
  strokeWeight(8);
  stroke(220, 50, 50);
  line(225, 530, width, 530);
  line(225, 475, width, 475);
  line(333, 425, 306, 475);
  line(333, 475, 306, 530);
  line(306, 475, 306, height);
  line(416, 425, 391, 475);
  line(416, 475, 391, 530);
  line(391, 475, 391, height);
  line(500, 425, 475, 475);
  line(500, 475, 475, 530);
  line(475, 475, 475, height);
  strokeWeight(1);
  stroke(0);

  // draw bunsen burner
  rectMode(CENTER);
  fill(100);
  stroke(1);
  ellipse(bunsenBurnerX, bunsenBurnerY + 1.6*bunsenBurnerH/3, 3.5*bunsenBurnerW, bunsenBurnerH/8);
  rect(bunsenBurnerX, bunsenBurnerY, bunsenBurnerW, bunsenBurnerH);
  // draw flame
  fill(0, 0, 50, 70);
  bezier(bunsenBurnerX, bunsenBurnerY - bunsenBurnerH, bunsenBurnerX - 2*bunsenBurnerW, bunsenBurnerY - bunsenBurnerH/3, bunsenBurnerX + 2*bunsenBurnerW, bunsenBurnerY - bunsenBurnerH/3, bunsenBurnerX, bunsenBurnerY - bunsenBurnerH);
  fill(50, 150, 255, 200);
  bezier(bunsenBurnerX, bunsenBurnerY - bunsenBurnerH/1.1, bunsenBurnerX - 1.5*bunsenBurnerW, bunsenBurnerY - bunsenBurnerH/2.7, bunsenBurnerX + 1.5*bunsenBurnerW, bunsenBurnerY - bunsenBurnerH/2.7, bunsenBurnerX, bunsenBurnerY - bunsenBurnerH/1.1);

  // if mouse pressed within flame, everything explodes
  if (mousePressed && mouseX >= bunsenBurnerX - bunsenBurnerW/2 && mouseX <= bunsenBurnerX + bunsenBurnerW/2 && mouseY >= bunsenBurnerY - bunsenBurnerH/1.5 - bunsenBurnerW/2 && mouseY <= bunsenBurnerY - bunsenBurnerH/1.5 + bunsenBurnerW/2) {
    for (float explosionW = 0; explosionW <= endExplosion; explosionW +=1) {
      fill(200, 0, 0);
      ellipse(width/2, height/2, explosionW, explosionW);
      fill(230, 190, 80);
      ellipse(width/2, height/2, explosionW/2, explosionW/2);
      fill(200, 200, 0);
      ellipse(width/2, height/2, explosionW/4, explosionW/4);
    } 
    endExplosion += changeInExplosion;
  }
}


void drawFlask(float flaskX, float flaskY, float flaskW, float flaskH, float flaskR, float flaskG, float flaskB) {
  // draw flask
  stroke(1);
  fill(flaskR, flaskG, flaskB, 100);
  beginShape();
  vertex(flaskX, flaskY);
  vertex(flaskX + flaskW, flaskY);
  vertex(flaskX + flaskW - flaskW/3, flaskY - flaskH/2.5);
  vertex(flaskX + flaskW - flaskW/3, flaskY - flaskH);
  vertex(flaskX + flaskW/3, flaskY - flaskH);
  vertex(flaskX + flaskW/3, flaskY - flaskH/2.5);
  vertex(flaskX, flaskY);
  endShape();
}


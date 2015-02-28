
// Created by Ben Hoffman
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP

float x = 247.5;
float y = 247.5;
float xspeed = 3.3;
float yspeed = 3.3;

void setup() {
  size(500, 450);
  smooth();
  background(255);
  frameRate(20);
}

void draw() {
  scale(0.6);
  translate(0, -100);
  noStroke();
  fill(255, 50);
  rect (0, 0, 1000, 1000);
  stroke(255, 255, 255);

  noStroke();
  fill(255, 10);
  rect(200, 200, 450, 280);

  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > 600) || (x < 248)) {
    xspeed = xspeed * -1;
  }
  if ((y > 430) || (y < 250)) {
    yspeed = yspeed * -1;
  }

  // Display at x,y location
  stroke(0);
  fill(175);
  ellipse(x, y, 95, 95);

  // plan
  stroke (2);
  fill(255);
  rect(200, 200, 450, 280);

  fill(100);
  rect(200, 200, 5, 5); // north columns
  rect(350, 200, -5, 5);
  rect(500, 200, -5, 5);
  rect(650, 200, -5, 5);

  fill(255);
  rect(405, 200, 30, 5); // north door

  fill(10); 
  rect(200, 475, 5, 5); // south columns
  rect(350, 475, -5, 5);
  rect(500, 475, -5, 5);
  rect(650, 475, -5, 5);

  fill(255);
  rect(405, 475, 30, 5); // south door

  fill(255);
  rect(200, 325, 5, 30); // side doors
  rect(650, 325, -5, 30);

  fill(255);
  strokeWeight(2);
  ellipse(x, y, 95, 95); // bath room

  // elevation
  rectMode(CENTER);
  fill(150);
  strokeWeight(1);
  rect(x, 701, 85, 120);

  rectMode(CORNER);
  //fill(150);
  //strokeWeight(1);
  //rect(480,640,85,120); // bathroom

  fill(100, 0);
  strokeWeight(3);
  rect(443, 650, 55, 100); // right window
  rect(410, 650, -55, 100); // left window

  fill(150);
  strokeWeight(1);
  rect(199, 750, 452, 15); // base

  strokeWeight(3);
  line(200, 730, 410, 730); // horizontal lines
  line(445, 730, 650, 730);
  line(200, 750, 651, 750);
  line(200, 650, 651, 650);

  strokeWeight(5);
  line(201, 652, 201, 750); //side beams
  line(650, 652, 650, 750);

  fill(255, 0);
  strokeWeight(3);
  rect(410, 650, 33, 100); // door

  strokeWeight(4);
  point(418, 730); // door handle
}



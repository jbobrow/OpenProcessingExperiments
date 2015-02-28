
/**
 * Blue Dragon
 * 
 * Processing Class_ HW 1
 * eshon
 */


void setup() {
  size(600, 800);
  smooth();
}


void draw() {
  background(0);
  
  int centerPt = width/2;
  int eye1_x = width/2 - 50;
  int eye1_y = height/3;
  int eye1_w = 80;
  int eye2_h = 80;
  
  int eye2_x = eye1_x + eye1_w - 13;
  int eye2_y = eye1_y;
  
  // fins
  fill(255, 0, 0);
  triangle(centerPt, 120, centerPt + 20, 60, centerPt+50, 200);
  
  triangle(centerPt + 40, 150, centerPt + 60, 60, centerPt+110, 250);
  
  triangle(centerPt + 90, 200, centerPt + 110, 60, centerPt+140, 300);
  
  // blue body
  fill(0, 0, 255);// blue inside
  curve(-100, 4500, 0, 600, 600, 600, 900, 4500);
  noStroke();// no outline
  rect(0, 600, 600, 800);
  
  // eyewhites
  stroke(0);
  fill(255);// white inside
  ellipse(eye1_x, eye1_y, eye1_w, eye2_h);
  ellipse(eye1_x + eye1_w - 13, eye2_y, 55, 55);
  
  // eyeballs
  fill(0);
  ellipse(eye1_x, eye2_y, 3, 3);
  ellipse(eye2_x, eye2_y, 5, 5);
  
    // lips
  fill(255, 0, 0);
  curve(0, 1500, 80, 500, 500, 500, 800, 1800);
  curve(0, -900, 80, 500, 500, 500, 800, -1400);
  
  // black mouth
  fill(0);
  curve(0, 1000, 80, 500, 500, 500, 800, 1500);
  curve(0, -500, 80, 500, 500, 500, 800, -1000);
  
  // eyes in mouth
  int eye3_x = width/2 - 20;
  int eye3_y = height-300;
  int eye3_w = 30;
  int eye3_h = 30;
  
  int eye4_x = eye3_x + eye3_w;
  int eye4_y = eye3_y;
  
  // eyewhites
  stroke(0);
  fill(255);// white inside
  ellipse(eye3_x, eye3_y, eye3_w, eye3_h);
  ellipse(eye4_x, eye4_y, eye3_w, eye3_h);
  
  // eyeballs
  fill(0);
  ellipse(eye3_x, eye3_y, 3, 3);
  ellipse(eye4_x, eye4_y, 3, 3);
  
}


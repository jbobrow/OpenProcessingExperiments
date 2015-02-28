
// INTERACTIVE SELF PORTRAIT
// My self portrait with eyes that move according to the x-y mouse positions

// define left and right eye color and pupil movement variables
float xL = 0.0, yL = 0.0;
float xLpupil = 0.0, yLpupil = 0.0;
float xR = 0.0, yR = 0.0;
float xRpupil = 0.0, yRpupil = 0.0;


// Size of drawing
void setup() {
  size(400, 400);
  smooth();
}

// Shape and line elements
void draw() {
  background(162, 183, 255);

  // SAME FACIAL FEATURES AS PREVIOUS PORTRAIT //

  // freckles
  stroke(1);
  point(150, 175);
  point(160, 175);
  point(140, 188);
  point(145, 173);
  point(155, 185);

  point(230, 175);
  point(240, 175);
  point(220, 188);
  point(225, 173);
  point(215, 185);

  // face contours
  noFill();
  bezier(264, 128, 240, 156, 290, 200, 220, 250);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // eyebrows
  fill(103, 70, 26);
  noStroke();
  triangle(170, 128, 170, 126, 130, 124);
  triangle(132, 124, 115, 128, 110, 127);

  triangle(210, 128, 210, 126, 250, 124);
  triangle(248, 124, 264, 128, 263, 127);

  // nose
  stroke(1);
  line(193, 144, 193, 173);
  line(193, 173, 202, 180);
  line(202, 180, 202, 186);

  // notrils
  fill(0);
  ellipse(182, 192, 5, 2); 
  ellipse(198, 192, 5, 2);

  // mouth
  fill(255, 199, 185);
  arc(190, 216, 70, 8, TWO_PI-PI, TWO_PI);
  arc(190, 224, 60, 8, 0, PI);
  fill(255);
  quad(150, 216, 160, 224, 220, 224, 230, 216);

  // hair 1
  stroke(100, 54, 16);
  noFill();
  bezier(215, 90, 100, 120, 100, 100, 130, 350);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // hair 2
  stroke(100, 54, 16);
  noFill();
  bezier(230, 90, 160, 130, 70, 100, 150, 350);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // hair 3
  stroke(100, 54, 16);
  noFill();
  bezier(180, 70, 100, 80, 30, 100, 110, 350);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // hair 4
  stroke(100, 54, 16);
  noFill();
  bezier(220, 80, 100, 80, 70, 100, 90, 350);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // hair 5
  stroke(100, 54, 16);
  noFill();
  bezier(225, 80, 100, 35, 70, 100, 120, 350);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // hair 6
  stroke(100, 54, 16);
  noFill();
  bezier(213, 80, 90, 50, 40, 100, 75, 350);
  noStroke();
  line(85, 20, 10, 10);
  line(90, 90, 15, 80);

  // necklace
  fill(247, 240, 2);
  stroke(1);
  line(185, 369, 135, 300);
  line(185, 369, 225, 300);
  noStroke();
  ellipse(185, 375, 15, 15); 
  

  // INTERACTIVE EYE MOVEMENT //

  xL = mouseX;
  yL = mouseY;
  xLpupil = mouseX;
  yLpupil = mouseY;
  xR = mouseX;
  yR = mouseY;
  xRpupil = mouseX;
  yRpupil = mouseY;


  // constraining movement of left and right eye
  xL = constrain(xL, 141, 159);
  yL = constrain(yL, 147, 153);
  xR = constrain(xR, 221, 239);
  yR = constrain(yR, 147, 153);

  // constraining movement of left and right pupils
  xLpupil = constrain(xLpupil, 141, 159);
  yLpupil = constrain(yLpupil, 147, 153);
  xRpupil = constrain(xRpupil, 221, 239);
  yRpupil = constrain(yRpupil, 147, 153);

  // whites of eyes
  fill(255);
  stroke(1);
  ellipse(150, 150, 38, 28); // left eye
  ellipse(230, 150, 38, 28); // right eye

  // color of left eye --- interactive with mouse manipulation
  noStroke();
  fill(0, 80, 240);
  ellipse(xL, yL, 18, 18);

  // color of right eye --- interactive with mouse manipulation
  noStroke();
  fill(0, 80, 240);
  ellipse(xR, yR, 18, 18);

  // pupil of left eye --- interactive w/ mouse manipulation
  fill(0);
  ellipse(xLpupil, yLpupil, 12, 12); 

  // pupil of right eye --- interactive w/ mouse manipulation
  fill(0);
  ellipse(xRpupil, yRpupil, 12, 12);

  // eyelids
  fill(255, 222, 178);
  arc(150, 147, 34, 20, TWO_PI-PI, TWO_PI); 
  arc(230, 147, 34, 20, TWO_PI-PI, TWO_PI);

  // eyelashes
  stroke(1);
  line(135, 150, 120, 142);
  line(140, 150, 125, 139);
  line(145, 150, 130, 137);
  line(150, 150, 135, 135);

  line(245, 150, 260, 142);
  line(240, 150, 255, 139);
  line(235, 150, 250, 137);
  line(230, 150, 245, 135);
}








int NUM_PANDAS = 8;   //parallel arrays*
float [] xPos;
float [] yPos;
float [] xVel;
float [] yVel;
float [] scaleFactor;

void setup() {
  size(600, 600);
  smooth();
  background(255);

  // allocate space for array
  xPos = new float[NUM_PANDAS];
  yPos = new float[NUM_PANDAS];
  xVel = new float[NUM_PANDAS];
  yVel = new float[NUM_PANDAS];
  scaleFactor = new float[NUM_PANDAS];

  for (int i = 0; i < NUM_PANDAS; i++) {
    xPos [i] = random(72, width - 72);
    yPos [i] = random(86, height - 86);
    xVel [i] = random(-4, 4);
    yVel [i] = random(-4, 4);
    scaleFactor[i] = random(0.5, 1);
  }
}

void draw() {
  background(255);


  //Call the scene
  drawScene();

  //Call characters
  for (int i = 0; i < NUM_PANDAS; i++) {

    drawPanda(boolean(frameCount / 20 % 2), xPos[i], yPos[i], scaleFactor[i]);

    //make the panda move by updating position
    xPos[i] += xVel[i];  // created in the for loop so move for each object*
    yPos[i] += yVel[i];

    //check walls
    if (xPos[i] > width - 72 * scaleFactor[i] || xPos[i] < 0 + 72 * scaleFactor[i]) {  //mutiply by scaleFactor both times!!!
      xVel[i] *= -1;
    }
    if (yPos[i] > height - 86 * scaleFactor[i] || yPos[i] < 0 + 86 * scaleFactor[i]) {
      yVel[i] *= -1;
    }
  }
}

void drawScene() {
  //Draw the upper background
  noStroke();
  colorMode(HSB, 360, 100, 100);
  fill(78, 5, 93);
  rect(0, 0, 600, 500);

  colorMode(RGB, 255, 255, 255);
  fill(220, 229, 197);
  ellipse(300, 250, 450, 400);
  ellipse(0, 200, 400, 400);
  fill(196, 209, 164);
  arc(250, 300, 300, 300, -PI, 0);
  arc(600, 300, 500, 400, -PI, 0);
  arc(0, 350, 300, 300, -PI/2, PI/2);
  rect(0, 300, 600, 210);

  //Draw the big wild goose
  pushMatrix();
  translate(440, 55);
  rotate(-PI/10);

  stroke(70, 100);
  strokeWeight(4);
  noFill();
  line(-12, 0, 12, 0);
  curve(-200, 70, -50, -17, 0, 0, 0, 10);
  curve(200, 70, 50, -17, 0, 0, 0, 10);

  popMatrix();

  //Draw the small wild goose
  pushMatrix();
  translate(500, 85);
  rotate(-PI/6);
  scale((float)2/3);

  stroke(70, 100);
  strokeWeight(4);
  noFill();
  line(-12, 0, 12, 0);
  curve(-200, 70, -50, -17, 0, 0, 0, 10);
  curve(200, 70, 50, -17, 0, 0, 0, 10);
  scale((float)3/2);

  popMatrix();

  //Draw the 1st vertical bamboo

  pushMatrix();
  translate(150, 0);
  stroke(71, 113, 38, 150);
  strokeWeight(1.5);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 2nd vertical bamboo
  pushMatrix();
  translate(120, 0);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 3rd vertical bamboo
  pushMatrix();
  translate(95, 0);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 4th vertical bamboo
  pushMatrix();
  translate(60, 0);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 5th vertical bamboo
  pushMatrix();
  translate(10, 0);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 1st right diagonal bamboo
  pushMatrix();
  translate(250, 35);
  rotate(PI/24);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 2nd right diagonal bamboo
  pushMatrix();
  translate(80, 5);
  rotate(PI/36);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 3rd right diagonal bamboo
  pushMatrix();
  translate(210, 25);
  rotate(PI/36);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 1st left diagonal bamboo
  pushMatrix();
  translate(500, 55);
  rotate(-PI/18);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the 2nd left diagonal bamboo
  pushMatrix();
  translate(580, 5);
  rotate(PI/42);
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

  //Draw the ground background
  noStroke();
  fill(224, 208, 163);
  rect(0, 510, 600, 90);

  //Draw the pavilion - stage
  stroke(30);
  strokeWeight(2);
  fill(120);
  quad(300, 490, 500, 490, 520, 510, 280, 510);
  rect(300, 475, 200, 15);

  //Draw the main beams
  stroke(126, 160, 227);
  fill(14, 44, 100);

  rect(345, 310, 110, 27);

  rect(295, 310, 20, 9);
  rect(300, 319, 15, 9);
  rect(305, 328, 10, 9);

  rect(485, 310, 20, 9);
  rect(485, 319, 15, 9);
  rect(485, 328, 10, 9);

  //Draw the pillars
  stroke(70, 8, 5);
  fill(135, 8, 5);

  rect(310, 465, 40, 10);
  rect(450, 465, 40, 10);

  rect(315, 310, 30, 155);
  rect(455, 310, 30, 155);

  //Draw the two detailed beam heads
  stroke(126, 160, 227);
  fill(14, 44, 100);
  rect(325, 310, 10, 27);
  rect(465, 310, 10, 27);

  //Draw the beam under the top of the pavilion
  stroke(95, 8, 5);
  fill(193, 23, 18);
  rect(310, 295, 180, 15);

  //Draw the top of the pavilion
  stroke(90, 60, 0);
  fill(245, 204, 10);
  triangle(400, 150, 240, 295, 560, 295);
  ellipse(400, 150, 16, 16);
  ellipse(400, 132, 20, 20);

  //Draw 1st set of 3 leaves
  pushMatrix();
  translate(100, 10);
  rotate(-PI/4);

  stroke(71, 113, 38, 70);
  strokeWeight(2.5);
  fill(130, 247, 35, 200);

  //draw the lower right leaf
  pushMatrix();
  translate(10, 0);
  rotate(-PI/6);
  triangle(-10, 0, 10, 0, 0, 45);
  popMatrix();

  //draw the lower left leaf
  pushMatrix();
  translate(-10, 0);
  rotate(PI/6);
  triangle(-10, 0, 10, 0, 0, 45);
  popMatrix();

  //draw the upper middle leaf
  triangle(-10, 0, 10, 0, 0, 45);

  popMatrix();

  //Draw 2nd set of 3 leaves
  pushMatrix();
  translate(520, 150);
  rotate(PI/6);

  stroke(71, 113, 38, 70);
  strokeWeight(2.5);
  fill(130, 247, 35, 200);

  //draw the lower right leaf
  pushMatrix();
  translate(10, 0);
  rotate(-PI/6);
  triangle(-10, 0, 10, 0, 0, 45);
  popMatrix();

  //draw the lower left leaf
  pushMatrix();
  translate(-10, 0);
  rotate(PI/6);
  triangle(-10, 0, 10, 0, 0, 45);
  popMatrix();

  //draw the upper middle leaf
  triangle(-10, 0, 10, 0, 0, 45);

  popMatrix();
}

void drawPanda(boolean cheeksDown, float xPos, float yPos, float scaleAmount) {
  pushMatrix();

  translate(xPos, yPos); //using parameters x,y
  scale(scaleAmount); //using parameter pandaScale

  smooth();

  //Draw the hands
  noStroke();
  fill(0);
  quad(-25, 30, -10, 30, -30, 48, -40, 40);
  quad(25, 30, 10, 30, 30, 48, 40, 40);
  ellipse(-36, 48, 17, 17);
  ellipse(36, 48, 17, 17);

  //Draw the legs
  noStroke();
  fill(0);
  quad(-3, 50, -18, 50, -25, 85, -5, 80);
  quad(3, 50, 18, 50, 25, 85, 5, 80);
  ellipse(-20, 80, 30, 15);
  ellipse(20, 80, 30, 15);

  //Draw the body
  stroke(0);
  strokeWeight(2.3);
  fill(255);
  ellipse(0, 40, 40, 50);

  //Draw the ears
  noStroke();
  fill(0);
  ellipse(-48, -60, 45, 45);
  ellipse(48, -60, 45, 45);

  //Draw the head
  stroke(0);
  strokeWeight(2.3);
  fill(255);
  ellipse(0, -20, 120, 110);

  if (cheeksDown) {
    //Draw the pink cheek
    noStroke();
    fill(255, 0, 50, 100);
    ellipse(-40, 7, 20, 10);
    ellipse(40, 7, 20, 10);
  }
  
  //Draw the eyes black background
  pushMatrix();
  translate(0, -25);
  rotate(-PI/4);

  noStroke();
  fill(0);
  ellipse(-30, -15, 40, 35);
  rotate(PI/2);
  ellipse(30, -15, 40, 35);

  popMatrix();

  //Draw the eyes white background
  pushMatrix();
  translate(0, -25);
  rotate(-PI/4);

  noStroke();
  fill(255);
  ellipse(-27, -15, 30, 25);
  rotate(PI/2);
  ellipse(27, -15, 30, 25);

  popMatrix();


  //Draw the black eyeballs
  noStroke();
  fill(0);
  ellipse(-28, -16, 20, 20);
  ellipse(28, -16, 20, 20);

  //Draw the big eyes highlight
  noStroke();
  fill(255);
  ellipse(-25, -19, 8, 8);
  ellipse(31, -19, 8, 8);

  //Draw the small eyes highlight
  ellipse(-32, -13, 4, 4);
  ellipse(24, -13, 4, 4);

  //Draw the nose
  stroke(0);
  strokeWeight(0.2);
  fill(0);
  triangle(-7, -2, 7, -2, 0, 5);
  curve(-10, 10, -7, -2, 7, -2, 10, 10);
  curve(7, -10, -7, -2, 0, 5, 7, 10);
  curve(-7, -10, 7, -2, 0, 5, -7, 10);

  //Draw the mouth
  stroke(0);
  strokeWeight(2);
  noFill();
  line(0, 5, 0, 10);
  curve(-30, -55, -20, 9, 0, 10, 0, -10);
  curve(0, -10, 0, 10, 20, 9, 30, -55);

  popMatrix();
}



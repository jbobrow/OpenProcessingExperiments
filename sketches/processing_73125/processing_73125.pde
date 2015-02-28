
//Danielle Lehmann

//Introduction to Digital Media Fall 2012 - Assignment 01B

//Section A

//9.11.12


float randomDiameter = 0;
float strokeGray = 0;

int value = 0;

float xPos;
float yPos;
float xVel;
float yVel;

void setup() {

  size(1200, 600);
  background(136, 232, 223);

  xPos = width/2;
  yPos = height/2;
  xVel = 50;
  yVel = 50;
}

void draw() {

   if (randomDiameter <80) {
    randomDiameter++;
   }
  else {
    randomDiameter = 0;
   }

  //rect(mouseX, mouseY, randomDiameter, randomDiameter);

  fill(134, 119, 80);
  strokeWeight(2);
  stroke(0);
  triangle(mouseX,mouseY,600,300,600,200);

  stroke(188, 156, 97, 15);
  fill(255, 167, 85, 5);
  noStroke();
  ellipse(1000, 200, randomDiameter, randomDiameter);
  ellipse(100, 500, randomDiameter, randomDiameter);

  int value = 0;

  stroke(188, 156, 97);
  strokeWeight(1);
  fill(136, 232, 223, 10);
  float x = 800;
  float y = height/5;
  float d = width * 0.2;
  arc(x, y, d, d-20, 0, HALF_PI);
  arc(x, y, d-20, d-5, 0, QUARTER_PI);
  arc(x, y, d-40, d-10, 0, TWO_PI);
  arc(x, y, d-80, d-60, 0, PI);
  arc(x, y, d, d+20, 0, HALF_PI);
  arc(x, y, d+20, d+5, 0, QUARTER_PI);
  arc(x, y, d+40, d+10, 0, TWO_PI);
  arc(x, y, d+80, d+60, 0, PI);

  stroke(188, 156, 97, 50);
  strokeWeight(1);
  fill(136, 232, 223, 50);
  beginShape();
  vertex(450, 600);
  bezierVertex(880, 500, 880, 475, 930, 375);
  bezierVertex(850, 600, 960, 925, 930, 810);
  endShape();
  beginShape();
  vertex(700, 0);
  bezierVertex(180, 0, 280, 375, 130, 275);
  bezierVertex(50, 0, 460, 125, 530, 10);
  endShape();

  stroke(134, 119, 80, 300);
  strokeWeight(5);
  fill(129, 232, 207, 90);
  smooth();

  //randomDiameter = random(10, 100);

  xPos = xPos + xVel;
  yPos = yPos + yVel;
  stroke(134, 119, 80, 200);
  strokeWeight(1);
  fill(129, 232, 207, 50);
  ellipse(xPos, yPos, randomDiameter, randomDiameter);
  if(yPos + 40 > height || yPos < 0) {
   yVel = yVel * -1;
  }
  if(xPos + 40 > width || xPos < 0) {
   xVel = xVel * -1;
  }

  //beginShape();
  //vertex(30, 20);
  //bezierVertex(180, 0, 180, 175, 130, 175);
  //bezierVertex(150, 0, 160, 125, 130, 10);
  //endShape();

  //beginShape();
  //vertex(300, 200);
  //bezierVertex(800, 100, 800, 750, 300, 750);
  //bezierVertex(500, 900, 600, 250, 300, 200);
  //endShape();

  //beginShape();
  //vertex(300, 200);
  //bezierVertex(500, 900, 600, 400, 300, 600);
  //bezierVertex(200, 100, 900, 750, 300, 750);
  //endShape();

  //beginShape();
  //vertex(800, 500);
  //bezierVertex(180, 0, 280, 375, 630, 275);
  //bezierVertex(590, 0, 460, 890, 530, 1900);
  //endShape();



  for (int i = 0; i < 1200; i = i+20) {
    for (int j = 0; j < 600; j = j+20) {
      point(i, j);
    }
    stroke(195, 239, 245);
    line(850, i+10, 1100, i+20);
    line(600, i+20, 700, i+10);
    line(250, i+10, 600, i+20);
    line(200, i, 250, i);
    line(700, i, 850, i);
    line(50, i+20, 200, i+10);

    //translate(width/4, height/4);
    //shearY(PI/4.0);
    //rect(100, 100, 100, 100);
    //rect(40, 40, 0, 0);
  }
}



void keyPressed() {
  if (key == 's') {
    save("1daniellelehmann.png");
  }
}

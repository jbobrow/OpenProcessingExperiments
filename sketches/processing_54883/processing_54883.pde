
float x, y;
float w, h;
float rad;
float spdX, spdY;
color strokeCol;
float damping;
float friction; 

int horizon;

void setup() {
  size(600, 600);
  smooth(); 

  x = 150;
  y = 300;
  w = 130;
  h = 130;
  rad = w/2;
  spdX = 2;
  spdY = 3;
  strokeCol = color(160, 150, 15);
  damping = .2;
  friction = 1;
}


void draw() {

  background(255);
  textSize(200); 
  noStroke();
  fill(0);
  text ("CSE", 200, 200);

  //board
  stroke(0);
  fill(30, 180, 210);

  int horizon = 300;

  rect (0, horizon, 600, 600 - horizon);

  //neck
  noStroke();
  fill(250, 232, 182);
  rect(130, 370, 40, 40);

  //body
  fill(164, 94, 58);
  beginShape();
  vertex(60, 600);
  vertex(60, 450);
  vertex(130, 400);
  vertex(170, 400);
  vertex(250, 450);
  vertex(250, 600);
  vertex(60, 600);
  endShape();
  //body arms
  stroke(1);
  beginShape(LINES);
  vertex(100, 460);
  vertex(100, 600);
  vertex(210, 460);
  vertex(210, 600);
  endShape();

  //laptop

  //desk leg1
  fill(10, 0, 0);
  beginShape();
  vertex(320, 520);
  vertex(340, 530);
  vertex(340, 530);
  vertex(340, 600);
  vertex(340, 600);
  vertex(320, 600);
  vertex(320, 600);
  vertex(320, 520);
  endShape();

  //desk leg2
  fill(10, 0, 0);
  beginShape();
  vertex(460, 520);
  vertex(480, 500);
  vertex(480, 500);
  vertex(480, 600);
  vertex(480, 600);
  vertex(460, 600);
  vertex(460, 600);
  vertex(460, 520);
  endShape();

  //desk
  fill(150);
  noStroke();
  float theta = PI/2;
  int sides = 6;
  float radius = 120;
  float xPos = 400;
  float yPos = 450;
  int counter = 0;
  beginShape();
  while (counter < sides) {
    float x = xPos + cos(theta) * radius;
    float y = yPos + sin(theta) * radius;
    vertex(x, y);
    counter = counter + 1;
    theta = theta + TWO_PI/sides;
  }
  endShape(CLOSE);
  
  //laptop
  stroke(0);
  fill(200);
  quad(330, 370, 330, 430, 460, 430, 460, 370);
  quad(330, 430, 460, 430, 430, 480, 300, 480);
  fill(8, 2, 211);
  quad(340, 380, 340, 420, 450, 420, 450, 380);
  stroke(250);
  fill(0);
  quad(335, 440, 445, 440, 425, 470, 315, 470);
  beginShape(LINES);
  vertex(333, 445);
  vertex(440, 445);
  vertex(330, 450);
  vertex(437, 450);
  vertex(327, 455);
  vertex(434, 455);
  vertex(324, 460);
  vertex(431, 460);
  vertex(321, 465);
  vertex(428, 465);
  vertex(345, 440);
  vertex(325, 470);
  vertex(355, 440);
  vertex(335, 470);
  vertex(365, 440);
  vertex(345, 470);
  vertex(375, 440);
  vertex(355, 470);
  vertex(385, 440);
  vertex(365, 470);
  vertex(395, 440);
  vertex(375, 470);
  vertex(405, 440);
  vertex(385, 470);
  vertex(415, 440);
  vertex(395, 470);
  vertex(425, 440);
  vertex(405, 470);
  vertex(435, 440);
  vertex(415, 470);
  endShape();
  
  

  stroke(strokeCol);
  fill(strokeCol);
  ellipse(x, y, w, h);
  
  x += spdX;
  y += spdY;
  spdY += damping;

  if (x > width-rad) {
    x = width-rad;
    spdX *= -1;  
    spdY *= damping; 
  }

  if (x < rad) {
    x = rad;
    spdX *= -1;
  }

  if (y > height-rad) {
    y = height-rad;
    spdY *= -1;
    spdX *= friction;
  }

  if (y < rad) {
    spdY *= -1;
  }
}

  




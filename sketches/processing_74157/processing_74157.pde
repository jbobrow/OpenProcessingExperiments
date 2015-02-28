
void setup() {
  size(1000, 600);
  frameRate(30);
  smooth();
}

void draw() {
  background(120, 120, 124);
  drawBuildings();
  drawWindows(); 
  drawSky();
  blackout();
}

void drawBuildings() {
  fill(0, 0, 0);
  noStroke();

  //left block
  rect(50, 320, 80, 260);
  rect(130, 280, 80, 300);
  rect(150, 260, 30, 20);
  rect(210, 200, 60, 380);
  rect(270, 360, 110, 220);
  rect(280, 280, 40, 120);
  rect(360, 330, 50, 70);
  rect(380, 250, 70, 330);
  rect(390, 230, 10, 20);
  rect(410, 240, 25, 10);
  rect(450, 300, 50, 280);
  rect(500, 350, 25, 230);
  rect(525, 330, 20, 250);

  //empire state building
  rect(545, 210, 140, 370);
  rect(565, 140, 100, 100);
  rect(585, 110, 60, 50);
  rect(605, 40, 20, 70);
  triangle(610, 40, 620, 40, 615, 10);

  //right block
  rect(685, 400, 15, 180);
  rect(700, 320, 50, 260);
  rect(750, 250, 70, 330);
  rect(760, 230, 15, 20);
  rect(820, 230, 30, 350);
  rect(850, 190, 70, 390);
  rect(920, 320, 30, 260);
}

void drawWindows() {

  fill(255, 255, 204);
  int spaceX = 10;
  int spaceY = 15;

  if ((mouseX>20&&mouseX<65&&mouseY>20&&mouseY<95)) {
    fill(0);
  }

  for (int y = 330; y<=410; y+=20) {
    rect(110, y, spaceX, spaceY, 2);
  }
  for (int x = 280; x<=310; x+=15) {
    rect(x, 390, spaceX, spaceY, 2);
  }
  for (int x = 390; x<=435; x+=15) {
    rect(x, 320, spaceX, spaceY, 2);
    rect(x, 340, spaceX, spaceY, 2);
  }
  for (int x = 560; x<=590; x+=15) {
    rect(x, 230, spaceX, spaceY, 2);
  }
  for (int x = 575; x<=605; x+=15) {
    rect(x, 250, spaceX, spaceY, 2);
  }
  for (int y = 310; y<=390; y+=20) {
    rect(650, y, spaceX, spaceY, 2);
  }
  for (int x = 760; x<=805; x+=15) {  
    rect(x, 260, spaceX, spaceY, 2);
  }

  rect(80, 510, spaceX, spaceY, 2);
  rect(170, 290, spaceX, spaceY, 2);
  rect(185, 290, spaceX, spaceY, 2);
  rect(170, 310, spaceX, spaceY, 2);
  rect(185, 350, spaceX, spaceY, 2);
  rect(220, 210, spaceX, spaceY, 2);
  rect(280, 410, spaceX, spaceY, 2);
  rect(355, 470, spaceX, spaceY, 2);
  rect(355, 490, spaceX, spaceY, 2);
  rect(530, 350, spaceX, spaceY, 2);
  rect(635, 230, spaceX, spaceY, 2);
  rect(575, 270, spaceX, spaceY, 2);  
  rect(575, 350, spaceX, spaceY, 2);
  rect(575, 410, spaceX, spaceY, 2);
  rect(590, 410, spaceX, spaceY, 2);
  rect(635, 510, spaceX, spaceY, 2);
  rect(635, 530, spaceX, spaceY, 2);
  rect(650, 510, spaceX, spaceY, 2);
  rect(715, 420, spaceX, spaceY, 2);
  rect(730, 420, spaceX, spaceY, 2);
  rect(730, 440, spaceX, spaceY, 2);
  rect(730, 460, spaceX, spaceY, 2);
  rect(715, 460, spaceX, spaceY, 2);
  rect(730, 480, spaceX, spaceY, 2);
  rect(775, 340, spaceX, spaceY, 2);
  rect(830, 400, spaceX, spaceY, 2);
  rect(830, 500, spaceX, spaceY, 2);
  rect(860, 300, spaceX, spaceY, 2);
  rect(905, 380, spaceX, spaceY, 2);
  rect(905, 400, spaceX, spaceY, 2);
  rect(935, 325, spaceX, spaceY, 2);
}

void blackout() {
  //Blackout
  stroke(255, 232, 18);
  strokeWeight(2.5);
  noFill();
  rect(20, 20, 45, 75, 5);
  fill(0);
  line(48, 30, 38, 50); // yellow arrow
  line(38, 50, 48, 50); // yellow arrow
  line(48, 50, 38, 70); // yellow arrow
  triangle(30, 70, 50, 70, 40, 85); // yellow arrow
  noStroke();
  stroke(0); 
  line(50, 30, 41, 48); // black arrow
  line(41, 48, 50, 48); // black arrow
  line(50, 50, 40, 70); // black arrow
  noStroke();
}

void drawSky() {
  //moon
  fill(255, 232, 18);
  ellipse(380, 100, 80, 80);
  fill(120, 120, 124);
  ellipse(400, 100, 80, 80);

  //stars
  stroke(255, 232, 18);
  //  line(twinkle, twinkle, twinkle, twinkle);
  line(random(199, 201), random(119, 121), random(239, 241), random(119, 121));
  line(random(219, 221), random(99, 101), random(219, 221), random(139, 141));
  line(random(209, 211), random(109, 111), random(229, 231), random(129, 131));
  line(random(209, 211), random(129, 131), random(229, 231), random(109, 111));

  line(random(459, 461), random(179, 181), random(499, 501), random(179, 181));
  line(random(479, 481), random(159, 161), random(479, 481), random(199, 201));
  line(random(469, 471), random(169, 171), random(489, 491), random(189, 191));
  line(random(469, 471), random(189, 191), random(489, 491), random(169, 171));

  line(random(859, 861), random(79, 81), random(899, 901), random(79, 81));
  line(random(879, 881), random(59, 61), random(879, 881), random(99, 101));
  line(random(869, 871), random(69, 71), random(889, 891), random(89, 91));
  line(random(869, 871), random(89, 91), random(889, 891), random(69, 71));
}




boolean daytime = false;

//color pallete
color building = color(120, 66, 250);
color paneling = color(203, 203, 203);
color day = color(3, 156, 255);
color night = color(48, 34, 134);
color sunShine = color(255, 255, 0);
color moonShine = color(192, 191, 203);
color nightCloud = color(94, 94, 103);
color dayCloud = color(245, 245, 250);
color starLight = color(237, 209, 22);
color bldg1Color = color(136, 198, 130);
color nightwindowColor = color(255);
color dayGround = color(34, 209, 19);
color nightGround = color(36, 85, 32);

//change variables
int bgColor;
int cloudColor;
int moonColor;
int winColor;
int groundColor;

//Truck
int wheel1a = 30;
int wheel1b = 33;
int wheel2a = 120;
int wheel2b = 123;
int wheel3a = 150;
int wheel3b = 153;
int truckSpeed = 2;
int bodyX = 80;
int bodyX2 = 140;

//Clouds
int cloudX = 100;
int cloudY = 100;
int cloud1X = 150;
int cloud1Y = 120;
float cloudA = 400;
float cloudB = 25;
float cloud1A = 450;
float cloud1B = 45;

//cloud speed
int cloudXspeed = 1;
float cloudAspeed = .6;

//roadway
int streetX = 40;
int streetY = 715;
int streetH = 20;
int streetW = 5;

//sun / moon
int moonX = 800;
int moonY = 0;
int moonW = 150;

//windows
int winX = 25;
int winY = 375;
int winW = 20;
int winH = 40;
int circleWindow = 45;
int bldg2X1 = 227;
int bldg2X2 = 277;
int bldg2X3 = 322;
int bldg2Y1 = 150;
int bldg2Y2 = 650;

// stars -- Calli Higgens via http://www.openprocessing.org/sketch/88469
float strokeStar = 1;
float strokeStarChange = .2;

//Shooting Star via Charlie McDowell @ http://www.openprocessing.org/sketch/41149
// the twinlking star locations
int[] starX = new int[800];
int[] starY = new int[800];
color[] starColor = new color[800];
int starSize = 3; // the size of the twinkling stars

// the tail of the shooting star
int[] shootX = new int[30];
int[] shootY = new int[30];
int METEOR_SIZE = 10; // initial size when it first appears
float meteorSize = METEOR_SIZE; // size as it fades

// distance a shooting star moves each frame - varies with each new shooting star
float ssDeltaX, ssDeltaY;
// -1 indicates no shooting star, this is used to fade out the star
int ssTimer = -1;
// starting point of a new shooting star, picked randomly
int startX, startY;



void setup() { //run setup
  size(800, 800); //set size to 800x400
  smooth(); //smooth the edges of lines
  noStroke(); //no outlines
}

void draw() { //run draw
  background(bgColor); //set background color

    //If it's NOT day time, do this
  if (!daytime) {
    bgColor = night;
    cloudColor = nightCloud;
    moonColor = moonShine;
    winColor = nightwindowColor;
    groundColor = nightGround;
    randomSeed(0);
    for (float i = random(0); i < 800; i += 4) {

      strokeWeight(strokeStar);
      stroke(starLight);
      point(i, random(650));

      strokeStar = strokeStar + strokeStarChange;
      if ((strokeStar>3) || (strokeStar<1)) {
        strokeStarChange = strokeStarChange * -1;
      }
    }
  }
  //if it is Day time, do this
  if (daytime) {
    bgColor = day;
    cloudColor = dayCloud;
    moonColor = sunShine;
    winColor = bldg1Color;
    groundColor = dayGround;
  }

  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  noStroke(); //no outlines
  strokeWeight(0);

  //Ground
  fill(groundColor);
  rect(width/2, 700, width, 200);

  //Road
  fill(0);
  rect(width/2, 735, width, 120);
  fill(255);
  rect(streetX, streetY, streetH, streetW);
  rect(streetX+60, streetY, streetH, streetW);
  rect(streetX+120, streetY, streetH, streetW);
  rect(streetX+180, streetY, streetH, streetW);
  rect(streetX+240, streetY, streetH, streetW);
  rect(streetX+300, streetY, streetH, streetW);
  rect(streetX+360, streetY, streetH, streetW);
  rect(streetX+420, streetY, streetH, streetW);
  rect(streetX+480, streetY, streetH, streetW);
  rect(streetX+540, streetY, streetH, streetW);
  rect(streetX+600, streetY, streetH, streetW);
  rect(streetX+660, streetY, streetH, streetW);
  rect(streetX+720, streetY, streetH, streetW);

  //star loop stars via Calli Higgens @ http://www.openprocessing.org/sketch/88469

  noStroke();
  strokeWeight(0);

  //yellow sun / grey moon
  fill(moonColor);
  ellipse(moonX, moonY, moonW, moonW);
  moonX = constrain(mouseX, 570, 800);

  //cloud 1
  fill(cloudColor);
  ellipse(cloudX, cloudY, 150, 50);
  ellipse(cloud1X, cloud1Y, 150, 50);

  //cloud 2
  fill(cloudColor);
  ellipse(int(cloudA), int(cloudB), 150, 50);
  ellipse(int(cloud1A), int(cloud1B), 150, 50);

  //Building #1
  fill(building);
  rect(100, 500, 180, 300);//bottom left cnr of this building is x10, y650, rt cnr x,190
  rect(100, 350, 160, 280); //top left cnr of this building is x20, y210 rt cnr x180

    //Building #2 190,330
  rect(275, 400, 150, 500); //bottom left cnr of this building is x200, y650, rt cnr x350

    //Building #3 
  rect(485, 550, 250, 200);//bottom rt cnr x610, y650, top rt cnr x610, y450
  triangle(360, 450, 485, 350, 610, 450);
  triangle(480, 385, 485, 300, 490, 385);
  stroke(120, 66, 250);
  strokeWeight(1);
  line(485, 320, 485, 280);
  line(480, 285, 490, 285);

  //Building #1 Windows paneling
  fill(paneling);
  ellipse(45, winY-100, circleWindow+5, circleWindow+5);
  ellipse(100, winY-100, circleWindow+5, circleWindow+5);  
  ellipse(155, winY-100, circleWindow+5, circleWindow+5);

  rect(winX, winY+250, winW, winH);
  rect(winX, winY+200, winW, winH);
  rect(winX, winY+150, winW, winH);
  rect(winX, winY+100, winW, winH);
  rect(winX, winY+50, winW, winH);
  rect(winX, winY, winW, winH);

  rect(winX+50, winY+250, winW, winH);
  rect(winX+50, winY+200, winW, winH);
  rect(winX+50, winY+150, winW, winH);
  rect(winX+50, winY+100, winW, winH);
  rect(winX+50, winY+50, winW, winH);
  rect(winX+50, winY, winW, winH);  

  rect(winX+100, winY+250, winW, winH);
  rect(winX+100, winY+200, winW, winH);
  rect(winX+100, winY+150, winW, winH);
  rect(winX+100, winY+100, winW, winH);
  rect(winX+100, winY+50, winW, winH);
  rect(winX+100, winY, winW, winH);

  rect(winX+150, winY+250, winW, winH);
  rect(winX+150, winY+200, winW, winH);
  rect(winX+150, winY+150, winW, winH);
  rect(winX+150, winY+100, winW, winH);
  rect(winX+150, winY+50, winW, winH);
  rect(winX+150, winY, winW, winH);

  //Building #2 lines
  stroke(paneling);
  strokeWeight(2);
  line(202, bldg2Y1, 202, bldg2Y2);
  line(207, bldg2Y1, 207, bldg2Y2);
  line(212, bldg2Y1, 212, bldg2Y2);
  line(217, bldg2Y1, 217, bldg2Y2);
  line(222, bldg2Y1, 222, bldg2Y2);
  line(227, bldg2Y1, 227, bldg2Y2);
  line(232, bldg2Y1, 232, bldg2Y2);
  line(237, bldg2Y1, 237, bldg2Y2);
  line(242, bldg2Y1, 242, bldg2Y2);
  line(247, bldg2Y1, 247, bldg2Y2);
  line(252, bldg2Y1, 252, bldg2Y2);
  line(257, bldg2Y1, 257, bldg2Y2);
  line(262, bldg2Y1, 262, bldg2Y2);
  line(267, bldg2Y1, 267, bldg2Y2);
  line(272, bldg2Y1, 272, bldg2Y2);
  line(277, bldg2Y1, 277, bldg2Y2);
  line(282, bldg2Y1, 282, bldg2Y2);
  line(287, bldg2Y1, 287, bldg2Y2);
  line(292, bldg2Y1, 292, bldg2Y2);
  line(297, bldg2Y1, 297, bldg2Y2);
  line(302, bldg2Y1, 302, bldg2Y2);
  line(307, bldg2Y1, 307, bldg2Y2);
  line(312, bldg2Y1, 312, bldg2Y2);
  line(317, bldg2Y1, 317, bldg2Y2);
  line(322, bldg2Y1, 322, bldg2Y2);
  line(327, bldg2Y1, 327, bldg2Y2);
  line(332, bldg2Y1, 332, bldg2Y2);
  line(337, bldg2Y1, 337, bldg2Y2);
  line(342, bldg2Y1, 342, bldg2Y2);
  line(347, bldg2Y1, 347, bldg2Y2);

  //Building #2 Window Paneling
  noStroke();
  strokeWeight(0);
  ellipse(bldg2X1, 180, circleWindow+5, circleWindow+5);
  ellipse(bldg2X1, 310, circleWindow+5, circleWindow+5);
  ellipse(bldg2X1, 440, circleWindow+5, circleWindow+5);
  ellipse(bldg2X1, 570, circleWindow+5, circleWindow+5);

  ellipse(bldg2X2, 225, circleWindow+5, circleWindow+5);
  ellipse(bldg2X2, 355, circleWindow+5, circleWindow+5);
  ellipse(bldg2X2, 485, circleWindow+5, circleWindow+5);
  ellipse(bldg2X2, 615, circleWindow+5, circleWindow+5);

  ellipse(bldg2X3, 270, circleWindow+5, circleWindow+5);
  ellipse(bldg2X3, 400, circleWindow+5, circleWindow+5);
  ellipse(bldg2X3, 530, circleWindow+5, circleWindow+5);

  //Building #3 Window Paneling
  rect(375, 550, 15, 185);
  rect(400, 550, 15, 185);
  rect(425, 550, 15, 185);
  rect(450, 550, 15, 185);
  rect(475, 550, 15, 185);
  rect(500, 550, 15, 185);
  rect(525, 550, 15, 185);
  rect(550, 550, 15, 185);
  rect(575, 550, 15, 185);
  rect(600, 550, 15, 185);  
  ellipse(485, 400, circleWindow+5, circleWindow+5);
  stroke(building);
  line(485, 375, 485, 425);
  line(460, 400, 510, 400);
  noStroke();

  //building #1 windows
  fill(winColor);
  ellipse(45, 275, circleWindow, circleWindow);
  ellipse(100, 275, circleWindow, circleWindow);  
  ellipse(155, 275, circleWindow, circleWindow);

  rect(winX, 625, winW-5, winH-5);
  rect(winX, 575, winW-5, winH-5);
  rect(winX, 525, winW-5, winH-5);
  rect(winX, 475, winW-5, winH-5);
  rect(winX, 425, winW-5, winH-5);
  rect(winX, 375, winW-5, winH-5);

  rect(winX+50, 625, winW-5, winH-5);
  rect(winX+50, 575, winW-5, winH-5);
  rect(winX+50, 525, winW-5, winH-5);
  rect(winX+50, 475, winW-5, winH-5);
  rect(winX+50, 425, winW-5, winH-5);
  rect(winX+50, 375, winW-5, winH-5);  

  rect(winX+100, 625, winW-5, winH-5);
  rect(winX+100, 575, winW-5, winH-5);
  rect(winX+100, 525, winW-5, winH-5);
  rect(winX+100, 475, winW-5, winH-5);
  rect(winX+100, 425, winW-5, winH-5);
  rect(winX+100, 375, winW-5, winH-5);

  rect(winX+150, 625, winW-5, winH-5);
  rect(winX+150, 575, winW-5, winH-5);
  rect(winX+150, 525, winW-5, winH-5);
  rect(winX+150, 475, winW-5, winH-5);
  rect(winX+150, 425, winW-5, winH-5);
  rect(winX+150, 375, winW-5, winH-5);

  //Building #2 Windows
  ellipse(bldg2X1, 180, circleWindow, circleWindow);
  ellipse(bldg2X1, 310, circleWindow, circleWindow);
  ellipse(bldg2X1, 440, circleWindow, circleWindow);
  ellipse(bldg2X1, 570, circleWindow, circleWindow);


  ellipse(bldg2X2, 225, circleWindow, circleWindow);
  ellipse(bldg2X2, 355, circleWindow, circleWindow);
  ellipse(bldg2X2, 485, circleWindow, circleWindow);
  ellipse(bldg2X2, 615, circleWindow, circleWindow);

  ellipse(bldg2X3, 270, circleWindow, circleWindow);
  ellipse(bldg2X3, 400, circleWindow, circleWindow);
  ellipse(bldg2X3, 530, circleWindow, circleWindow);

  //Building #3 Windows
  rect(375, 550, 10, 180);
  rect(400, 550, 10, 180);
  rect(425, 550, 10, 180);
  rect(450, 550, 10, 180);
  rect(475, 550, 10, 180);
  rect(500, 550, 10, 180);
  rect(525, 550, 10, 180);
  rect(550, 550, 10, 180);
  rect(575, 550, 10, 180);
  rect(600, 550, 10, 180);

  //Building #1 antenna
  stroke(0);
  strokeWeight(2);
  line(30, 210, 30, 190);
  line(45, 210, 45, 140);
  line(100, 210, 100, 200);
  line(115, 210, 115, 200);

  //makes the antenna flash  **find out how to make it flash just red and black**
  randomSeed(frameCount);
  strokeWeight(4);
  stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  point(30, 190);
  point(45, 140);
  point(100, 200);
  point(115, 200);

  //Truck
  noStroke();
  strokeWeight(1);
  fill(255, 0, 0);
  rect(bodyX, 678, 120, 50);
  rect(bodyX2, 688, 60, 30);

  fill(0);
  stroke(255);
  ellipse(wheel1a, 703, 10, 10);
  ellipse(wheel1b, 703, 10, 10);

  ellipse(wheel2a, 703, 10, 10);
  ellipse(wheel2b, 703, 10, 10);

  ellipse(wheel3a, 703, 10, 10);
  ellipse(wheel3b, 703, 10, 10);

  //move Truck
  bodyX = bodyX + truckSpeed;
  bodyX2 = bodyX2 + truckSpeed;
  wheel1a = wheel1a + truckSpeed;
  wheel1b = wheel1b + truckSpeed;
  wheel2a = wheel2a + truckSpeed;
  wheel2b = wheel2b + truckSpeed;
  wheel3a = wheel3a + truckSpeed;
  wheel3b = wheel3a + truckSpeed;
  
//Stop truck @3/4's width
  if (bodyX2 > width/4*3) {
    truckSpeed = 0;
  }

  // bounce clouds 
  if ((cloudX > width+80 && cloud1X > width+130) || (cloudX < 0-130 && cloud1X < 0-50)) {
    cloudXspeed = cloudXspeed * -1;
  }

  if ((cloudA > width+80 && cloud1A > width+130) || (cloudA < 0-130 && cloud1A < 0-50)) {
    cloudAspeed = cloudAspeed * -1;
  }

  //move cloud 1
  cloudX = cloudX + cloudXspeed;
  cloud1X = cloud1X + cloudXspeed;

  //move cloud 2
  cloudA = cloudA + cloudAspeed;
  cloud1A = cloud1A + cloudAspeed;

  if (mouseX>10 && mouseY>210 && mouseX< 190 && mouseY<650) {
    fill(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    rect(winX, 625, winW-5, winH-5);
    rect(winX, 575, winW-5, winH-5);
    rect(winX, 525, winW-5, winH-5);
    rect(winX, 475, winW-5, winH-5);
    rect(winX, 425, winW-5, winH-5);
    rect(winX, 375, winW-5, winH-5);
    rect(winX+50, 625, winW-5, winH-5);
    rect(winX+50, 575, winW-5, winH-5);
    rect(winX+50, 525, winW-5, winH-5);
    rect(winX+50, 475, winW-5, winH-5);
    rect(winX+50, 425, winW-5, winH-5);
    rect(winX+50, 375, winW-5, winH-5);  
    rect(winX+100, 625, winW-5, winH-5);
    rect(winX+100, 575, winW-5, winH-5);
    rect(winX+100, 525, winW-5, winH-5);
    rect(winX+100, 475, winW-5, winH-5);
    rect(winX+100, 425, winW-5, winH-5);
    rect(winX+100, 375, winW-5, winH-5);
    rect(winX+150, 625, winW-5, winH-5);
    rect(winX+150, 575, winW-5, winH-5);
    rect(winX+150, 525, winW-5, winH-5);
    rect(winX+150, 475, winW-5, winH-5);
    rect(winX+150, 425, winW-5, winH-5);
    rect(winX+150, 375, winW-5, winH-5);
  }
  else if (mouseX> 200 && mouseX<350 && mouseY>150 && mouseY<650) {
    fill(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    ellipse(bldg2X1, 180, circleWindow, circleWindow);
    ellipse(bldg2X1, 310, circleWindow, circleWindow);
    ellipse(bldg2X1, 440, circleWindow, circleWindow);
    ellipse(bldg2X1, 570, circleWindow, circleWindow);
    ellipse(bldg2X2, 225, circleWindow, circleWindow);
    ellipse(bldg2X2, 355, circleWindow, circleWindow);
    ellipse(bldg2X2, 485, circleWindow, circleWindow);
    ellipse(bldg2X2, 615, circleWindow, circleWindow);
    ellipse(bldg2X3, 270, circleWindow, circleWindow);
    ellipse(bldg2X3, 400, circleWindow, circleWindow);
    ellipse(bldg2X3, 530, circleWindow, circleWindow);
  }
  else if (mouseX> 360 && mouseY>330 && mouseX<610 && mouseY<650) {
    stroke(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    strokeWeight(1);
    line(485, 320, 485, 280);
    line(480, 285, 490, 285);
  }
  //if it's night time AND the mouse is pressed make shooting stars
  if (!daytime && mousePressed) {
    // start of shooting stars
    // the stars seem to show best with black outlines that aren't really perceived by the eye
    stroke(0);
    strokeWeight(1);
    for (int s = 0; s < starX.length; s++) {
      fill(random(50, 255)); // makes them twinkle
      if (random(10) < 1) {
        starColor[s] = (int)random(100, 255);
      }
      fill(starColor[s]);

      ellipse(starX[s], starY[s], starSize, starSize);
    }
    // draw the shooting star (if any)
    for (int s = 0; s < shootX.length-1; s++) {
      int shooterSize = max(0, int(meteorSize*s/shootX.length));
      // to get the tail to disappear need to switch to noStroke when it gets to 0
      if (shooterSize > 0) {
        strokeWeight(shooterSize);
        stroke(255);
      }
      else
        noStroke();
      line(shootX[s], shootY[s], shootX[s+1], shootY[s+1]);
      // ellipse(shootX[i], shootY[i], meteorSize*i/shootX.length,meteorSize*i/shootX.length);
    }
    meteorSize*=0.9; // shrink the shooting star as it fades

    // move the shooting star along it's path
    for (int s = 0; s < shootX.length-1; s++) {
      shootX[s] = shootX[s+1];
      shootY[s] = shootY[s+1];
    }

    // add the new points into the shooting star as long as it hasn't burnt out
    if (ssTimer >= 0 && ssTimer < shootX.length) {
      shootX[shootX.length-1] = int(startX + ssDeltaX*(ssTimer));
      shootY[shootY.length-1] = int(startY + ssDeltaY*(ssTimer));
      ssTimer++;
      if (ssTimer >= shootX.length) {
        ssTimer = -1; // end the shooting star
      }
    }

    // create a new shooting star with some random probability
    if (random(5) < 1 && ssTimer == -1) {
      newShootingStar();
    }
  }

  if (key == 'd') {
    daytime = true;
  }

  if (key == 'n') {
    daytime = false;
  }  
  if (key == 'w') {
  }
}


//Starts a new shooting star by randomly picking start and end point.
void newShootingStar() {
  int endX, endY;
  startX = (int)random(width);
  startY = (int)random(height-600);
  endX = (int)random(width);
  endY = (int)random(height-600);
  ssDeltaX = (endX - startX)/(float)(shootX.length);
  ssDeltaY = (endY - startY)/(float)(shootY.length);
  ssTimer = 0; // starts the timer which ends when it reaches shootX.length
  meteorSize = METEOR_SIZE;

  // by filling the array with the start point all lines will essentially form a point initialy
  for (int s = 0; s < shootX.length; s++) {
    shootX[s] = startX;
    shootY[s] = startY;
  }
}

void keyPressed() {
  if (keyPressed && key=='y') {
    println(mouseY);
  }
  else if (keyPressed && key=='x') {
    println(mouseX);
  }
}

/* 
 ADD
 Fade from night to day and vice versa
 */




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
int bldg2Y1 = 150;
int bldg2Y2 = 650;

// stars -- Calli Higgens via http://www.openprocessing.org/sketch/88469
float strokeStar = 1;
float strokeStarChange = .2;

void setup() { //run setup
  size(800, 800); //set size to 800x400
  smooth(); //smooth the edges of lines
  noStroke(); //no outlines
}

void draw() { //run draw
  background(night); //set background color
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  noStroke(); //no outlines
  strokeWeight(0);

  //Ground
  fill(0, 255, 0);
  rect(width/2, 700, width, 200);
  
  //Road
  fill(0);
  rect(width/2,735,width,120);
  fill(255);
  rect(streetX,streetY,streetH,streetW);
  rect(streetX+60,streetY,streetH,streetW);
  rect(streetX+120,streetY,streetH,streetW);
  rect(streetX+180,streetY,streetH,streetW);
  rect(streetX+240,streetY,streetH,streetW);
  rect(streetX+300,streetY,streetH,streetW);
  rect(streetX+360,streetY,streetH,streetW);
  rect(streetX+420,streetY,streetH,streetW);
  rect(streetX+480,streetY,streetH,streetW);
  rect(streetX+540,streetY,streetH,streetW);
  rect(streetX+600,streetY,streetH,streetW);
  rect(streetX+660,streetY,streetH,streetW);
  rect(streetX+720,streetY,streetH,streetW);
 
  //stars via Calli Higgens @ http://www.openprocessing.org/sketch/88469
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

  noStroke();
  strokeWeight(0);

  //yellow sun / grey moon
  fill(moonShine);
  ellipse(moonX, moonY, moonW, moonW);
  moonX = constrain(mouseX, 570, 800);

  //cloud 1
  fill(nightCloud);
  ellipse(cloudX, cloudY, 150, 50);
  ellipse(cloud1X, cloud1Y, 150, 50);

  //cloud 2
  fill(nightCloud);
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
  ellipse(227, 180, circleWindow+5, circleWindow+5);
  ellipse(227, 310, circleWindow+5, circleWindow+5);
  ellipse(227, 440, circleWindow+5, circleWindow+5);
  ellipse(227, 570, circleWindow+5, circleWindow+5);

  ellipse(277, 225, circleWindow+5, circleWindow+5);
  ellipse(277, 355, circleWindow+5, circleWindow+5);
  ellipse(277, 485, circleWindow+5, circleWindow+5);
  ellipse(277, 615, circleWindow+5, circleWindow+5);

  ellipse(322, 270, circleWindow+5, circleWindow+5);
  ellipse(322, 400, circleWindow+5, circleWindow+5);
  ellipse(322, 530, circleWindow+5, circleWindow+5);

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
  fill(255);
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
  ellipse(227, 180, circleWindow, circleWindow);
  ellipse(227, 310, circleWindow, circleWindow);
  ellipse(227, 440, circleWindow, circleWindow);
  ellipse(227, 570, circleWindow, circleWindow);


  ellipse(277, 225, circleWindow, circleWindow);
  ellipse(277, 355, circleWindow, circleWindow);
  ellipse(277, 485, circleWindow, circleWindow);
  ellipse(277, 615, circleWindow, circleWindow);

  ellipse(322, 270, circleWindow, circleWindow);
  ellipse(322, 400, circleWindow, circleWindow);
  ellipse(322, 530, circleWindow, circleWindow);

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

/*
  cloudX = constrain(cloudX, -50, 880);
  cloud1X = constrain(cloud1X, 0, 930);
  cloudA = constrain(cloudA, -50, 880);
  cloud1A = constrain(cloud1A, 0, 930);
 /*
   **FUTURE CHANGE, when keyPressed, have the background fade to night,
   the sun strink, then have the moon "grow" in it's place,
   
   add shooting star when mousePressed

*???*   
   Noticed in Calli's city code a change variation for the moon,
   but I don't notice the size change at all
*???*
   
   */
}

void mousePressed() {
  println(mouseY);
}




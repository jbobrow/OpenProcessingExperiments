


// Declaring variables !!! int = intergers!!!
float RocketPosX;
float RocketPosY;

/*
float planet_1_R;
float planet_1_G;
float planet_1_B;
float planet_1_A;
float planet_2_R;
float planet_2_G;
float planet_2_B;
float planet_2_A;
float planet_3_R;
float planet_3_G;
float planet_3_B;
float planet_3_A;
float planet_4_R;
float planet_4_G;
float planet_4_B;
float planet_4_A;
*/

float smokeR;
float smokeG;
float smokeB;
float smokeA;

void setup() {
  size (500, 700);
  smooth();
  frameRate(60);
  RocketPosX = width/2; // Positioning X. Within void setup.
  RocketPosY = height/2+150; // Positioning Y. Within void setup.
}


void draw () {
  background(75);
  
  /*
  planet_1_R = random (170); // variable RED
  planet_1_G = random (170); // variable GREEN
  planet_1_B = random (170); // Variable BLUE
  planet_1_A = random (225); // VARIABLE ALPHA
  planet_2_R = random (170);
  planet_2_G = random (170);
  planet_2_B = random (170);
  planet_2_A = random (225);
  planet_3_R = random (170);
  planet_3_G = random (170);
  planet_3_B = random (170);
  planet_3_A = random (225);
  planet_4_R = random (170);
  planet_4_G = random (170);
  planet_4_B = random (170);
  planet_4_A = random (225);
  */

  smokeR = random (255);
  smokeG = random (255);
  smokeB = random (255);
  smokeA = random (100, 255);

  // Small planets.
  // fill(planet_1_R, planet_1_G, planet_1_B, planet_1_A); // Variable context for this planet
  fill(178, 174, 142);
  ellipse(width/2+125, height/2-200, 15, 15);
  // fill(planet_2_R, planet_2_G, planet_2_B, planet_2_A); // Variable context for this planet
  fill(170, 193, 70);
  ellipse(width/2-175, height/2-200, 7, 7);
  // fill(planet_3_R, planet_3_G, planet_3_B, planet_3_A); // Variable context for this planet
  fill(115, 134, 106);
  ellipse(width/2+200, height/2-400, 5, 5);
  // fill(planet_4_R, planet_4_G, planet_4_B, planet_4_A); // Variable conext for this planet
  fill(134, 106, 106);
  ellipse(width/2-200, height/2-256, 10, 10);


  // Planet.
  fill (183, 150, 89);
  noStroke();
  ellipse (width/2, height/2+275, 600, 375);

  // Highlights on the angeld parts of the craters.
  fill(229, 211, 176, 75); // Highlight color.
  ellipse(width/2-100, height/2+155, 38, 10); // Highlight # 1
  ellipse(width/2+130, height/2+130, 20, 8); // Highlight # 2
  ellipse(width/2-200, height/2+180, 30, 12); // Highlight # 3
  ellipse(width/2-25, height/2+115, 22, 8); // Highlight # 4
  ellipse(width/2+200, height/2+185, 20, 10); // Highlight # 5

  // Shadows in the craters.
  fill (121, 104, 71, 175);
  ellipse(width/2-100, height/2+152, 26, 4); // Shadow # 1
  ellipse(width/2+130, height/2+126, 11, 3); // Shadow # 2
  ellipse(width/2-200, height/2+177, 23, 4); // Shadow # 3
  ellipse(width/2-25, height/2+111, 8, 3); // Shadow # 4
  ellipse(width/2+200, height/2+182, 9, 4); // Shawow # 5

  // Outlines of the craters.
  stroke(133, 100, 39);
  strokeWeight(1);
  noFill();
  ellipse(width/2-100, height/2+150, 30, 8); // # 1
  line(width/2-115, height/2+150, width/2-120, height/2+155); // Lines to ellipse above
  line(width/2-85, height/2+150, width/2-80, height/2+155); // Lines to ellipse above
  ellipse(width/2+130, height/2+125, 15, 6); // # 2
  line(width/2+123, height/2+125, width/2+120, height/2+128);
  line(width/2+138, height/2+125, width/2+140, height/2+128);
  ellipse(width/2-200, height/2+175, 25, 6); // # 3
  line(width/2-212, height/2+175, width/2-217, height/2+180);
  line(width/2-188, height/2+175, width/2-183, height/2+180);
  ellipse(width/2-25, height/2+110, 12, 4); // # 4
  line(width/2-31, height/2+110, width/2-36, height/2+114);
  line(width/2-18, height/2+110, width/2-13, height/2+114);
  ellipse(width/2+200, height/2+180, 15, 6); // # 5
  line(width/2+207, height/2+180, width/2+211, height/2+184);
  line(width/2+192, height/2+180, width/2+188, height/2+184);

  // Rocket.
  noStroke();
  fill(200, 0, 0);
  ellipse(RocketPosX, RocketPosY, 14, 30); // Top.
  fill(255, 255, 255, 65);
  ellipse(RocketPosX, RocketPosY-10, 6, 8); // Reflection on the top.
  noStroke();
  fill(220);
  rectMode(CORNER);
  rect(RocketPosX-7, RocketPosY, 14, 100);// Body.
  fill(240, 240, 240);
  rect(RocketPosX-7, RocketPosY, 4, 100);
  rect(RocketPosX+3, RocketPosY, 3, 100);
  fill(170, 170, 170, 155);
  rect(RocketPosX-8, RocketPosY, 2, 100);
  rect(RocketPosX+5, RocketPosY, 2, 100);

  // Rocket Feets.
  fill(200, 0, 0);
  quad (RocketPosX-7, RocketPosY+75, RocketPosX-7, RocketPosY+100, RocketPosX-27, RocketPosY+150, RocketPosX-38, RocketPosY+150); //x1, y1, x2, y2, x3, y3, x4, y4
  stroke(250, 250, 250, 75);
  strokeWeight(2);
  line(RocketPosX-8, RocketPosY+75, RocketPosX-38, RocketPosY+149);
  noStroke();
  rect (RocketPosX-1, RocketPosY+100, 2, 50);
  quad (RocketPosX+7, RocketPosY+75, RocketPosX+7, RocketPosY+100, RocketPosX+27, RocketPosY+150, RocketPosX+38, RocketPosY+150); // x1, y1, x2, y2, x3, y3, x4, y4
  stroke(250, 250, 250, 75);
  strokeWeight(2);
  line(RocketPosX+7, RocketPosY+75, RocketPosX+37, RocketPosY+149);

  // Exhaust pipe.
  noStroke();
  fill(45);
  quad(RocketPosX-7, RocketPosY+100, RocketPosX+7, RocketPosY+100, RocketPosX+4, RocketPosY+112, RocketPosX-4, RocketPosY+112);

  // Smoke
  fill (smokeR, smokeG, smokeB, smokeA);
  quad(RocketPosX-4, RocketPosY+112, RocketPosX, RocketPosY+112, RocketPosX-8, RocketPosY+135, RocketPosX-8, RocketPosY+135);
  quad(RocketPosX, RocketPosY+112, RocketPosX+4, RocketPosY+112, RocketPosX+8, RocketPosY+135, RocketPosX+8, RocketPosY+135);
  quad(RocketPosX, RocketPosY+115, RocketPosX+3, RocketPosY+135, RocketPosX, RocketPosY+146, RocketPosX-3, RocketPosY+135);
  
  // Movement.
  RocketPosY = RocketPosY - 1;
  RocketPosX = RocketPosX + random (-2, 2); // This was first int after change it to float it worked fine! Be consistent!!!
}



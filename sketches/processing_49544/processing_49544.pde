
/* First Assignment, Initials
 
 Created by Sarah Keeling, skeeling
 Copyright 2012
 */


void setup () {
  size (400, 400);
  smooth();
}

void draw () {

  background (#B3F5AD); 
  backgroundPattern ();

  // K
  noStroke ();
  fill (0, 0, 0, 120);
  //>>bottom triangle
  triangle (220, 200, 330, 380, 250, 380);
  //>>top triangle
  triangle (220, 200, 330, 80, 310, 80);
  stroke (#B3F5AD);
  strokeWeight (1);
  line (248, 370, 325, 370);
  line (240, 359, 315, 359);
  line (240, 340, 315, 340);

  //E
  noStroke ();
  pushMatrix ();
  translate (8, 0);
  fill (255, 255, 255, 200);
  rect (200, 0, 10, 365);
  rect (210, 280, 35, 5);
  rect (210, 335, 30, 5);
  rect (210, 360, 35, 5);
  popMatrix ();

  letterS ();
}


void letterS () {

  strokeWeight (1);
  stroke (0, 0, 0, 120);
  line (120, 80, 140, 80);

  strokeWeight (2);
  line (110, 85, 150, 85);
  line (100, 90, 160, 90);

  fill (0, 0, 0, 120);
  noStroke ();
  rect (90, 95, 25, 1);
  rect (150, 95, 25, 1);
  rect (80, 100, 30, 2);
  rect (160, 100, 25, 2);
  rect (75, 108, 30, 1);
  rect (165, 108, 25, 1);

  stroke (0, 0, 0, 120);
  line (70, 115, 100, 115);
  line (167, 115, 194, 115);
  line (70, 120, 98, 120);
  line (167, 120, 194, 120);

  strokeWeight (3);
  line (65, 125, 95, 125);
  line (168, 125, 195, 125);
  line (62, 130, 92, 130);
  line (169, 130, 195, 130);
  line (60, 135, 90, 135);

  strokeWeight (1);
  line (169, 135, 195, 135);
  line (60, 140, 90, 140);
  line (169, 140, 195, 140);
  line (169, 145, 195, 145);

  strokeWeight (2);
  line (64, 150, 94, 150);
  line (169, 150, 195, 150);
  line (66, 155, 96, 155);
  line (169, 155, 195, 155);

  strokeWeight (1);
  line (68, 160, 98, 160);
  line (70, 165, 100, 165);
  line (75, 175, 105, 175);
  line (78, 180, 108, 180);
  line (81, 185, 111, 185);
  line (85, 190, 115, 190);
  line (95, 200, 125, 200);
  line (100, 205, 130, 205);
  line (105, 210, 135, 210);
  line (110, 215, 140, 215);
  line (115, 220, 145, 220);
  line (120, 225, 150, 225);

  strokeWeight (2);
  line (125, 230, 155, 230);
  line (130, 235, 160, 235);
  line (135, 240, 165, 240);
  line (140, 245, 170, 245);
  line (145, 250, 175, 250);
  line (148, 255, 178, 255);

  strokeWeight (1);
  line (154, 265, 182, 265);

  line (158, 270, 183, 270);
  line (161, 275, 184, 275); 
  line (161, 280, 184, 280);

  strokeWeight(1);
  line (160, 285, 185, 285);
  line (159, 295, 186, 295);

  strokeWeight (2);
  line (157, 300, 187, 300);
  line (155, 305, 187, 305);
  line (152, 310, 186, 310);
  line (150, 315, 185, 315);

  strokeWeight (1);
  line (148, 320, 185, 320);
  line (145, 325, 184, 325);
  line (135, 330, 184, 330);
  line (60, 335, 182, 335);

  strokeWeight (3);
  line (63, 340, 180, 340);
  line (66, 345, 175, 345);
  line (70, 350, 170, 350);

  strokeWeight (1);
  line (80, 355, 165, 355);
  line (90, 360, 160, 360);
  line (98, 365, 155, 365);

  //going up 

  line (35, 255, 60, 255);
  line (35, 260, 60, 260);

  strokeWeight (2);
  line (35, 265, 60, 265);
  line (35, 270, 60, 270);
  line (35, 275, 61, 275);

  strokeWeight (1);
  line (35, 280, 61, 280);
  line (36, 285, 62, 285);

  strokeWeight (2);
  line (38, 295, 64, 295);
  line (39, 300, 65, 300);
  line (40, 305, 66, 305);
  line (42, 310, 68, 310);
  line (45, 315, 71, 315);
  line (47, 320, 80, 320);
  line (50, 325, 90, 325);
  line (53, 330, 100, 330);
}

void backgroundPattern () {
  noStroke ();
  for (int i=0; i< (width +100); i = i+ 40) {
    for (int j=0; j < (height+100); j = j + 40) {
      fill (255, 0, 0, 130);
      ellipse (i, j, 5, 5);
    }
  } 

  for (int x=20; x< (width+100); x = x+ 40) {
    for (int y=20; y < (height+100); y = y + 40) {
      fill (255, 0, 0, 80);
      rect (x, y, 5, 5);
    }
  }
}


//saveFrame( “hw1.jpg”);



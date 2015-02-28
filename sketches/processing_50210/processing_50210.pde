
//HW Assignment 3, Jim Robert's Processing for the Arts @ CMU Spring 2012
//Sarah Keeling, 1/15/12
//Copyright 2012

int yellow = #FAE94C;
int brown = #7C5A2D;
int backgroundColor = 255;
int stripe;
int stripeMove = 1;
int textMov;

void setup () {
  size ( 600, 600);
  frameRate (12);
  smooth ();
  loadPixels();
}

void draw () {
  background (backgroundColor);
  backgroundPattern ();
  Body ();
  Head ();
  Legs ();
  Action ();
}


void backgroundPattern () {
  noStroke ();
  for (int i = 0; i< width; i = i + 50) {
    if (mousePressed) {
      fill  (random(255), random (255), random (255));
      rect (0, i, width, 20);
    }
    else {
      fill (0);
      rect (0, i, width, 20);
    }
  }
}

void Body () {
  // NECK 
  stroke (brown);
  strokeWeight (8);
  line (190, 150, 268, 375);

  //TORSO
  fill (yellow);
  stroke (yellow);
  beginShape ();
  curveVertex ( 190, 150 );
  curveVertex ( 190, 150 );
  curveVertex ( 200, 200 );
  curveVertex ( 259, 361 );
  curveVertex ( 282, 378 );
  curveVertex ( 317, 400 );
  curveVertex ( 340, 415 );
  curveVertex ( 370, 440 );
  curveVertex ( 380, 470 );
  curveVertex ( 360, 500 );
  curveVertex ( 324, 507 );
  curveVertex ( 305, 506 );
  curveVertex ( 275, 502 );
  curveVertex ( 250, 500 );
  curveVertex ( 220, 480 );
  curveVertex ( 210, 460 );
  curveVertex ( 204, 440 );
  curveVertex ( 215, 420 );
  curveVertex ( 221, 400 );
  curveVertex ( 223, 380 );
  curveVertex ( 220, 360 );
  curveVertex ( 212, 338 );
  curveVertex ( 199, 280 );
  curveVertex ( 191, 240 );
  curveVertex ( 180, 200 );
  curveVertex ( 170, 168 );
  curveVertex ( 170, 168 );
  endShape();

  //neckfur
  beginShape ();
  endShape ();

  //TAIL 
  stroke (yellow);
  strokeWeight (5);
  line (380, 460, 420, 540);
  fill (brown);
  noStroke ();
  triangle (420, 540, 412, 552, 434, 552);
}

void Head () {
  //EARS
  fill (yellow);
  stroke (yellow );
  beginShape ();
  curveVertex ( 180, 70 );
  curveVertex ( 180, 70 );
  curveVertex ( 200, 80 );
  curveVertex ( 210, 100 );
  curveVertex ( 210, 120 );
  curveVertex ( 198, 140 );
  curveVertex ( 190, 154 );
  curveVertex ( 180, 184 );
  curveVertex ( 170, 172 );
  curveVertex ( 160, 175 );
  curveVertex ( 140, 178 );
  curveVertex ( 115, 170 );
  curveVertex ( 146, 130 );
  curveVertex ( 155, 120 );
  curveVertex ( 162, 100 );
  curveVertex ( 164, 80 );
  curveVertex ( 173, 73 );
  curveVertex ( 173, 73 );
  endShape (CLOSE);
  ellipse ( 184, 88, 40, 35);

  //ANTLERS
  //>>left
  strokeWeight(8);
  beginShape ();
  vertex (174, 80);
  vertex (174, 80);
  vertex (165, 58);
  vertex (165, 58);
  endShape ();

  //>>right
  beginShape ();
  vertex (198, 90);
  vertex (198, 90);
  vertex (210, 61);
  vertex (210, 61);
  endShape ();

  //annterler knobs
  fill (brown);
  stroke (brown);
  strokeWeight(2);
  ellipse (210, 57, 12, 12);
  ellipse (165, 54, 12, 12);
  strokeWeight (1);

  //NOSE
  noStroke ();
  fill (255, 200, 200);
  ellipse (115, 160, 90, 50);

  //nostrills
  fill (#7C5A2D);
  ellipse (95, 149, 8, 8);
  ellipse (125, 150, 8, 8);

  //EYES
  stroke (brown);
  strokeWeight (1);
  //>> whites
  fill(255);
  ellipse ( 170, 103, 17, 17 );
  ellipse ( 190, 106, 17, 17 );

  //>>pupils
  fill (0);
  float x1 = 173;
  float y1 = 103;
  float x2 = 185;
  float y2 = 107;

  float dx1 = constrain ((mouseX - x1)/30, -14, 4);
  float dy1 = constrain ((mouseY - y1)/30, -14, 4);
  float dx2 = constrain ((mouseX - x2)/30, -14, 4);
  float dy2 = constrain ((mouseY - y2)/30, -14, 4);

  ellipse (x1+dx1, y1+dy1, 7, 7);
  ellipse (x2 + dx2, y2 + dy2, 7, 7);
}

void Legs () {
  int x = 220;
  int y = 480;
  int feetY1 = 580;
  int bot = 600;

  fill (yellow);
  noStroke();
  //>>legs
  rect (x, y, 20, 100);
  rect (x+40, y, 20, 100);
  rect (x+95, y, 20, 100);
  rect (x+130, y, 20, 100);
  //>>feet
  fill (127);
  quad (x, feetY1, x+20, feetY1, x+22, bot, x-2, bot);
  quad (x+40, feetY1, x+ 60, feetY1, x+62, bot, x+38, bot);
  quad (x+95, feetY1, x+95+20, feetY1, x+95+22, bot, x+93, bot);
  quad (x+ 130, feetY1, x+150, feetY1, x+152, bot, x+128, bot);
}

void Action () {
  if (mousePressed) {
    for (int j = 0; j < 50; j++) {
      fill (random(255), random (255), random (255));
      noStroke ();
      rect (random (width), random (height), 8, 8);
    }
    //MOUTH
    fill(brown);
    ellipse (109, 166, 20, 28);
  }
  if (keyPressed) {
    fill (255, 0, 0);
    textSize (60);
    text ("Giraffe!", CENTER, CENTER);
  }
}




/*
Konkuk University
SOS iDesign
Name: Song YoungJun
ID: 201420083
*/

void setup() {
  //setupAudio();
  size (600, 600);
  smooth();
}

float c = random(255);

void draw() {

  background(255);
  /*
  getVolume();
  float Y = map(volume, 0, 100, 20, 60);
  float X = map(volume, 0, 600, 20, 60);
  */

  //Circle
  fill(0);
  ellipse (0, 0, X+100, X+100);
  ellipse (width, 0, X+100, X+100);
  ellipse (0, height, X+100, X+100);
  ellipse (width, height, X+100, X+100);
  ellipse (width/2, height/2, Y+400, Y+400);

  //Head - Brown
  stroke (0);
  strokeWeight (1);
  fill (197, 120, 64);
  beginShape ();
  vertex (210, 410);
  vertex (140, 240);
  vertex (180, 80);
  vertex (300, 50);
  vertex (420, 80);
  vertex (460, 240);
  vertex (390, 410);
  vertex (325, 250);
  vertex (325, 100); //Right
  vertex (275, 100); //Left
  vertex (275, 250);
  endShape (CLOSE);
  float ra = random(-20, 20);

  //Ears
  beginShape ();
  vertex (180, 80);
  vertex (110, 70);
  vertex (10, 205);
  vertex (65+ra, 470+ra);
  vertex (115+ra, 490+ra);
  vertex (175+ra, 470+ra);
  vertex (185, 350);
  vertex (140, 240);
  endShape (); //Left Ears
  beginShape ();
  vertex (420, 80);
  vertex (490, 70);
  vertex (590, 205);
  vertex (535-ra, 470+ra);
  vertex (485-ra, 490+ra);
  vertex (425-ra, 470+ra);
  vertex (415, 350);
  vertex (460, 240);
  endShape (); //Right Ears

  //Head - White
  fill (255);
  beginShape ();
  vertex (220, 480);
  vertex (210, 440);
  vertex (210, 410);
  vertex (275, 250);
  vertex (275, 100);
  vertex (325, 100);
  vertex (325, 250);
  vertex (390, 410);
  vertex (390, 440);
  vertex (380, 480);
  vertex (330, 510);
  vertex (270, 510);
  endShape (CLOSE);

  //Mouth
  noStroke();
  fill (204, 146, 132);
  triangle (300, 420, 250, 480, 350, 480);
  quad (250, 480, 270, 490, 330, 490, 350, 480);

  //Eyes
  fill (255);
  rectMode(CENTER);
  rect (210, 220, 70, 60); //left
  rect (390, 220, 70, 60); //Right
  float mx1 = map (mouseX, 0, width, 185, 235);
  float mx2 = map (mouseX, 0, width, 365, 415);
  float my = map (mouseY, 0, height, 200, 240);
  fill (0);
  rect (mx1, my, X, X); //left - Iris
  rect (mx2, my, X, X); //Right - Iris

  //Nose
  fill (105, 77, 74);
  rectMode (CORNERS);
  rect (250, 380, 350, 440);
  quad (250, 440, 270, 460, 330, 460, 350, 440);
  float rb = random(-10, 10);

  //Whiskers
  stroke(120);
  strokeWeight (3);
  line (240, 400, 200+rb, 450+rb);
  line (240, 430, 200+rb, 480+rb);
  line (240, 460, 200+rb, 510+rb);
  line (360, 400, 400-rb, 450+rb);
  line (360, 430, 400-rb, 480+rb);
  line (360, 460, 400-rb, 510+rb);

  //bonus

  if (mousePressed) {
    noFill();
    stroke (random(255), random(255), random(255));
    ellipse (210, 220, 100, 100); //left
    ellipse (390, 220, 100, 100); //Right
    line (260, 220, 275, 250);
    line (340, 220, 325, 250);
    line (260, 220, 340, 220);
    line (160, 220, 60, 140);
    line (440, 220, 540, 140);
    rectMode (CENTER);
    fill(random(255), random(255), random(255));
    rect (275, 250, 20, 30);
    rect (325, 250, 20, 30);
    noStroke();
    fill (random(255));
    rectMode (CORNERS);
    rect (250, 380, 350, 440);
    quad (250, 440, 270, 460, 330, 460, 350, 440); //nose - colorchange

    //Dog bone
    float r1 = random(255);
    stroke (r1);
    fill (c, mouseY, c);
    rectMode (CENTER);
    ellipse (mouseX+30, mouseY+15, 30, 30);
    ellipse (mouseX+30, mouseY-15, 30, 30);
    ellipse (mouseX-30, mouseY+15, 30, 30);
    ellipse (mouseX-30, mouseY-15, 30, 30);
    noStroke();
    rect (mouseX, mouseY, 60, 30);
    stroke(r1);
    line(mouseX-15, mouseY-15, mouseX+15, mouseY-15);
    line(mouseX-15, mouseY+15, mouseX+15, mouseY+15);

    //tongue
    float k = random(510, 580);
    noStroke();
    fill(#ED9595);
    beginShape();
    vertex (270, 490);
    vertex (280, k);
    vertex (290, k+20);
    vertex (310, k+20);
    vertex (320, k);
    vertex (330, 490);
    endShape(CLOSE);
  }
}


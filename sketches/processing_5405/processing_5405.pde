
//background
int x = 480;
float y, z, yy, zz;
float targetX, targetY, targetZ;
float easing = 0.03;
float easing2 = 0.8;
float b, c, speed = 0.0;
PShape h, a, p, e, hh, aa, pp, ee, ff, o, oo, n;
PFont f;
boolean vector = false;

//setup
void setup() {
  size (320, 480);
  smooth ();
  noStroke ();
  frameRate(30);

  //shapes
  h = loadShape ("background.svg");
  a = loadShape ("arms.svg");
  p = loadShape ("legs.svg");
  e = loadShape ("neck.svg");
  hh = loadShape ("headbody.svg");
  aa = loadShape ("spaceship.svg");
  pp = loadShape ("earth.svg");
  ee = loadShape ("satellite.svg");
  ff = loadShape ("bubbles.svg");
  o = loadShape ("space1.svg");
  oo = loadShape ("bubbles1.svg");
  n = loadShape ("fire.svg");

  //fonts
  f = loadFont ("Technoidone-48.vlw");
}

//ROBOT 
void draw () {

  background (34, 30, 83);

  pushMatrix();
  float currentTime = millis() / 1000.0;
  if (currentTime < 4.0) {
    speed = 0.0;
  } 
  else if (currentTime < 11.0) {
    speed = 2.0;
  } 
  else if (currentTime < 15.0) {
    speed = 0.0;
  } 
  else if (currentTime < 22.0) {
    speed = 2.0;
  } 
  else if (currentTime < 26.0) {
    speed = 0.0; 
  } 
  else if (currentTime < 33.0) {
    speed = 2.0;
  } 
  else if (currentTime < 37.0) {
    speed = 0.0;
  }
  yy = yy + speed;
  shape (o, yy-1250, 0);
  popMatrix();
  shape (h, 0, x- 437);

  //CRATER
  fill (0);
  ellipse(52, x - 57, 69, 15);
  ellipse(91, x - 38, 36, 10);
  ellipse(270, x - 51, 79, 18);

  //EARTH
  pushMatrix();
  translate (250, (x - 420));
  rotate (b);
  shape (pp, -15, -15); 
  b = b + 0.01;
  popMatrix();

  //SATELLITE
  pushMatrix();
  translate (160, 480);
  rotate (c);
  shape (ee, 295, 295);
  c = c + 0.01;
  popMatrix();

  //WINDOWS
  fill(70);
  quad(16, x - 286, 27, x - 290, 27, x - 276, 16, x - 273);
  quad(33, x - 292, 45, x- 295, 45, x - 282, 33, x - 279);
  quad(18, x - 267, 29, x - 272, 29, x - 258, 18, x - 255);
  quad(10, x - 133, 22, x - 137, 22, x - 124, 11, x - 120);
  quad(31, x - 138, 43, x - 142, 43, x - 129, 32, x - 126);
  quad(52, x - 143, 64, x - 147, 64, x - 134, 52, x - 131);
  quad(13, x - 113, 24, x - 117, 24, x - 103, 13, x - 100);
  quad(253, x - 373, 263, x - 377, 264, x - 364, 253, x - 361);
  quad(259, x - 351, 270, x - 354, 271, x - 341, 259, x - 337);
  quad(295, x - 311, 306, x - 314, 306, x - 301, 295, x - 298);

  //RED COMMAND BUTTONS

  if ((mouseX > 185) && (mouseX < 199) &&
    (mouseY < x - 194) && (mouseY > x - 208)) {
    shape(oo, 30, x - 379);
    textFont(f, 25);
    fill(0);
    text("hehe..", 38, x - 338);
  } 
  else {
  }

  pushMatrix();
  if ((mousePressed == true) && ((mouseX > 185) && (mouseX < 199) &&
    (mouseY < x - 194) && (mouseY > x - 208))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke(); 
    textFont(f, 25); 
    fill (random(0,255)); 
    text("SHAKE SHAKE SHAKE", 8, 90);
    fill (255, 242, 0);

    //BODY
    float sc = random (-2, 2);
    shape (hh, 120, (x - 309.5) + sc);

    //ROBOT ARMS
    float sh = random (-2, 2);
    shape (a, 70, (x - 217) + sh);

    //LEGS
    float sa = random (-2, 2);
    shape (p, 120, (x - 126) + sa);

    //NECK
    float sp = random (-.5, .5);
    shape (e, 120, (x - 343) + sp);
  } 
  else {
    fill ((random(100,240)), (random(5, 50)), (random(5, 50)));

    //BODY
    shape (hh, 120, x - 309.5);

    //ROBOT ARMS
    shape (a, 70, x - 217);

    //LEGS
    shape (p, 120, x - 126);

    //NECK
    shape (e, 120, x - 343);
  }
  ellipse (192, x - 201, 12, 12);
  popMatrix();

  if ((mouseX > 171) && (mouseX < 183) &&
    (mouseY < x - 194) && (mouseY > x - 208)) {
    shape(ff, 192, x - 379);
    textFont(f, 30);
    fill(0);
    text("...no!", 210, x - 338);
  } 
  else {
  }

  pushMatrix();
  if ((mousePressed == true) && ((mouseX > 171) && (mouseX < 183) &&
    (mouseY < x - 194) && (mouseY > x - 208))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    textFont(f, 31); 
    fill (random(0,255)); 
    text("SELF-DESTRUCT!", 5, 90);
    fill (255, 242, 0);

    //antenna 
    fill ((random(100,240)), (random(5, 50)), (random(5, 50))); 
    triangle(163, x - 309, 170, x - 296, 160, x- 296); 

    //robot head 
    fill ((random(100,240)), (random(5, 50)), (random(5, 50)));
    quad(128, x-296, 200, x-296, 200, x-233, 128, x-233);

    //robot body 
    fill ((random(100,240)), (random(5, 50)), (random(5, 50)));
    quad (120, x - 224, 211, x - 224, 211, x - 125, 120, x - 125); 

    //robot command 
    fill ((random(100,240)), (random(5, 50)), (random(5, 50)));
    quad (129, x - 213, 201, x - 213, 201, x - 165, 129, x - 165); 
  } 
  else {
    fill ((random(100,240)), (random(5, 50)), (random(5, 50)));

  }
  ellipse (177, x - 201, 12, 12);
  popMatrix();

  //SIREN
  fill(215, 31, 38);
  targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.5;
  targetX = targetX + ((targetY - targetX) * easing2);
  ellipse(166, x - 309, targetX, targetX);

  //EYEBALL RED
  fill(215, 31, 38);
  ellipse(149, x - 271, 16, 16);
  ellipse(179, x - 271, 16, 16);

  //EYEBALL WHITE
  fill(255);
  float ex = constrain(mouseX, 175, 183); 
  float ey = constrain(x - mouseY, x - 266, x - 275); 
  float ex2 = constrain(mouseX, 145, 153); 
  float ey2 = constrain(x - mouseY, x - 266, x - 275); 
  ellipse(ex2, ey2, 7, 7); 
  ellipse(ex, ey, 7, 7); 

  //SPARKS
  fill (random(100, 255));
  beginShape();
  vertex(133, x - 313);
  vertex(147, x - 318);
  vertex(148, x - 312);
  vertex(154, x - 312);
  vertex(145, x - 307);
  vertex(142, x - 312);
  endShape();

  beginShape();
  vertex(162, x - 343);
  vertex(168, x - 331);
  vertex(162, x - 329);
  vertex(162, x - 323);
  vertex(157, x - 332);
  vertex(162, x - 334);
  endShape();

  beginShape();
  vertex(173, x - 313);
  vertex(181, x - 318);
  vertex(183, x - 313);
  vertex(192, x - 315);
  vertex(181, x - 307);
  vertex(178, x - 313);
  endShape();

  //TOP LEFT BUTTON
  if ((mousePressed == true) && ((mouseX > 173) && (mouseX < 182) &&
    (mouseY < x - 181) && (mouseY > x - 189))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    textFont(f, 48); 
    fill (random(0,255)); 
    text("Hello!", 30, 90);

    fill (255, 242, 0);
  } 
  else {
    fill (random (0, 255));
  }
  quad(173, x - 189, 182, x - 189, 182, x - 181, 173, x - 181);

  //TOP RIGHT BUTTON
  if ((mousePressed == true) && ((mouseX > 184) && (mouseX < 192) &&
    (mouseY < x - 181) && (mouseY > x - 189))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    textFont(f, 27); 
    fill (random(0,255)); 
    text("OVERPOWER!", 8, 90);
    fill (255, 242, 0);

    fill ((random(170,260)), (random(160, 240)), (random(0, 80)));
    quad(16, x - 286, 27, x - 290, 27, x - 276, 16, x - 273);
    quad(33, x - 292, 45, x- 295, 45, x - 282, 33, x - 279);
    quad(18, x - 267, 29, x - 272, 29, x - 258, 18, x - 255);
    quad(10, x - 133, 22, x - 137, 22, x - 124, 11, x - 120);
    quad(31, x - 138, 43, x - 142, 43, x - 129, 32, x - 126);
    quad(52, x - 143, 64, x - 147, 64, x - 134, 52, x - 131);
    quad(13, x - 113, 24, x - 117, 24, x - 103, 13, x - 100);
    quad(253, x - 373, 263, x - 377, 264, x - 364, 253, x - 361);
    quad(259, x - 351, 270, x - 354, 271, x - 341, 259, x - 337);
    quad(295, x - 311, 306, x - 314, 306, x - 301, 295, x - 298);
  } 
  else {
    fill (random(0, 255));

  }
  quad(184, x - 189, 192, x - 189, 192, x - 181, 184, x - 181);

  //BOTTOM LEFT BUTTON

  if ((mousePressed == true) && ((mouseX > 173) && (mouseX < 182) &&
    (mouseY < x - 170) && (mouseY > x - 179))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    textFont(f, 33); 
    fill (random(0,255)); 
    text("ATTACK EARTH!", 8, 90);
    fill (255, 242, 0);

    pushMatrix();
    float currentTime1 = millis() / 1000.0;
    zz = zz + speed;
    if (currentTime1<3.0) {
      speed = 1.0;
    } 
    else if (zz < 295) {
      speed = 4.0;
    } 
    else {
      speed = 0.0;
    }
    //SPACESHIP
    translate(zz, x - 550);
    float se = sin(b) *10;
    b = b + PI/36.0;
    shape (aa, -70, (x - 370) + se);
    popMatrix();
  } 
  else {
    fill (random (0, 255));

    //SPACESHIP
    float se = sin(b) *10;
    b = b + PI/36.0;
    shape (aa, -70, (x - 440) + se);

  }
  quad(173, x - 179, 182, x - 179, 182, x- 170, 173, x - 170);

  //BOTTOM RIGHT BUTTON
  if ((mousePressed == true) && ((mouseX > 184) && (mouseX < 192) &&
    (mouseY < x - 170) && (mouseY > x - 179))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247); 
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    textFont(f, 50); 
    fill (random(0,255)); 
    text("BURN!", 30, 90);
    fill (255, 242, 0);

    shape (n, 13, x - 130);

    fill ((random(100,240)), (random(5, 50)), (random(5, 50)));
    ellipse(52, x - 57, 69, 15);
    ellipse(91, x - 38, 36, 10);
    ellipse(270, x - 51, 79, 18);
  } 
  else {
    fill (random(0, 255));
  }
  quad(184, x - 179, 192, x - 179, 192, x - 170, 184, x - 170);
}



//background
int x = 480;
float targetX, targetY;
float easing2 = 0.8;
PShape h, a, p, e, hh;
PImage i;
PFont f;
boolean vector = false;

//setup
void setup() {
  size (320, 480);
  smooth ();
  noStroke();

  //shapes
  h = loadShape ("space.svg");
  a = loadShape ("arms.svg");
  p = loadShape ("legs.svg");
  e = loadShape ("neck.svg");
  hh = loadShape ("headbody.svg");

  //images
  i = loadImage ("realbody.jpg");

  //fonts
  f = loadFont ("Technoidone-48.vlw");
}

//ROBOT 
void draw () {

  background (0);
  shape (h, 0, 0);

  //SPACEBAR
  if (vector == true) {

    //BODY
    float sc = random (-1, 1);
    shape (hh, 122, (x - 309.5) + sc);

    //ROBOT ARMS
    float sh = random (-2, 2);
    shape (a, 71, (x - 217) + sh);

    //LEGS
    float sa = random (-2, 2);
    shape (p, 123, (x - 126) + sa);

  } 
  else {

    //REAL BODY
    float aa = random (-1, 1);
    image(i, 0, 0 + aa);
  }

  //HEAD AND BODY
  //float sc = random (-1, 1);
  //shape (hh, 122, (x - 309.5) + sc); 

  //SIREN
  fill(215, 31, 38);
  targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.5;
  targetX = targetX + ((targetY - targetX) * easing2);
  ellipse(164, x - 309, targetX, targetX);

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

  //NECK
  float sp = random (-.5, .5);
  shape (e, 122, (x - 343) + sp);

  //RED COMMAND BUTTONS
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
    textFont(f, 48); 
    fill (random(0,255)); 
    text("Rebooting", 5, 90);
    fill (255, 242, 0);
  } 
  else {
    fill(215, 31, 38);
  }
  ellipse (177, x - 201, 12, 12);


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
    textFont(f, 30); 
    fill (random(0,255)); 
    text("Self-Destruct!", 8, 90);
    fill (255, 242, 0);
  } 
  else {
    fill(215, 31, 38);
  }
  ellipse (192, x - 201, 12, 12);

  //SPARKS
  fill (random(100, 255));
  beginShape();
  vertex(135, x - 313);
  vertex(147, x - 318);
  vertex(148, x - 312);
  vertex(154, x - 312);
  vertex(145, x - 307);
  vertex(144, x - 312);
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
    text("Hello!", 70, 90);

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
    text("PRESS MY BUTTONS!", 8, 90);

    fill (255, 242, 0);
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
    textFont(f, 28); 
    fill (random(0,255)); 
    text("HIT THE SPACEBAR!", 8, 90);
    fill (255, 242, 0);
  } 
  else {
    fill (random (0, 255));

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
    textFont(f, 18); 
    fill (random(0,255)); 
    text("Please tell me what to do!", 13, 90);
    fill (255, 242, 0);
  } 
  else {
    fill (random (0, 255));

  }
  quad(184, x - 179, 192, x - 179, 192, x - 170, 184, x - 170);
}

void keyPressed() {
  if (key == ' ') {
    if (vector == true) {
      vector = false;
    } 
    else {
      vector = true;
    }
  }
}




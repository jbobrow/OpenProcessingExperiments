
// Oliver Haimson
// Chernoff cats
// Copyright 2012

float x, y, wd, ht;
// the variable features
float eyeWidth, catWidth, earHeight, noseWidth;

void setup() {
  size(600, 600);
  smooth();
  background(44,94,206);
  x=width/6;
  y=height/6;
  ht=160;
  // set up the starting values for a "normal" cat face
  catWidth = 175;
  eyeWidth = catWidth/19;
  earHeight = .56;
  noseWidth = catWidth*.1;
  wd=catWidth;
}

void draw() {
  makeFace();
}

void makeFace() {
  wd=catWidth;
  strokeWeight(3);
  noStroke();
  fill(250);
  ellipse(x, y, wd, ht*.95);

  // ears
  fill(250);
  stroke(195, 150, 108);
  strokeJoin(ROUND);
  triangle(x+wd*.45, y-ht*.24, x+wd*.49, y-ht*earHeight, x+wd*.21, y-ht*.46);
  triangle(x-wd*.45, y-ht*.24, x-wd*.49, y-ht*earHeight, x-wd*.21, y-ht*.46);

  // calico
  fill(195, 150, 108);
  beginShape();
  curveVertex(x+wd*.4, y-ht*.2);
  curveVertex(x+wd*.49, y-ht*.11);
  curveVertex(x+wd*.48, y+ht*.05);
  curveVertex(x+wd*.35, y+ht*.15);
  curveVertex(x+wd*.1, y-ht*.05);
  curveVertex(x+wd*.2, y-ht*.3);
  curveVertex(x+wd*.3, y-ht*.34);
  curveVertex(x+wd*.49, y-ht*.11);
  curveVertex(x+wd*.55, y-ht*.02);
  endShape();

  beginShape();
  curveVertex(x-wd*.4, y-ht*.2);
  curveVertex(x-wd*.49, y-ht*.11);
  curveVertex(x-wd*.48, y+ht*.05);
  curveVertex(x-wd*.35, y+ht*.1);
  curveVertex(x-wd*.1, y-ht*.05);
  curveVertex(x+wd*.01, y-ht*.48);
  curveVertex(x-wd*.3, y-ht*.38);
  curveVertex(x-wd*.41, y-ht*.3);
  curveVertex(x-wd*.49, y-ht*.11);
  curveVertex(x-wd*.55, y-ht*.02);
  endShape();

  fill(30);
  stroke(30);
  beginShape();
  curveVertex(x-wd*.23, y-ht*.43);
  curveVertex(x-wd*.2, y-ht*.47);
  curveVertex(x+wd*.05, y-ht*.5);
  curveVertex(x+wd*.25, y-ht*.43);
  curveVertex(x+wd*.45, y-ht*.24);
  curveVertex(x+wd*.49, y-ht*.11);
  curveVertex(x+wd*.4, y-ht*.24);
  curveVertex(x+wd*.3, y-ht*.15);
  curveVertex(x+wd*.2, y-ht*.24);
  curveVertex(x+wd*.1, y-ht*.18);
  curveVertex(x-wd*.05, y-ht*.4);
  curveVertex(x-wd*.2, y-ht*.47);
  curveVertex(x-wd*.23, y-ht*.55);
  endShape();

  beginShape();
  curveVertex(x-wd*.3, y-ht*.45);
  curveVertex(x-wd*.2, y-ht*.47);
  curveVertex(x-wd*.15, y-ht*.3);
  curveVertex(x-wd*.4, y-ht*.3);
  curveVertex(x-wd*.2, y-ht*.47);
  curveVertex(x-wd*.1, y-ht*.45);
  endShape();

  noStroke();
  beginShape();
  curveVertex(x+wd*.1, y+ht*.1);
  curveVertex(x, y+ht*.32);
  curveVertex(x-wd*.17, y+ht*.37);
  curveVertex(x-wd*.1, y+ht*.43);
  curveVertex(x+wd*.02, y+ht*.46);
  curveVertex(x+wd*.06, y+ht*.37);
  curveVertex(x, y+ht*.32);
  curveVertex(x-wd*.1, y+ht*.3);
  endShape();

  stroke(30);
  triangle(x+wd*.28, y-ht*.42, x+wd*.49, y-ht*earHeight, x+wd*.21, y-ht*.46);

  // nose
  fill(222, 178, 176);
  noStroke();
  strokeJoin(ROUND);
  triangle(x-noseWidth*.5, y+ht*.22, x+noseWidth*.5, y+ht*.22, x, y+ht*.29);
  stroke(30);
  strokeWeight(1);
  line(x, y+ht*.29, x, y+ht*.32);

  // mouth
  noFill();
  stroke(30);
  strokeWeight(3);
  beginShape();
  curveVertex(x+wd*.1, y+ht*.1);
  curveVertex(x, y+ht*.32);
  curveVertex(x-wd*.2, y+ht*.36);
  curveVertex(x-wd*.4, y+ht*.2);
  endShape();

  beginShape();
  curveVertex(x-wd*.1, y+ht*.1);
  curveVertex(x, y+ht*.32);
  curveVertex(x+wd*.2, y+ht*.36);
  curveVertex(x+wd*.4, y+ht*.2);
  endShape();

  // eyes
  fill(163, 172, 149);
  beginShape();
  curveVertex(x-wd*.12, y+ht*.07);
  curveVertex(x-wd*.12, y+ht*.03);
  curveVertex(x-wd*.15, y-ht*.04);
  curveVertex(x-wd*.29, y-ht*.07);
  curveVertex(x-wd*.35, y-ht*.07);
  endShape();
  arc(x-wd*.2, y-ht*.02, wd/6.6, ht/6.6, .2, PI+QUARTER_PI-.2);

  beginShape();
  curveVertex(x+wd*.12, y+ht*.07);
  curveVertex(x+wd*.12, y+ht*.03);
  curveVertex(x+wd*.15, y-ht*.04);
  curveVertex(x+wd*.29, y-ht*.07);
  curveVertex(x+wd*.35, y-ht*.07);
  endShape();
  arc(x+wd*.2, y-ht*.02, wd/6.6, ht/6.6, -.5, PI-.3);

  fill(30);
  arc(x-wd*.205, y-ht*.01, eyeWidth, ht/10, -1, 4);
  arc(x+wd*.205, y-ht*.01, eyeWidth, ht/10, -1, 4);

  // whiskers
  stroke(200);
  strokeWeight(.8);
  noFill();
  curve(x-wd*.2, y+ht*.6, x+wd*.05, y+ht*.27, x+wd*.5, y+ht*.3, x+wd*.6, y+ht*.5);
  curve(x-wd*.2, y+ht*.6, x+wd*.05, y+ht*.29, x+wd*.53, y+ht*.35, x+wd*.6, y+ht*.5);
  curve(x-wd*.2, y+ht*.6, x+wd*.05, y+ht*.31, x+wd*.5, y+ht*.39, x+wd*.6, y+ht*.5);
  curve(x+wd*.2, y+ht*.6, x-wd*.05, y+ht*.27, x-wd*.5, y+ht*.3, x-wd*.6, y+ht*.5);
  curve(x+wd*.2, y+ht*.6, x-wd*.05, y+ht*.29, x-wd*.53, y+ht*.35, x-wd*.6, y+ht*.5);
  curve(x+wd*.2, y+ht*.6, x-wd*.05, y+ht*.31, x-wd*.5, y+ht*.39, x-wd*.6, y+ht*.5);

  curve(x+wd*.15, y, x+wd*.12, y-ht*.07, x+wd*.17, y-ht*.25, x+wd*.4, y-ht*.4);
  curve(x+wd*.15, y, x+wd*.135, y-ht*.08, x+wd*.23, y-ht*.29, x+wd*.44, y-ht*.4);
  curve(x+wd*.15, y, x+wd*.15, y-ht*.09, x+wd*.27, y-ht*.26, x+wd*.48, y-ht*.4);
  curve(x-wd*.15, y, x-wd*.12, y-ht*.07, x-wd*.17, y-ht*.25, x-wd*.4, y-ht*.4);
  curve(x-wd*.15, y, x-wd*.135, y-ht*.08, x-wd*.23, y-ht*.29, x-wd*.44, y-ht*.4);
  curve(x-wd*.15, y, x-wd*.15, y-ht*.09, x-wd*.27, y-ht*.26, x-wd*.48, y-ht*.4);
}

void mousePressed() {
  // set random values for variable face features
  catWidth=random(75, 200);
  eyeWidth=random(catWidth/40, catWidth/10);
  earHeight=random(.35, .61);
  noseWidth=random(catWidth*.04, catWidth*.2);
  // populate the rest of the screen
  if (x < (width-width/3)) {
    x+=width/3;
  }
  else if (x > (width-width/3)) {
    x=width/6;
    y+=height/3;
  }
  // start over after 9 cats are drawn
  if (y > height) {
    background(44,94,206);
    x=width/6;
    y=height/6;
  }
  makeFace();
}

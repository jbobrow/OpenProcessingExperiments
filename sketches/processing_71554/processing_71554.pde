
// Oliver Haimson
// cat face
// Copyright 2012

float x, y, wd, ht;
PImage grass;

void setup() {
  size(400, 400);
  smooth();
  grass = loadImage("http://i47.tinypic.com/2zpsd3s.jpg");
  x=width/2;
  y=height/2-20;
  wd=175;
  ht=175;
}

void draw() {
  image(grass,0,0);
  makeBody();
  makeFace();
}


void makeFace() {
  strokeWeight(3);
  noStroke();
  fill(250);
  ellipse(x, y, wd, ht*.95);
  
  // ears
  fill(250);
  stroke(195,150,108);
  strokeJoin(ROUND);
  triangle(x+wd*.45, y-ht*.24, x+wd*.49, y-ht*.56, x+wd*.21, y-ht*.46);
  triangle(x-wd*.45, y-ht*.24, x-wd*.49, y-ht*.56, x-wd*.21, y-ht*.46);
  
  // calico
  fill(195,150,108);
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
  curveVertex(x,y+ht*.32);
  curveVertex(x-wd*.1, y+ht*.3);
  endShape();
  
  stroke(30);
  triangle(x+wd*.28, y-ht*.42, x+wd*.49, y-ht*.56, x+wd*.21, y-ht*.46);

  // nose
  fill(222, 178, 176);
  noStroke();
  strokeJoin(ROUND);
  triangle(x-wd*.05, y+ht*.22, x+wd*.05, y+ht*.22, x, y+ht*.29);
  stroke(30);
  strokeWeight(1);
  line(x,y+ht*.29, x, y+ht*.32);

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
  arc(x-wd*.205, y-ht*.01, wd/20, ht/10, -1, 4);
  arc(x+wd*.205, y-ht*.01, wd/20, ht/10, -1, 4);
  
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

void makeBody(){
  stroke(250);
  fill(250);
  ellipse(x+wd*.7, y+ht*.4, wd*2, ht*.9);
  strokeWeight(wd/5.5);
  line(x-wd*.2, y+ht*.5, x-wd*.4, y+ht*.7);
  line(x+wd*.2, y+ht*.6, x-wd*.3, y+ht*.9);
  stroke(30);
  strokeWeight(1);
  line(x-wd*.4, y+ht*.75, x-wd*.4, y+ht*.79);
  line(x-wd*.45, y+ht*.74, x-wd*.45, y+ht*.78);
  line(x-wd*.3, y+ht*.95, x-wd*.3, y+ht*.99);
  line(x-wd*.35, y+ht*.94, x-wd*.35, y+ht*.98);
}

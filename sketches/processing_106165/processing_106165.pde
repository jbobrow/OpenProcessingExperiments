
//ball positions
//float xpos1;
//float xpos2;
//float xpos3;
//
//float ypos1;
//float ypos2;
//float ypos3;

//lengths of needles
int length1=200;
int length2=100;
int length3=50;

//ball sizes
int d1=4;
int d2=7;
int d3=10;

PFont font2;

float theta1=0;
float theta2=10;

void setup() {
  font2=loadFont("font2.vlw");
  size (600, 600);
  //  xpos1=width/2;
  //  ypos1=height/2-length1;
  //  xpos2=width/2;
  //  ypos2=height/2-length2;
  //  xpos3=width/2;
  //  ypos3=height/2-length3;
}

void draw() {
  background(0);

  //outlines of the watch base
  stroke(255);
  strokeWeight(4);
  fill(0, 0, 0, 0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(theta1));
  stroke(255,0,0,50);
  ellipse(0, 0, 450, 480);
  rotate(radians(theta2));
  stroke(0,255,0,50);
  ellipse(0, 0, 480, 450);
   stroke(0,0,255,50);
  ellipse(0, 0, 450, 450);
   stroke(255,0,255,50);
  ellipse(0, 0, 480, 480);
  rotate(radians(theta2));
  stroke(0,255,0,50);
  ellipse(0, 0, 430, 430);
  rotate(radians(theta1));
  stroke(0,0,255,50);
  ellipse(0, 0, 450, 430);
  rotate(radians(theta2));
  stroke(255,0,0,50);
  ellipse(0, 0, 430, 450);
  popMatrix();



  theta1++;
  theta2=+3;

  //time text
  textAlign(CENTER);
  fill(255);
  textSize(16);
  textFont(font2);
  text(hour()+":"+minute()+":"+second(), width/2, 400);

  //  //second ball
  //  pushMatrix();
  //  translate(width/2, height/2);
  //  rotate(radians(map(second(), 0, 60, 0, 360)));
  //  ellipse(0, -length1, d1, d1);
  //  popMatrix();
  //
  //  //minute ball
  //  pushMatrix();
  //  translate(width/2, height/2);
  //  rotate(radians(map(minute(), 0, 60, 0, 360)));
  //  ellipse(0, -length2, d2, d2);
  //  popMatrix();
  //
  //  //hour ball
  //  pushMatrix();
  //  translate(width/2, height/2);
  //  rotate(radians(map(hour(), 0, 12, 0, 360)));
  //  ellipse(0, -length3, d3, d3);
  //  popMatrix();


  //second circle
  fill(150);
  strokeWeight(0);
  ellipse(width/2, height/2, 60, 60);

  //second needle
  pushMatrix();
  translate(width/2, height/2);
  stroke(150);
  strokeWeight(4);
  rotate(radians(map(second(), 0, 60, 0, 360)));
  line(0, 0, 0, -length1);
  popMatrix();

  //minute circle
  fill(50);
  ellipse(width/2, height/2, 50, 50);

  //minute needle
  pushMatrix();
  translate(width/2, height/2);
  stroke(50);
  strokeWeight(7);
  rotate(radians(map(minute(), 0, 60, 0, 360)));
  line(0, 0, 0, -length2);
  popMatrix();

  //hour ball
  fill(200);
  ellipse(width/2, height/2, 40, 40);

  //hour needle
  pushMatrix();
  translate(width/2, height/2);
  stroke(200);
  strokeWeight(10);
  rotate(radians(map(hour(), 0, 12, 0, 360)));
  line(0, 0, 0, -length3);
  popMatrix();

  //black cirle in the center
  fill(0);
  noStroke();
  ellipse(width/2, height/2, 20, 20);
}


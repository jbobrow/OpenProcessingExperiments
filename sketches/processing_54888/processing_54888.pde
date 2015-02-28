
/*
For best viewing experience,
listen to your favorite trippy song.
If you do not have a favorite trippy song,
enjoy this animation with Lucy in the Sky with Diamonds.

*/

//shape numbers Lvl one
float lvlOneShape = 10;
float lvlOneSpd = 5;
float theta = 0;
float lvlOneRadius = 50;

//shape numbers lvl two
float lvlTwoShape = 4;
float lvlTwoSpd = -2;
float lvlTwoRadius = 150;

//background colors
float bgR =random(100, 200);
float bgG=random(100, 200);
float bgB=random(100, 200);
float spdR=random(-1, 1);
float spdG=random(-1, 1);
float spdB=random(-1, 1);
float limitR = 200;
float limitG = 200;
float limitB = 200;
float floorR = 50;
float floorG = 50;
float floorB = 50;



//CenterShape
float csOneR =random(150, 255);
float csOneG =random(0, 50);
float csOneB =random(0, 50);
float csOnespdR=5;
float csOnespdG=random(-1, 1);
float csOnespdB=random(-1, 1);
float csOnelimitR = 255;
float csOnelimitG = 50;
float csOnelimitB = 50;
float csOnefloorR = 150;
float csOnefloorG = 0;
float csOnefloorB = 0;

void setup() {
  size(500, 500); 
  //smooth();
}

void draw() {
  background(255);


  //colored background
  pushMatrix();
  backgroundColors();
  popMatrix();

  //spiral
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(5));
  spiral();
  popMatrix();

  //centerShape1
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount * radians(-1));
  centerShape(250, 250);
  popMatrix();

  //centerShape2
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount * radians(1));
  centerShape(100, 100);
  popMatrix();

  //rotatingShape level 1
  for (int i=0; i<lvlOneShape; i++) {
    pushMatrix();
    translate(width/2, height/2);
    translate(cos(theta)*lvlOneRadius, sin(theta)*lvlOneRadius);
    fill(255, random(100,255), 0);
    rotatingShape(20, 20, -.1);
    popMatrix();
    theta += TWO_PI/lvlOneShape;
  }

  //rotatingShape level 2
  for (int i=0; i<lvlTwoShape; i++) {
    pushMatrix();
    translate(width/2, height/2);
    translate(cos(theta)*lvlTwoRadius, sin(theta)*lvlTwoRadius);
    fill(random(100,255), 255, 0);
    rotatingShape(50, 50, .05);
    pushMatrix();
    fill(random(200,255));
        translate(cos(theta)*lvlTwoRadius, sin(theta)*lvlTwoRadius);

    rotatingShape(10,10, .01);
    popMatrix();
    popMatrix();
    theta += TWO_PI/lvlTwoShape;
  }
}



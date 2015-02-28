
// " Eye Am "
// Created by Jeffrey Leung
// MPM505 Vis and Generative Pro
// Prof: David Bouchard
// Oct 31, 2013



// Pupil
PImage pupil; 
float pupilradius = 200; 

// Iris
PImage iris; 
PImage irisdetail1;    
PImage irisdetail2;    
PImage irisdetail3;   
PImage irisdetail4;    
float irisradius = 500; 
float irisdetailradius = 495;


void setup() {
  size (750, 750);
  pupil = loadImage("pupilcircle.png");

  iris = loadImage("iriscircle.png");
  irisdetail1 = loadImage("irisdetail1.png");
  irisdetail2 = loadImage("irisdetail2.png");
  irisdetail3 = loadImage("irisdetail3.png");
  irisdetail4 = loadImage("irisdetail4.png");
}

void draw() {
  background(255);

  // Mouse X & Y Color Mapping 
  float colorr  = map(mouseY, 00, 550, 120, 150);
  float colorg  = map(mouseY, 00, 550, 120, 150);
  float colorb = map(mouseX, 0, 550, 100, 200);


  // Rotation measures
  float cw = radians (frameCount);
  float ccw = -radians(frameCount);


  // ~~~~~~~~~~~~~~~~~~~~~~~~ SPINNING COUNTER CLOCKWISE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  pushMatrix();
  imageMode(CENTER);
  translate(width/2, width/2);

  //~~~ IRIS ~~~
  rotate(ccw);
  tint(colorr, colorg, colorb);
  image (iris, 0, 0, irisradius, irisradius );            
  noTint();

  //~~~ IRIS DETAIL 2 ~~~
  rotate(ccw/2);
  image (irisdetail2, 0, 0, irisdetailradius, irisdetailradius);

  //~~~ IRIS DETAIL 4~~~ 
  rotate(ccw*2);
  image (irisdetail4, 0, 0, irisdetailradius, irisdetailradius);
  popMatrix();


  // ~~~~~~~~~~~~~~~~~~~~~~~~ SPINNING CLOCKWISE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  pushMatrix();
  translate(width/2, width/2);
  imageMode(CENTER);

  //~~~ IRIS DETAIL 1~~~
  rotate(cw/2);
  image (irisdetail1, 0, 0, irisdetailradius, irisdetailradius);

  //~~~ IRIS DETAIL 3~~~
  rotate(cw/5);
  image (irisdetail3, 0, 0, irisdetailradius, irisdetailradius);

  //~~~ PUPIL ~~~
  rotate(cw);
  tint(0, colorg, colorb, 255);
  image (pupil, 0, 0, pupilradius, pupilradius);
  noTint();
  popMatrix();
}



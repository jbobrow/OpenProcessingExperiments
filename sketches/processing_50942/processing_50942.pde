
// eyes
//mjmurdock 2012
///////////////////////////////
//global variables
PShape hair;
PShape freckles;
PImage eyeShadow;
PImage eyeRim;
PImage shutEyeL;
PImage shutEyeR;
float thetaX = 45;
float thetaY = 45;

float eyeRad = 160;
float pupilRad = 110;
float topReflectRad = 40;
float bottomReflectRad = 55;
int specularReflect = 40;


void setup() {
  smooth();
  size(640, 480);
  background(239, 214, 168);
  fill(219, 185, 185);

  hair = loadShape("hair.svg");
  freckles = loadShape("freckles.svg");
  eyeShadow = loadImage("594B60D.png");
  eyeRim = loadImage("594B608.png");
  shutEyeL = loadImage("594B613.png");
  shutEyeR = loadImage("594B615.png");
}

void draw() {
  background(239, 214, 168);
  fill(219, 185, 185);
  ellipse(140, height/2, 170, 170);
  ellipse(500, height/2, 170, 170);
  noFill();
  imageMode(CENTER);
  rectMode(CENTER);


  float rotX = map(mouseX, 0, width, -10, 10);
  float rotY = map(mouseY, 0, width, -20, 20);

  image(eyeRim, 140, height/2, 250, 250);
  image(eyeRim, 500, height/2, 250, 250);

  drawEye(140, height/2);
  drawEye(500, height/2);


  if (mousePressed == true && mouseY > height/2) {

    image(eyeShadow, 124, 278, 200, 100);
    image(eyeShadow, 495, 278, 200, 100);
    fill(239, 214, 168);
    rect(124, 316, 218, 80);
    rect(495, 316, 218, 80);
  } 
  else if (mousePressed == true && mouseY < height/2) {

    image(eyeShadow, 124, 196, 200, 100);
    image(eyeShadow, 495, 196, 200, 100);
    fill(239, 214, 168);
    rect(124, 160, 218, 80);
    rect(495, 160, 218, 80);
  }

  // WoAH EYES
  if (mousePressed == true && (mouseX > 300 || mouseX < 400)) {
    pupilRad += sin(frameCount);
    topReflectRad += sin(frameCount*2)*3;
    bottomReflectRad += sin(frameCount+5)*2;
    specularReflect = 200;
  } 
  else {
    specularReflect = 40;
  }
  
 


  // shuteyes
  float blink = sin(frameCount/2)*20;
  
  if ((mouseX - pmouseX > 6 && blink >0) || (mouseY - pmouseY > 6 && blink >0)) {
    fill(239, 214, 168);
    rect(124, 160, 400, 400);
    rect(495, 160, 400, 400);
    image(shutEyeL, 124, height/2, 200, 200);
    image(shutEyeR, 495, height/2, 200, -200);
  }
  println(blink);
   // eyebrows
  fill(#3A2B14);
  pushMatrix();
  translate(124, 140);
  rotate(radians(20+rotX+rotY));
  rect(0, 0, 218, 30);
  popMatrix();

  pushMatrix();
  translate(495, 140);
  rotate(-radians(20+rotX+rotY));
  rect(0, 0, 218, 30);
  popMatrix();



  shape(hair, 0, 0);
  shape(freckles, 0, 0);
}


void drawEye(int posX, int posY) {
  // function variables
  float d = dist(mouseX, mouseY, posX, posY);
  float x, y;

  float offsetX = map(mouseX, 0, width, -30, 30);
  float offsetY = map(mouseY, 0, width, -30, 30);
  float offsetR1x = .5;
  float offsetR1y = .5;
  x = posX+offsetX;
  y = posY+offsetY;

  thetaX =offsetX/30;
  thetaY =offsetX/20;


  noStroke();
  fill(255);
  //outer eye
  ellipse(posX, posY, eyeRad, eyeRad);
  //pupil
  fill(35, 31, 32);
  ellipse(x, y, pupilRad, pupilRad);

  //top reflect
  fill(255, specularReflect-20);
  pushMatrix();
  translate(x, y);
  rotate(thetaX);
  translate(25, -15);

  ellipse(0, 0, topReflectRad, topReflectRad);
  popMatrix();

  //bottom reflect
  fill(255, specularReflect);
  pushMatrix();
  translate(x, y);
  rotate(thetaY);
  translate(-20, 15);
  ellipse(0, 0, bottomReflectRad, bottomReflectRad);
  popMatrix();
}



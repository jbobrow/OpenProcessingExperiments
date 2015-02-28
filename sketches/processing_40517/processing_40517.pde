
//Intro to Computational Media, Homework 4 (based 0ff of homework2)
//Zena Koo and Mark Breneman
//camera 

float cameraBodyX=random(150, 350);
float cameraBodyY=cameraBodyX;
float cameraBodyW=400;
float cameraBodyH=250;

float shutterX=cameraBodyX+40;
float shutterY=cameraBodyX-130;
float shutterW=120;
float shutterH=60;

float flashFrameX=shutterX;
float flashFrameY=shutterY-5;
float flashFrameW=85;
float flashFrameH=20;

float outerLensX=flashFrameX;
float outerLensY=outerLensX-45;
float outerLensW=130;
float outerLensH=outerLensW;

float innerLensX=outerLensX;
float innerLensY=outerLensY;
float innerLensW=50;
float innerLensH=innerLensW;

float cameraButtonX=cameraBodyX-140;
float cameraButtonY=cameraButtonX+8;
float cameraButtonW=60;
int cameraButtonH=15;

float innerFlashSize = 0;
float flashX = innerLensX;
float flashY = flashFrameY;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  drawCamera();
//  while drawCamera() {

    drawFlashes();
  }









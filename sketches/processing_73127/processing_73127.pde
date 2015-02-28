
//*****************************************
//*Assignment 3
//*Bryce Lewis
//*bklewis@brynmawr.edu
//*CS 110 - Section 1
//*10/3/2012
//*This program draws a desert with cacti and clouds.
//*When the mouse is over the sky, it grows dim.
//*When the mouse approaches a cloud, it darkens.
//*Clicking a cloud creates lightning.
//*****************************************

//cloud and lightning variables
float x = random(50,150);
float y = random(20,200);
float objectWidth = random(50,150);
float objectHeight = objectWidth/4;

float x2 = random(200,300);
float y2 = random(20,200);
float objectWidth2 = random(75,200);
float objectHeight2 = objectWidth/4;

float x3 = random(350,550);
float y3 = random(20,200);
float objectWidth3 = random(75,200);
float objectHeight3 = objectWidth/4;

float x4 = random(650,750);
float y4 = random(20,200);
float objectWidth4 = random(75,200);
float objectHeight4 = objectWidth/4;

//cactus variables
float a = random(100,200);
float b = random(350,450);
float objectWidthc = b/8;
float objectHeightc = objectWidthc*2;

float a2 = random(250,350);
float b2 = random(350,450);
float objectWidthc2 = b2/8;
float objectHeightc2 = objectWidthc2*2;

float a3 = random(400,500);
float b3 = random(350,450);
float objectWidthc3 = b3/8;
float objectHeightc3 = objectWidthc3*2;

float a4 = random(650,750);
float b4 = random(350,450);
float objectWidthc4 = b4/8;
float objectHeightc4 = objectWidthc4*2;


//set up of desert
void setup(){
  frameRate(20);
  size(800,500);
  background(250,200,0);
  noStroke();
  smooth();
}


//the sky is dark or clear
void draw(){
  noStroke();
  if(mouseY>-1){
  background(250,180,55);
  
  if(mouseY>350){
    fill(80,190,255);
  }
   else if(mouseY<351){
      fill(110,120,200);
    }
  rect(0,0,800,350);
  }

  //calling cloud functions
  drawCloud(x,y,objectWidth,objectHeight);
  drawCloud(x2,y2,objectWidth2,objectHeight2);
  drawCloud(x3,y3,objectWidth3,objectHeight3);
  drawCloud(x4,y4,objectWidth4,objectHeight4);
  
  //calling cactus functions
  drawCactus(a,b,objectWidthc,objectHeightc);
  drawCactus(a2,b2,objectWidthc2,objectHeightc2);
  drawCactus(a3,b3,objectWidthc3,objectHeightc3);
  drawCactus(a4,b4,objectWidthc4,objectHeightc4);
}

//lightning appears for the cloud that is clicked
void mousePressed(){
  if ((mouseX > x-objectWidth/2) && (mouseX < x + objectWidth/2)
  && (mouseY > y-objectHeight) && (mouseY < y + objectHeight)){
    drawLightning(x,y,objectWidth,objectHeight);
    drawCloud(x,y,objectWidth,objectHeight);
  }
  else if((mouseX > x2-objectWidth2/2) && (mouseX < x2 + objectWidth2/2)
  && (mouseY > y2-objectHeight2) && (mouseY < y2 + objectHeight2)){
    drawLightning(x2,y2,objectWidth2,objectHeight2);
    drawCloud(x2,y2,objectWidth2,objectHeight2);
  }
  else if((mouseX > x3-objectWidth3/2) && (mouseX < x3 + objectWidth3/2)
  && (mouseY > y3-objectHeight3) && (mouseY < y3 + objectHeight3)){
    drawLightning(x3,y3,objectWidth3,objectHeight3);
    drawCloud(x3,y3,objectWidth3,objectHeight3);
  }
  else if((mouseX > x4-objectWidth4/2) && (mouseX < x4 + objectWidth4/2)
  && (mouseY > y4-objectHeight4) && (mouseY < y4 + objectHeight4)){
    drawLightning(x4,y4,objectWidth4,objectHeight4);
    drawCloud(x4,y4,objectWidth4,objectHeight4);
  }
}

//cloud function
void drawCloud(float x, float y, float objectWidth, float objectHeight){
  float d = dist(x,y,mouseX,mouseY);
  fill(d+100);
  stroke(250);
   ellipse(x,y,objectWidth,objectHeight*1.5);
   ellipse(x-30,y+10,objectWidth/2,objectHeight*1.25);
   ellipse(x+20,y+10,objectWidth/2,objectHeight*1.5);
   ellipse(x-40,y-20,objectWidth/3,objectHeight/2);
   ellipse(x-10,y-15,objectWidth/2,objectHeight*1.25);
   ellipse(x+3,y-15,objectWidth/2,objectHeight);
}

//lightning function
void drawLightning(float x,float y, float objectWidth, float objectHeight){
    fill(255,255,0);
  beginShape();
    vertex(x-2, y+objectHeight/2);
    vertex(x-objectWidth/2, y+objectHeight*2.5);
    vertex(x+objectWidth/2, y+objectHeight*3.5);
    vertex(x-objectWidth/2, y+objectHeight*6);
    vertex(x+objectWidth/2, y+objectHeight*8);
    vertex(x-objectWidth/2+objectWidth/5, y+objectHeight*6);
    vertex(x+objectWidth/2+objectWidth/5, y+objectHeight*3.5);
    vertex(x-objectWidth/2+objectWidth/5, y+objectHeight*2.5);
    vertex(x-2+objectWidth/5, y+objectHeight/2);
    endShape();
}

//cactus function
void drawCactus(float a, float b, float objectWidthc, float objectHeightc){
  fill(10, 150, 10);
  noStroke();
  ellipse(a, b, objectWidthc, objectHeightc);
  ellipse(a, b, 2*objectWidthc, objectHeightc/5);
  rect(a-objectWidthc/2,b,objectWidthc,objectHeightc/2);
}

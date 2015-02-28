
import processing.opengl.*;


//04/16/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com
//Schiffman Transform and Rotate Example with explanations

int r = 0;
int tx = 0;
int ty = 0;
int tz = 0;
int rx = 150;
int ry = 150;
int toggle =0;

void setup(){
  size(500,500,OPENGL);
  smooth();
}

void draw(){
  
  background(255);
  rectMode(CORNER);
  
  //text stuff
  fill(0);
  PFont font;
  font = loadFont("Serif-36.vlw");
  textFont (font, 20);
  text("radians " + r, 150, 300);
  text("translate("+tx+","+ty+","+tz+")", 150, 325);
  text("rectangle x,y: "+rx+","+ ry, 150, 350);
  
  
  if(toggle >0){
    r=r+3;
  }
  if (toggle >1){
    tx = 250;
    ty = 150;
    tz = 0;
  }
  if (toggle > 2){
    rx = 0;
    ry = 0;
  }
  


  fill(255,0,0);
  ellipse(tx, ty, 6, 6);//shows origin of the rotation translation
  
  fill(0);
  translate(tx, ty, tz);
  if (toggle<4  && toggle >0){
  // text("rotation function:  rotate()",-100, 225);
   rotate(radians(r));
  }
  if (toggle ==4){
    text("rotation function:  rotateX()", -100, 225);
    rotateX(radians(r));
  }
  if (toggle ==5){
    text("rotation function:  rotateY()",-100, 225);
    rotateY(radians(r));
  }
 
  //draw rectangle
  
  
  
  rectMode(CENTER);
  fill(0,0,250);
  rect(rx, ry, 100, 100);
  
}

void mouseReleased(){
  //saveFrame("screenshot.jpg");
  if(toggle <5){
  toggle++;
  r=0;
  }else {
    toggle = 0;
  }
}
  


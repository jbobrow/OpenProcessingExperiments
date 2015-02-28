
//Created by William McEnery for NMD 295 Spring 2013
//House with the car which follows the X coordinate of the mouse
//Name of the variable which holds the "car_sedan_lineart"
PImage car;
PImage frog;

void setup(){
  size(1152, 648);
  smooth();
  background(0, 190, 229); //blue color for the sky background
  car = loadImage("car_sedan_lineart.png");
  frog = loadImage("frog_clipart_4.png");
}

void draw(){
  //draws the ground
  background( 0,190, 229);
  fill(75, 175, 102);
  noStroke();
  rect(0, 502, 1152, 150); 
  
  //draws the sun
  //adapted from http://openprocessing.org/sketch/85605
  //currently off
  noStroke();
  fill(230,178,92);
  ellipse(144,81,100,100); 
  fill(204,94,30,125);
  translate(width/8, height/8);
  //for (int i=0;i<360;i+=30){
   // rotate(radians(30));
  //  quad(10, 30, 50, 65, 50, 40, 50, 30);}
      //  fill(204,94,30,125);
 // for (int i=0;i<360;i+=30){
 //   rotate(radians(30));
 //   quad(0, 0, 45, 90, 0, 40, 40, 65);}
  
  //noLoop();
  
  //draws the base shape for the house
  fill(244, 244, 215);
  beginShape();
  vertex(30, 448);
  vertex(800, 448);
  vertex(800, 200);
  bezierVertex(550, 325, 300, 0, 30, 200);
  endShape(CLOSE);
  
  //draws the second story
  fill(244, 244, 215);
  beginShape();
  vertex(150, 200);
  vertex(700, 200);
  vertex(700, 75);
  bezierVertex(550, 150, 400, -20, 150, -10);
  endShape(CLOSE);
  
  //draws the first floor roof
  fill(219, 152, 97);
  beginShape();
  vertex(-20, 235);
  bezierVertex( 300, 0, 550, 325, 850, 230);
  vertex(850, 185);
  bezierVertex(550, 275, 300, -50, -20, 190);
  endShape(CLOSE);
  
  //draws the second floor roof
  fill (219, 152, 97);
  beginShape();
  vertex(125, -35);
  bezierVertex(400, -20, 550, 150, 725, 50);
  vertex(725, 75);
  bezierVertex(550, 175, 400, 5, 125, 0);
  endShape(CLOSE);
  
  //draws the garage door
  stroke(153, 33, 0);
  strokeWeight(4);
  fill(200, 91, 60);
  rect(100, 273, 175, 175, 30, 30, 0, 0);
  
  //draws the front door
  fill(200, 91, 60);
  rect(700, 368, 40, 80, 10, 10, 0, 0);
  
  //windows
  fill(225, 249, 249);
  ellipse(90, 225, 70, 70);
  ellipse(187, 205, 70, 70);
  ellipse(280, 225, 70, 70);
  ellipse(195, 50, 50, 50);
  ellipse(275, 60, 50, 50);
  ellipse(650, 145, 50, 50);
  
  //doorknob
  fill(114, 112, 110);
  noStroke();
  ellipse(710, 410, 10,10);
  
  //the translation was for the sun which I turned off, I need to add a boolean
  //if condition to the loop that draws the rays so they don't loop forever
  translate(-width/8, -height/8);
  
  imageMode(CORNER);
  image(frog, 500, mouseY);
  
  imageMode(CENTER);
  image(car, mouseX, 500);
  
  
}



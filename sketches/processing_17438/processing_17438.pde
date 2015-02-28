
//Assignment 1: My Avatar
//by Brittany Truex

void setup(){
  size(200,200);
  smooth();
  frameRate(60);
}

void draw(){
  background(255,255,255);
fill(255,0,0);
noStroke();
//firstrow
rect(0,100,25,25);
rect(50,100,25,25);
rect(100,100,25,25);
rect(150,100,25,25);
rect(200,100,25,25);
//secondrow
rect(25,75,25,25);
rect(75,75,25,25);
rect(125,75,25,25);
rect(175,75,25,25);
//thirdrow
rect(0,50,25,25);
rect(50,50,25,25);
rect(100,50,25,25);
rect(150,50,25,25);
rect(200,50,25,25);
//
rect(25,25,25,25);
rect(75,25,25,25);
rect(125,25,25,25);
rect(175,25,25,25);
//
rect(0,0,25,25);
rect(50,0,25,25);
rect(100,0,25,25);
rect(150,0,25,25);
rect(200,0,25,25);
//
rect(25,125,25,25);
rect(75,125,25,25);
rect(125,125,25,25);
rect(175,125,25,25);
//
rect(0,150,25,25);
rect(50,150,25,25);
rect(100,150,25,25);
rect(150,150,25,25);
rect(200,150,25,25);
//
rect(25,175,25,25);
rect(75,175,25,25);
rect(125,175,25,25);
rect(175,175,25,25);
//
rect(0,200,25,25);
rect(50,200,25,25);
rect(100,200,25,25);
rect(150,200,25,25);
rect(200,200,25,25);
  
//bun
fill(253,208,28);
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);

//left
ellipse(mouseX-13,mouseY-22,21,27);
rect(mouseX-11.5,mouseY+5,22,60);
ellipse(mouseX-13,mouseY+32.5,21,26.7);

//right
ellipse(mouseX+16,mouseY-22,22,27);
rect(mouseX+16.5,mouseY+5,22,60);
ellipse(mouseX+16,mouseY+32.5,22,27);

//legs
noFill();
stroke(0);
strokeWeight(1.5);
arc(mouseX+2.5,mouseY+58.8,30,50,TWO_PI-PI/2, TWO_PI);
arc(mouseX+2.5,mouseY+58.8,30,50,PI,TWO_PI-PI/2);

//feet
noFill();
stroke(0);
strokeWeight(.5);
ellipse(mouseX-15,mouseY+58.8,6,2);
ellipse(mouseX+20,mouseY+59,6,2);

//hotdog body
fill(191,17,11);
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);

ellipse(mouseX+2.5,mouseY-20.6,27,27);
rect(mouseX+3,mouseY+5,27,58.8);
ellipse(mouseX+2.5,mouseY+28.8,28,27);

//eyes
fill(255);
noStroke();
ellipse(mouseX-1,mouseY-18.5,5,13);
ellipse(mouseX+6,mouseY-18.5,5,13);

fill(0);
noStroke();
ellipse(mouseX-1,mouseY-16,2,7);
ellipse(mouseX+6,mouseY-16,2,7);

//mouth
noFill();
stroke(0);
strokeWeight(.5);
arc(mouseX+8,mouseY-7,10,10,PI/2,PI);

//arms
noFill();
stroke(0);
strokeWeight(2);
arc(mouseX-11,mouseY-13,30,30,PI/2,PI);
arc(mouseX+16,mouseY-7,30,30,0,PI/2);

//condiment
stroke(mouseX+255,mouseX+40,0);
noFill();
strokeWeight(2);
arc(mouseX+2,mouseY+5,10,10,TWO_PI-PI/2,TWO_PI);
arc(mouseX+2,mouseY+6,10,10,0,PI/2);
arc(mouseX+2,mouseY+15,10,10,PI/2,PI);
arc(mouseX+2,mouseY+16,10,10,PI,TWO_PI-PI/2);
arc(mouseX+2,mouseY+25,10,10,TWO_PI-PI/2,TWO_PI);
arc(mouseX+2,mouseY+26,10,10,0,PI/2);
arc(mouseX+2,mouseY+35,10,10,PI/2,PI);
arc(mouseX+2,mouseY+36,10,10,PI,TWO_PI-PI/2);

}

//juggle:

void mousePressed() {

//condiment
stroke(255,255,0);
noFill();
strokeWeight(2);
arc(mouseX+2,mouseY+5,10,10,TWO_PI-PI/2,TWO_PI);
arc(mouseX+2,mouseY+6,10,10,0,PI/2);
arc(mouseX+2,mouseY+15,10,10,PI/2,PI);
arc(mouseX+2,mouseY+16,10,10,PI,TWO_PI-PI/2);
arc(mouseX+2,mouseY+25,10,10,TWO_PI-PI/2,TWO_PI);
arc(mouseX+2,mouseY+26,10,10,0,PI/2);
arc(mouseX+2,mouseY+35,10,10,PI/2,PI);
arc(mouseX+2,mouseY+36,10,10,PI,TWO_PI-PI/2);
}               

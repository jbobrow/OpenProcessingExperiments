
//Sabrina Li (sjli@andrew.cmu.edu)
//Copyright Sabrina Li January 2014 Pittsburgh, PA
//Homework 1

size(400, 400);

PImage x;
x = loadImage("night_sky.jpg");
background(x);

smooth();
noStroke();
fill(255, 255, 255);
arc(126, 208, 120, 120, -QUARTER_PI, PI-QUARTER_PI);
rect(242, 246, 80, 20);
fill(255, 255, 255, 250);
rect(222, 220, 20, 46);
fill(255, 255, 255, 210);
rect(222, 182, 20, 34);
fill(255, 255, 255, 170);
rect(222, 154, 20, 24);
fill(255, 255, 255, 130);
rect(222, 134, 20, 16);
fill(255, 255, 255, 90);
rect(222, 120, 20, 10);
fill(255, 255, 255, 50);
rect(222, 110, 20, 6);

noFill();
stroke(255, 255, 255);
strokeWeight(6);
arc(146, 170, 120, 120, PI-QUARTER_PI, TWO_PI-PI/4);

//saveFrame("hw1.jpg");




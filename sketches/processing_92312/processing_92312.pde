
//this is﻿ what happens when the program starts: 

//it only happens once.

void setup() {

//this creates a canvas 400 pixels wide

//and 400 pixels high

size(400,400);smooth();
strokeWeight(4);}


//this tells Processing how to draw

//it happens continuously

void draw(){
fill(230);
background(230);
stroke(0);
ellipse(100,100,100,mouseX/5);

ellipse(300,100,100,mouseY/5);

fill(100);
stroke(200);
ellipse(200,200,300,300);

// draw a line from 100, 250 to 300,260
fill(10);
ellipse(150,200,50,50);

ellipse(250,200,50,50);
fill(200,50,100);
rect(100,250,200,mouseX/10);

//draw another likne 200,200 to 200,220

line(200,200,200,220);

//draw a big round wllipse

//at position 200,200

//with width 300

//and height 300 
}

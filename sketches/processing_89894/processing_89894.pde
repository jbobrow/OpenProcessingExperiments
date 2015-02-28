
//Copyright 2013 Kimberly Harvey all rights reserved Kharvey@cmu.edu
//Homework 4

//QUESTION: How do I reorder the code below so that the star made with 
//mousePressed() alwasy appears on top of the ones that are drawn?

//QUESTION: How can I scale the stars in DRAW so that they are 50% smaller
//than the stars in mousePressed??

//QUESTION: how can i make the mousePressed star a random size with each click?


float easingCoef;

void setup()//anything in setup happens once
{
size (400,400);  
background(255);
smooth ();
easingCoef = .1;

}


void draw() // anything in draw loops forever
{  
noStroke();
beginShape();
fill (random(255),random(255),random(255), 25);
vertex(mouseX,mouseY-46);//top point
vertex(mouseX-11,mouseY-11);
vertex(mouseX-48,mouseY-11); //left point
vertex(mouseX-13,mouseY+6);
vertex(mouseX-24,mouseY+48);//bottom left point
vertex(mouseX,mouseY+14);
vertex(mouseX+24,mouseY+48);//bottom right point
vertex(mouseX+13,mouseY+6);
vertex(mouseX+48,mouseY-11);//right point
vertex(mouseX+11,mouseY-11);

endShape(CLOSE);

}


void mousePressed() { //this code only happens when a user clicks the mouse
  
//  stroke (0);
//  fill (random(255),random(255),random(255));
//  rectMode (CENTER);
//  rect(mouseX,mouseY,random(255),random(255));


beginShape();
fill (random(255),random(255),random(255));
vertex(mouseX,mouseY-46);//top point
vertex(mouseX-11,mouseY-11);
vertex(mouseX-48,mouseY-11); //left point
vertex(mouseX-13,mouseY+6);
vertex(mouseX-24,mouseY+48);//bottom left point
vertex(mouseX,mouseY+14);
vertex(mouseX+24,mouseY+48);//bottom right point
vertex(mouseX+13,mouseY+6);
vertex(mouseX+48,mouseY-11);//right point
vertex(mouseX+11,mouseY-11);

endShape(CLOSE);

//scale(random);
}




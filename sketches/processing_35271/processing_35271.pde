
//Homework 2
size(300,300);

float x=13;

//red circle
fill(255,0,0);
ellipse(width/2,height/2,3*x,3*x);

//yellow circle
fill(255,255,0);
ellipse(250,height/2,60,60);

//green square
fill(0,255,0);
rectMode(CENTER);
rect(width/x,height/2,80,80);

//orange line
strokeWeight(2);
stroke(255,145,0);
line(width*.66,(height/2)+(6*x),width*.66,(height/2)-(6*x));

//blue triangle
stroke(0);
fill(0,0,255);
strokeWeight(1);
triangle((width*.33),(height/2)-(2*x),(width*.33)+(2*x),(height/2)+(2*x),
(width*.33)-(2*x),(height/2)+(2*x));



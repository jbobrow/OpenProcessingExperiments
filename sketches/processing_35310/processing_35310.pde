
// My birtdate is October 15th.

size(300,300);

float x = 15;

float w = 300;

// w = sketch width.

float h = 300;

// h = sketch height.

fill(255,0,0);

ellipse(w/2,h/2,3*x,3*x);

fill(255,255,0);

ellipse(w/2 + 100,h/2,60,60);

fill(0,200,0);

rectMode(CENTER);	
  
rect(w/x,h/2,80,80);

strokeWeight(2);

stroke(255,165,0);

line(w/1.5,105,w/1.5,105 + 6*x);

float a = 100;

//a = x-coordinate

float b = 150;

//b = y-coordiante

x = 4*x;

x = x/2;

strokeWeight(0);

stroke(0,0,0);

fill(0,50,100);

triangle(a - x,b + x,a,b - x,a + x,b + x);



	








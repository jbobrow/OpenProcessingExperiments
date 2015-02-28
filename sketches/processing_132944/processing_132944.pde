
size(640, 640);

float headX = width/2+150;
float headY = height/2;
background(255, 204, 0);

noStroke();
fill(#E5B4A7);
rectMode(CENTER);
//hår
fill(#5A372E);
rect(headX, headY, 155, 205, 55, 55, 30, 30);

//fjæs
fill(#E5B4A7);
rect(headX, headY, 150, 200, 55, 55, 30, 30);

//skæg
fill(#5A372E);
rect(headX, headY+65, 160, 85, 5, 5, 65, 65);
fill(#E5B4A7);
ellipse(headX, headY+10, 150, 150);
fill(#5A372E);
ellipse(headX, headY+65, 100, 55);
fill(#E5B4A7);
ellipse(headX, headY+75, 80, 35);



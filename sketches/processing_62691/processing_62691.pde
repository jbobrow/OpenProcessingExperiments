
size(500,500);
smooth();

float xpos = width/2;
float ypos = height/2;

//head
fill(#727272);
noStroke();
ellipse (xpos, ypos, 300, 300);

//left eye
fill(#FFFFFF);
ellipse(xpos-50, ypos-40, 20, 30);

//left eyebrow
noFill();
stroke(#FFFFFF);
strokeWeight(2);
arc(xpos-50, ypos-50, 100,100, radians(210), radians(240));

//right eye
fill(#FFFFFF);
ellipse(xpos+50, ypos-40, 20, 40);

//smile
noFill();
stroke(#FFFFFF);
strokeWeight(2);
float startAngle = radians(20);
float stopAngle = radians(90);

arc(xpos, ypos, 100,100, startAngle, stopAngle);


//Draw a smilyface, relative to xpos, ypos




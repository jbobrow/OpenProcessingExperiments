
size(500, 500);
smooth();
background(254,255,0);
 
//black outer eyes

noFill();
strokeWeight(6);
arc(170, 150, 40, 40,  radians(10),radians(180));  // upper half of circle
arc(330, 150, 40, 40,  radians(-10),radians(180));  // upper half of circle

line(130,90, 200,130);
line(300, 130, 370,90) ;


 
//nose
strokeWeight(1);
fill(0);
triangle(240,200, 267,200, 254,212);

//cheeks
fill(255,9,0);
stroke(255,84,38);
ellipse(100,200,75,75);
ellipse(400,200,75,75);



//mouth = filled in arc
noFill();
stroke(0);

arc(270, 202, 40, 40,  radians(0),radians(190));  // upper half of circle
arc(240, 202, 40, 40,  radians(40),radians(190));  // upper half of circle





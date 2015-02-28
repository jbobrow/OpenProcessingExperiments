
// homework 1
// copyright Eric Mackie August 2011 Pittsburgh, PA 15221
size(400,400);
background(13, 35, 95);
smooth();
// E shading
noStroke();
fill(203, 185, 185);
rect(76,0, 5,150);
noFill();
stroke(203, 185, 185);
strokeWeight(5);
arc(54,183, 70,90, PI/2, TWO_PI-PI/4);
arc(54,273, 70,90, PI/6, TWO_PI-PI/2);
// E
noStroke();
fill(255, 255, 255);
rect(80,0, 5,150);
noFill();
stroke(255, 255, 255);
strokeWeight(5);
arc(57,180, 70,90, PI/2, TWO_PI-PI/4);
arc(57,270, 70,90, PI/6, TWO_PI-PI/2);
// D/delta shading
noStroke();
fill(203, 185, 185);
triangle(397,278, 273,278, 337,143);
// D/delta
noStroke();
fill(255,255,255);
triangle(400,275, 280,275, 340,140);
fill(13, 35, 95);
triangle(397,272, 283,272, 340,147);
fill(203,185,185);
triangle(382,268, 292,268, 337,163);
fill(255,255,255);
triangle(385,265, 295,265, 340,160);
// M shading
fill(203,185,185);
rect(67,53, 97,53);
rect(67,303, 97,53);
rect(262,102, 37,204);
rect(227,53, 97,53);
rect(227,303, 97,53);
quad(107,103, 158,103, 197,203, 197,253);
quad(237,103, 287,103, 197,253, 197,203);
rect(92,103, 37,204);
// M
fill(255,255,255);
strokeWeight(1);
rect(70,50, 100,50);
rect(70,300, 100,50);
rect(265,99, 40,201);
noStroke();
rect(230,50, 100,50);
rect(230,300, 100,50);
quad(110,100, 160,100, 200,200, 200,250);
quad(240,100, 290,100, 200,250, 200,200);
rect(95,100, 40,201);












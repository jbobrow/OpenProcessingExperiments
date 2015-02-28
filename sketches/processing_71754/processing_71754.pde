

// 9/17/2012
// Intro to Creative Programming 2012
// Assignment 1
// written by August Park

//background
size(640,360);
// objects in background
strokeWeight(1);
rect(480,30,10,10);
rect(249,147,10,10);
rect(45,78,10,10);
rect(153,369,10,10);
rect(583,247,10,10);
rect(120,300,10,10);
triangle(300+100,300-200,290+100,310-200,310+100,310-200);
triangle(100+65,100+65,90+65,110+65,110+65,110+65);
triangle(300-34+100+70,300-34,290-34+100+70,310-34,310-34+100+70,310-34);
triangle(300+200,300+30,290+200,310+30,310+200,310+30);
triangle(600,300-250,590,310-250,610,310-250);

// hat
fill(245,238,35);
quad(155,206, 87,80, 203,55, 266,95);
beginShape();
vertex(87,80);
vertex(51,244);
vertex(135,145);
endShape();
fill(255);
ellipse(51,244,30,30);

//spring
noFill();
strokeWeight(5);
beginShape();
vertex(261,250);
vertex(345,181);
vertex(285,259);
vertex(373,207);
vertex(289,274);
vertex(382,253);
vertex(292,291);
vertex(391,300);
vertex(293,328);
vertex(391,333);
vertex(291,351);
vertex(391,360);
endShape();
fill(255);
strokeWeight(1);

//face
ellipse(232,173,167,167);
arc(215,160,114,160,0,HALF_PI);
fill(255,0,0);
ellipse(203,197,50,50); //nose
fill(255,200,200);
ellipse(191,187,14,14); //highlight

//eyes
strokeWeight(3);
line(156,200,173,184);
line(154,181,173,201);
line(206,151,227,130);
line(203,127,227,152);




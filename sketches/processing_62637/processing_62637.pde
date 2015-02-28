
/*
ACCD Summer 2012
ID02
1b Face
Charlene Chen
05/25/2012
*/

size(600,600);
smooth();

background(0);

//face
fill(255);
noStroke();
rect(100,30,400,400);

//mouth
rect(100,520,400,50);

//nose
fill(0);
rect(270,390,20,40);
rect(310,390,20,40);

//eyebrows
stroke(0);
strokeCap(SQUARE);
strokeWeight(20);
line(99,230, 300,230);
line(300,80, 500,80);

//eyes
fill(255);
strokeWeight(9);
rect(100,250, 150,10);
rect(350,100, 200,250);



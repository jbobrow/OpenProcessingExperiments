
//Kairavi Chahal | kchahal
//Homework 1 | September 3, 2013

//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

size(400, 400);
background(#FFFFFF);

//Lines
noFill();
stroke(#3CC656);
strokeWeight(4);

line(0, 20, 400, 120);
line(0, 120, 400, 40);
line(0, 280, 400, 160);
line(0, 40, 400, 80);
line(0, 160, 400, 20);
line(0, 200, 400, 280);
line(0, 80, 400, 0);
line(0, 0, 400, 240);
line(0, 240, 400, 400);
line(0, 360, 400, 200);
line(0, 400, 400, 260);
line(0, 320, 400, 320);

line(80, 0, 120, 400);
line(160, 0, 400, 400);
line(280, 0, 240, 400);
line(20, 0, 40, 400);
line(400, 0, 280, 400);
line(320, 0, 320, 400);
line(120, 0, 20, 400);
line(240, 0, 200, 400);
line(40, 0, 0, 400);
line(360, 0, 160, 400);
line(200, 0, 80, 400);
line(0, 0, 400, 400); 

//Letters
noStroke();
fill(50);

//K
rect(10, 110, 40, 175);
quad(10, 200, 150, 75, 180, 110, 50, 220);
quad(90, 285, 113, 240, 50, 185, 50, 245);

//C
quad(220, 110, 390, 110, 390, 150, 240, 150);
quad(290, 245, 390, 245, 390, 285, 310, 285);
quad(220, 110, 310, 285, 330, 245, 280, 150);

//A
stroke(#30A2FC);
strokeWeight(7);
fill(#FF0000, 80);
triangle(200, 100, 100, 300, 300, 300);



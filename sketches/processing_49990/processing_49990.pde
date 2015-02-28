
//Homework 2 Initials using Vertices
//Tyler Porten(tporten)Copyright 2012

size(400, 400);
smooth();
background(255, 57, 196);
float x, y, wd, ht;
x = 100;
y = 100;
wd = 200;
ht = 200;


stroke(255, 23, 136);
strokeWeight(1);
line(25, 0, 25, 400);
line(0, 375, 400, 375);
strokeWeight(2);
line(50, 0, 50, 400);
line(0, 350, 400, 350);
strokeWeight(3);
line(75, 0, 75, 400);
line(0, 325, 400, 325);
strokeWeight(4);
line(100, 0, 100, 400);
line(0, 300, 400, 300);
strokeWeight(5);
line(125, 0, 125, 400);
line(0, 275, 400, 275);
strokeWeight(6);
line(150, 0, 150, 400);
line(0, 250, 400, 250);
strokeWeight(7);
line(175, 0, 175, 400);
line(0, 225, 400, 225);
strokeWeight(8);
line(200, 0, 200, 400);
line(0, 200, 400, 200);
strokeWeight(9);
line(225, 0, 225, 400);
line(0, 175, 400, 175);
strokeWeight(10);
line(250, 0, 250, 400);
line(0, 150, 400, 150);
strokeWeight(11);
line(275, 0, 275, 400);
line(0, 125, 400, 125);
strokeWeight(12);
line(300, 0, 300, 400);
line(0, 100, 400, 100);
strokeWeight(13);
line(325, 0, 325, 400);
line(0, 75, 400, 75);
strokeWeight(14);
line(350, 0, 350, 400);
line(0, 50, 400, 50);
strokeWeight(15);
line(375, 0, 375, 400);
line(0, 25, 400, 25);

stroke(255, 49, 49);
strokeWeight(5);
fill(255, 144, 205);
ellipse(x+wd*.5, y+ht*.5, wd, ht);


//letter T
stroke(255, 49, 49);
strokeWeight(6);
beginShape();
  curveVertex(x+wd*.1, y+ht*.2);
  curveVertex(x+wd*.2, y+ht*.2);
  curveVertex(x+wd*.35, y+ht*.22);
 
  curveVertex(x+wd*.5, y+ht*.25);
  curveVertex(x+wd*.6, y+ht*.28);
  curveVertex(x+wd*.75, y+ht*.35);
  curveVertex(x+wd*.8, y+ht*.4);
  endShape();
  
beginShape();
  curveVertex(x+wd*.45, y+ht*.2);
  curveVertex(x+wd*.45, y+ht*.25);
  curveVertex(x+wd*.45, y+ht*.25);
  curveVertex(x+wd*.4, y+ht*.325);
  curveVertex(x+wd*.35, y+ht*.4);
  curveVertex(x+wd*.3, y+ht*.5);
  curveVertex(x+wd*.275, y+ht*.55);
  curveVertex(x+wd*.25, y+ht*.6);
endShape();

//letter W
beginShape();
  curveVertex(x+wd*.1, y+ht*.475);
  curveVertex(x+wd*.12, y+ht*.5);
  curveVertex(x+wd*.09, y+ht*.55);
  curveVertex(x+wd*.125, y+ht*.6);
  curveVertex(x+wd*.17, y+ht*.6);
  curveVertex(x+wd*.2, y+ht*.59);
  curveVertex(x+wd*.25, y+ht*.575);
  curveVertex(x+wd*.25, y+ht*.65);
  curveVertex(x+wd*.275, y+ht*.7);
  curveVertex(x+wd*.325, y+ht*.75);
  curveVertex(x+wd*.4, y+ht*.775);
  curveVertex(x+wd*.45, y+ht*.75);
  curveVertex(x+wd*.5, y+ht*.7);
  curveVertex(x+wd*.525, y+ht*.65);
endShape();

//letter P

beginShape();
  curveVertex(x+wd*.2, y+ht*.55);
  curveVertex(x+wd*.15, y+ht*.62);
  curveVertex(x+wd*.125, y+ht*.65);
  curveVertex(x+wd*.12, y+ht*.7);
  curveVertex(x+wd*.15, y+ht*.75);
  curveVertex(x+wd*.225, y+ht*.74);
  curveVertex(x+wd*.275, y+ht*.7);
  curveVertex(x+wd*.3, y+ht*.65);
endShape();

beginShape();
  curveVertex(x, y+ht*.45);
  curveVertex(x+wd*.025, y+ht*.5);
  curveVertex(x+wd*.09, y+ht*.53);
  curveVertex(x+wd*.15, y+ht*.6);
endShape();

//saveFrame();


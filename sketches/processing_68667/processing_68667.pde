
//Robert Wohlforth rwohlfor
//Copyright Pittsburgh 2012

size(400, 400);

//Background Colors:
background(#1D7373);
noStroke();
fill(#5CCCCC);
beginShape();
vertex(200, 0);
vertex(325+25/3, 400);
vertex(400,400);
vertex(400,0);
endShape(CLOSE);

//Letter R:
stroke(0);
fill(#BF3030);
beginShape();
vertex(25, 25);
vertex(25, 400);
vertex(50, 400);
vertex(50, 175);
vertex(125, 400);
vertex(150, 400);
vertex(75, 175);
vertex(75, 150);
vertex(50, 150);
vertex(50, 50);
vertex(75, 50);
vertex(75, 25);
endShape(CLOSE);
stroke(0);
arc(75, 100, 250, 150, -PI/2, PI/2);
fill(#1D7373);
arc(75, 100, 200, 100, -PI/2, PI/2);

//First Letter W:
fill(#FF7373);
beginShape();
vertex(50, 175);
vertex(75, 175);
vertex(100, 250);
vertex(150, 200);
vertex(175, 200);
vertex(175+50/3, 250);
vertex(400, 25+50/3);
vertex(400, 75);
vertex(200, 275);
vertex(175, 275);
vertex(150+25/3, 225);
vertex(100+25/3, 275);
vertex(75+25/3, 275);
endShape(CLOSE);

//Second Letter W:
fill(#86B32D);
beginShape();
vertex(200, 275);
vertex(175, 275);
vertex(200+25/3, 375);
vertex(225+25/3, 375);
vertex(275+25/3, 325);
vertex(300, 375);
vertex(325, 375);
vertex(400, 300);
vertex(400, 250+50/3);
vertex(300+50/3, 350);
vertex(300, 300);
vertex(275, 300);
vertex(225, 350);
endShape(CLOSE);




//Background----------
size (575,480) ;
background (61,61,73);


//>>FIGUREN-------------
fill(5);
ellipse(390,75,60,140);

noStroke();
fill(61,61,73);
rect (305,3,85,170);

g.stroke = true;

strokeWeight(10);
noFill();
stroke(204, 5, 0);
arc(200, 60, 300, 200, 0, PI/2);
stroke(250, 200, 20);
arc(205, 70, 200, 100, 0, PI/2);
stroke(0);
strokeWeight(7);
arc(195, 170, 200, 210, TWO_PI-PI/2, TWO_PI);
arc(190, 190, 180, 200, TWO_PI-PI/2, TWO_PI);
strokeWeight(1.5);

fill(220,170,5);
ellipse(100,225,130,130);

fill(220,170,5);
ellipse(100,225,130,130);

fill(190,195,200);
ellipse(210,270,180,180);

fill(235,135,0);
rect (235,275,70,60);

fill(150,135,200);
rect (235,275,25,30);

fill(215,194,115);
rect (260,275,15,30);

fill(5);
rect (260,305,15,30);

fill(200,0,0);
rect (275,305,30,30);

fill(235,135,0);
rect (260,245,15,30);

fill(200,0,0);
rect (235,365,100,30);

//-----
fill(0,0);
ellipse(210,270,180,180);
//Kreis blau
fill(100,180,220);
ellipse(405,223,90,90);
fill (45,160,55) ;
arc(405, 223, 90, 90, TWO_PI-PI/2, TWO_PI);
arc(405, 223, 90, 90, PI, TWO_PI-PI/2);
//--------
fill(0);
ellipse(210,270,85,85);
fill(5);
rect (0,210,520,25);
rect (216,35,11,445);
rect (105,140,10,220);
rect (390,80,30,215);



//>Würfel----------
g.stroke = true;
strokeWeight (1.5) ;
fill (5);
rect (300,275,120,120);

fill (163,195,211);
rect (300,275,30,30);

fill (215,0,0);
rect (360,275,30,30);

fill (220,220,220);
rect (300,335,30,30);

fill (215,0,0);
rect (330,335,30,30);

fill (215,175,30);
rect (300,365,30,30);

fill (215,194,120);
rect (330,305,30,30);

fill (30,110,200);
rect (360,305,30,30);

fill (220,220,220);
rect (390,305,30,30);

fill (50,100,10);
rect (390,335,30,30);

fill (60,160,225);
rect (360,365,30,30);

fill (215,175,30);
rect (390,365,30,30);

//-----------------------



strokeWeight (0) ;
fill (5);
rect (300,275,7,180);

fill (200,0,0);
beginShape();
vertex(104, 160);
vertex(104, 139);
vertex(115, 139);
vertex(115, 161);
endShape(CLOSE);

beginShape();
vertex(104, 361);
vertex(104, 290);
vertex(115, 288);
vertex(115, 361);
endShape(CLOSE);

fill (200,0,0,220) ;
arc(106, 230, 120, 120, 0, PI/2);
fill (121,185,221) ;
arc(106, 220, 120, 120, TWO_PI-PI/2, TWO_PI);
fill(5);
rect (105,140,10,220);
rect (0,210,520,25);
fill (200,0,0);

beginShape();
vertex(104, 160);
vertex(104, 139);
vertex(115, 139);
vertex(115, 161);
endShape(CLOSE);

beginShape();
vertex(104, 361);
vertex(104, 290);
vertex(115, 288);
vertex(115, 361);
endShape(CLOSE);

fill(85);
beginShape();
vertex(166, 235);
vertex(166, 210);
vertex(276, 210);
vertex(285, 220);
vertex(292, 235);
endShape(CLOSE);

fill(40,150,210);
beginShape();
vertex(390, 210);
vertex(390, 181);
vertex(400, 180);
vertex(410, 179);
vertex(420, 181);
vertex(420, 210);
endShape(CLOSE);

fill(220);
beginShape();
vertex(390, 275);
vertex(390, 264);
vertex(400, 267);
vertex(410, 267);
vertex(420, 264);
vertex(420, 275);
endShape(CLOSE);

fill(5);
rect (216,35,11,445);

//-----Oben links
fill(5);
rect (36,43,108,84);
//Braun
fill(200,130,80);
rect (36,43,24,12);

fill(200,130,80);
rect (48,115,12,12);

fill(200,130,80);
rect (60,91,24,12);

fill(200,130,80);
rect (108,91,12,12);

fill(200,130,80);
rect (120,115,12,12);

fill(200,130,80);
rect (108,55,12,24);

fill(200,130,80);
rect (96,79,12,12);
//Dunkel blau
fill(120,140,200);
rect (60,55,24,24);

fill(120,140,200);
rect (132,55,12,24);

fill(120,140,200);
rect (48,103,12,12);

fill(120,140,200);
rect (84,103,12,12);

fill(120,140,200);
rect (96,115,12,12);

//beige

fill(205,185,135);
rect (84,79,12,12);

fill(205,185,135);
rect (96,91,12,12);

fill(205,185,135);
rect (60,115,24,12);

fill(205,185,135);
rect (36,79,12,12);

fill(205,185,135);
rect (120,43,12,12);

//rot

fill(220,0,0);
rect (120,79,12,12);

fill(220,0,0);
rect (108,115,12,12);

fill(220,0,0);
rect (84,43,12,12);

fill(220,0,0);
rect (48,79,12,12);

//Gelb

fill(230,190,20);
rect (60,43,24,12);

fill(230,190,20);
rect (84,115,12,12);

fill(230,190,20);
rect (132,91,12,12);

//hellblau

fill(100,165,200);
rect (120,103,12,12);

fill(100,165,200);
rect (132,115,12,12);

//white

fill(210,210,210);
rect (132,43,12,12);

fill(210,210,210);
rect (36,103,12,12);

//Rest

fill(200,160,160);
rect (48,91,12,12);

fill(200,160,160);
rect (96,55,12,24);

fill(200,160,160);
rect (96,103,12,12);

///////////////////















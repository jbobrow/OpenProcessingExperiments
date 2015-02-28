
//Lei Zhao(Elaine)
//DESMA28 SUMMER 2012

size(640,360);
background(232,224,201);
smooth();
noStroke();

//black rec
fill(40);
quad(233,17,244,58,63,102,53,56);

//light brown rec
fill(167,152,148);
fill(155,128,124,200);
stroke(180);
beginShape();
vertex(308,313);
vertex(364,351);
vertex(341,360);
vertex(255,360);
vertex(160,360);
endShape(CLOSE);

//small yellow triangle
fill(223,206,152,200);
stroke(200);
triangle(363,351,363,360,339,360);

//blue rec
fill(109,155,199);
stroke(170);
beginShape();
vertex(0,97);
vertex(215,45);
vertex(290,350);
vertex(255,360);
vertex(0,360);
endShape(CLOSE);

noFill();

//blue arc
strokeWeight(60);
stroke(109,155,199);
strokeCap(SQUARE);
arc(88,20,550,450,radians(10),radians(45));

//white arc
strokeWeight(60);
stroke(206,202,189);
strokeCap(SQUARE);
arc(67,10,550,450,radians(-60),radians(35));

//red arc
strokeWeight(50);
stroke(212,42,31);
strokeCap(SQUARE);
arc(40,-10,550,450,radians(15),radians(80));

//red rec
fill(218,68,54);
strokeWeight(1);
stroke(140);
beginShape();
vertex(91,237);
vertex(108,319);
vertex(0,335);
vertex(0,259);
endShape(CLOSE);

//black circle
fill(35);
noStroke();
ellipse(10,418,200,200);

//white bar mid
fill(230,221,197,200);
strokeWeight(1);
stroke(180);
beginShape();
vertex(6,337);
vertex(466,232);
vertex(469,240);
vertex(8,347);
endShape(CLOSE);

//red bar mid
fill(212,42,31,220);
strokeWeight(0.5);
stroke(120);
beginShape();
vertex(8,347);
vertex(469,240);
vertex(470,246);
vertex(9,352);
endShape(CLOSE);

//brown bar wide
fill(223,206,152);
strokeWeight(0.5);
stroke(240);
beginShape();
vertex(428,78);
vertex(462,67);
vertex(640,208);
vertex(640,252);
endShape(CLOSE);

//brown bar long
fill(181,151,91);
noStroke();
beginShape();
vertex(463,60);
vertex(640,202);
vertex(640,208);
vertex(462,67);
endShape(CLOSE);

//brown bar short
fill(74,61,52);
noStroke();
beginShape();
vertex(463,60);
vertex(462,67);
vertex(428,78);
vertex(429,71);
endShape(CLOSE);

//black bar long
fill(25,25,25,225);
noStroke();
beginShape();
vertex(144,285);
vertex(640,171);
vertex(640,180);
vertex(147,294);
endShape(CLOSE);

//white bar top
fill(230,221,197,240);
strokeWeight(0.5);
stroke(150);
beginShape();
vertex(384,179);
vertex(640,137);
vertex(640,143);
vertex(391,184);
endShape(CLOSE);

//red bar top
fill(212,42,31,200);
strokeWeight(0.5);
stroke(120);
beginShape();
vertex(391,184);
vertex(640,143);
vertex(640,152);
vertex(392,193);
endShape(CLOSE);

//black bar small
fill(25,25,25,225);
noStroke();
beginShape();
vertex(384,179);
vertex(391,184);
vertex(392,193);
vertex(386,189);
endShape(CLOSE);

//white bar bottom
fill(230,221,197,240);
strokeWeight(0.5);
stroke(150);
beginShape();
vertex(307,333);
vertex(403,309);
vertex(408,312);
vertex(312,336);
endShape(CLOSE);

//red bar bottom
fill(212,42,31,200);
strokeWeight(0.5);
stroke(120);
beginShape();
vertex(408,312);
vertex(408,315);
vertex(312,340);
vertex(312,337);
endShape(CLOSE);

//white piece small
fill(330,221,197);
noStroke();
beginShape();
vertex(307,333);
vertex(312,337);
vertex(312,341);
vertex(307,337);
endShape(CLOSE);


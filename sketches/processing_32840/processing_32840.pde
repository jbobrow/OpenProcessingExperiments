
PFont picassoFont;

//set up canvas&smoothing
size(298,155);
background(245,244,239);
smooth();

//blue block
noStroke();
fill(0,90,150);
beginShape();
vertex(0,0);
vertex(60,0);
vertex(60,100);
vertex(0,155);
endShape(CLOSE);

//yellow block
fill(247,206,36);
beginShape();
vertex(0,155);
vertex(60,100);
vertex(180,40);
vertex(298,100);
vertex(298,155);
endShape();

//red block
fill(218,80,50);
beginShape();
vertex(60,0);
vertex(120,0);
vertex(150,20);
vertex(60,100);
endShape(CLOSE);

//Watch
//Wrist
fill(247,206,36);
beginShape();
vertex(215,10);
vertex(245,10);
vertex(248,40);
vertex(215,40);
vertex(215,20);
endShape(CLOSE);
//watch face
fill(255);
stroke(184,182,173);
strokeWeight(2.5);
ellipse(230,0,35,35);
//dots
noStroke();
fill(184,182,173);
ellipse(221,7,4,4);
ellipse(223,8,3,3);
ellipse(229,11,4,4);
ellipse(238,9.5,3,4);
ellipse(239,8.5,2,2);
ellipse(241,0,3,3);
ellipse(230,0,3.5,3.5);

//green block
noStroke();
fill(89,132,72);
beginShape();
curveVertex(150,20);
curveVertex(150,20);
curveVertex(200,30);
curveVertex(280,30);
curveVertex(298,36);
curveVertex(298,66);
vertex(298,102);
curveVertex(500,50);
curveVertex(298,97);
curveVertex(148,95);
curveVertex(228,95);
curveVertex(60,100);
curveVertex(60,120);
endShape(CLOSE);

//black straight lines
stroke(0);
strokeWeight(4);
line(60,0,60,100);
strokeWeight(3);
line(0,155,65,94);
line(65,94,150,20);
//thickness
noFill();
strokeWeight(3);
beginShape();
curveVertex(62,-10);
curveVertex(62,0);
curveVertex(63,94);
curveVertex(140,10);
endShape();

//black curved line
strokeWeight(3);
noFill();
beginShape();
curveVertex(120,0);
curveVertex(120,0);
curveVertex(150,20);
curveVertex(150,20);
curveVertex(200,30);
curveVertex(280,30);
curveVertex(310,36);
curveVertex(278,36);
endShape();
//thickness
strokeWeight(4);
beginShape();
curveVertex(110,0);
curveVertex(120,0);
curveVertex(160,22);
curveVertex(220,42);
endShape();


//zigzags
strokeWeight(3);
stroke(232,143,63);

line(38,133,63,133);
line(63,133,63,115);
line(64,115,88,115);
line(88,115,88,133);
line(88,135,112,134);
line(112,134,112,117);
line(112,117,143,117);
line(143,117,143,135);
line(143,135,193,136);
line(172,136,172,117);
line(172,117,202,117);
line(202,117,204,137);
line(204,137,230,137);
line(230,137,229,120);
line(212,120,255,121);
line(255,121,255,138);
line(256,138,282,137);
line(282,137,281.5,123.5);
line(282,123,320,123);

//create & print title
picassoFont = createFont("garamond",20,true);
textFont(picassoFont);
fill(255);
text("Seated Woman",170,55);
text("with Wrist Watch",150,77);

//create & print subtitle
picassoFont = createFont("myraid",10,true);
textFont(picassoFont);
fill(0);
text("1932 - Oil on canvas",186,92);






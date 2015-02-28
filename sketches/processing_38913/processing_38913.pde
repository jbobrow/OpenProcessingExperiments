
size(500,500);
smooth();
background(221, 217, 179);

//sketch area
int totalPts = 400;
float steps = 100;
stroke(0);
float rand = 20;

for  (int i = 1; i < steps; i++){
  point( (700/steps) * i, (700/2) + random(-rand, rand) );
  rand += random(-5, 5);
}


//black boxes
fill(0);
noStroke();
quad(394,97, 396,340, 202,309, 268,177);
quad(280,354, 413,355, 406,463, 277,502);


//teal large shapes
fill(174, 184, 174);
noStroke();
triangle(0,0, 470,0, 0,584);

fill(174, 184, 174);
beginShape();
vertex(0,645);
curveVertex(196,550);
curveVertex(276,499);
curveVertex(355,436);
curveVertex(415,381);
curveVertex(541,250);
curveVertex(634,129);
vertex(729,0);
vertex(1321,0);
curveVertex(1284,48);
curveVertex(1149,186);
curveVertex(999,327);
curveVertex(849,457);
curveVertex(598,616);
curveVertex(462,679);
curveVertex(363,711);
curveVertex(214,742);
curveVertex(138,750);
vertex(0,754);
endShape();

//dark tan box
fill(#a19c88);
quad(17,534, 182,534, 182,665, 17,665);

//red shapes
fill(#c33232);
beginShape();
vertex(0,476);
vertex(155,476);
vertex(155,539);
vertex(46,539);
vertex(46,625);
vertex(0,625);
endShape();

beginShape();
vertex(386,510);
vertex(567,510);
vertex(567,556);
vertex(435,556);
vertex(435,645);
vertex(383,645);
endShape();

quad(100,619, 100,563, 287,563, 287,619);


//black strokes
stroke(0);
strokeWeight(3);
line(0,21, 205,0);
line(0,301, 1206,180);
line(1,397, 0,640);
line(58,390, 51,640);
line(1,433, 57,436);
line(302,372, 302,641);
line(360,377, 360,628);
line(305,418, 358,418);
line(620,408, 620,608);
line(678,411, 673,608);
line(949,298, 949,591);
line(1007,291, 1007,583);
line(1105,171, 1093,363);
line(1093,363, 1076,404);
line(1076,404, 1068,859);
line(1130,386, 1120,860);
line(1284,244, 1284,539);
line(1338,237, 1338,536);
line(1284,364, 1338,364);
line(1490,128, 1498,556);
line(1500,556, 1130,670);
line(0,476, 1499,351);
line(0,583, 1499,487);
line(0,700, 1499,637);
line(0,819, 1499,778);
line(0,936, 1119,906);
line(504,909, 1499,876);
line(0,1141, 1499,1167);
line(0,1386, 1499,1377);
line(0,1497, 1499,1474);

//blue trapezoid
fill(41, 79, 149);
noStroke();
quad(180,193, 384,204, 276,376, 101,366);

//blue stroke
stroke(41, 79, 149);
strokeWeight(4);
line(0,343, 811,0);

// green triangles
fill(#23513a);
noStroke();
triangle(651,189, 695,408, 550,403);

//transparent objs
fill(#fac132);
ellipse(750,403, 155,78);
fill(#d4e0da, 225);
quad(646,361, 824,358, 825,388, 647,393);
fill(#2c4d92, 225);
quad(649,422, 824,420, 825,447, 647,456);

//red curve lines
noFill();
stroke(205, 67, 65);
strokeWeight(4);
bezier(0, 273, 877, 381, 1700, 680, 1483, 1128);
bezier(712, 0, 1550, 298, 1600, 800, 1108, 1256);

//line(0, 273, 877, 381);
//ellipse(877, 381, 1483, 864);
//line(1700, 680, 1483, 1128);
//ellipse(1483, 1128, 1483, 864);


//red top corner shape
fill(205, 67, 65);
noStroke();
beginShape(POLYGON);

vertex(368,0);
vertex(316,34);
vertex(316,47);
vertex(334,47);
vertex(386,10);
vertex(408,18);
vertex(425,10);
vertex(476,47);
vertex(495,47);
vertex(495,34);
vertex(442,0);

endShape();

ellipse(405,0, 50,40);


// green triangles
fill(#00916c);
triangle(318,410, 384,364, 386,453);


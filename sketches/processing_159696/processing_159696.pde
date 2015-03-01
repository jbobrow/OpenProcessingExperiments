
//water background
background(102,229,145);
size(640,640);
smooth();

//fish face, whole
noStroke();
fill(242,100,29);
beginShape();
curveVertex(257,375);
curveVertex(257,375);
curveVertex(317,200);
curveVertex(377,375);
curveVertex(257,375);
curveVertex(317,200);
curveVertex(257,375);
endShape();


//fish face, mask
noStroke();
fill(254,255,13);
//rect(285, 280, 76, 50);
beginShape();
curveVertex(285,335);
curveVertex(285,335);//1
curveVertex(275,330);//2
curveVertex(285,315);//3
curveVertex(275,305);//4
curveVertex(285,295);//5
curveVertex(300,285);//6
curveVertex(300,280);//7
curveVertex(305,276);//8 
curveVertex(320,270);//9 midpoint
curveVertex(335,276);//10
curveVertex(340,280);//11 
curveVertex(340,285);//12
curveVertex(355,295);//13
curveVertex(365,305);//14
curveVertex(355,315);//15
curveVertex(365,330);//16
curveVertex(355,335);//17
curveVertex(355,335);//18
curveVertex(285,335);//19
endShape();
triangle(312,264,319,334,326,264);

//fish eyes
stroke(142,269,185);
strokeWeight(3);
fill(0);
ellipse(278, 303, 7, 12);
ellipse(360, 303, 7, 12);

//fish "nose"
noStroke();
fill(292,150,79);
ellipse(319, 324, 15, 22);

//fish mouth
noStroke();
fill(254,255,13);
triangle(312,346,319,334,326,346);

//fish top fin, aka hat
noStroke();
fill(254,255,13);
triangle(310,194,319,224,326,194);
rect(308,192,18,7);

//fish, lower gut
noStroke();
fill(254,255,13);
ellipse(293, 378, 30, 34);
ellipse(347, 378, 30, 34);
noStroke();
fill(242,100,29);
ellipse(293, 368, 38, 46);
ellipse(347, 368, 38, 46);
rect(307,395,22,7);

//fish bottom fins
noStroke();
fill(254,255,13);
beginShape();
curveVertex(328,390);
curveVertex(328,390);
curveVertex(338,413);
curveVertex(335,423);
curveVertex(330,413);
curveVertex(330,393);
curveVertex(328,390);
endShape();
beginShape();
curveVertex(309,390);
curveVertex(309,390);
curveVertex(299,413);
curveVertex(302,423);
curveVertex(307,413);
curveVertex(307,393);
curveVertex(309,390);
endShape();

//fish right fin and left
noStroke();
fill(254,255,13);
ellipse(398, 337, 56, 32);
ellipse(240, 337, 56, 32);
fill(102,229,145);
ellipse(224, 337, 56, 32);
ellipse(414, 337, 56, 32);





//ZACH SPITULSKI
// DESMA 28 [INTERACTIVITY]
// September 30th, 2010


//-----------------------------------------------------SET-UP

size(640,480);
background(196,203,183);
smooth();

color orange = color(233,117,55,230);
color blue = color(38,82,164);
color aqua = color(45,113,138);
color yellow = color(232,183,44);
color red = color(206,72,69);

// -----------------------------------------DRAW BACKGROUND ELEMENTS

noStroke();
fill(217,203,182);
rect(0,0,  width, 60);

// draw yellow shape on right side

stroke(190);
fill(yellow);
beginShape();
vertex(215,0);
vertex(405,0);
vertex(480,80);
vertex(565,80);

curveVertex(565,80);
curveVertex(576,100);
curveVertex(585,150);
curveVertex(590,200);
curveVertex(592,215);

vertex(592,215);
vertex(width,215);
vertex(width,320);
vertex(420,430);
vertex(325,440);
vertex(325,410);
vertex(372,375);
vertex(385,375);
vertex(400,310);
vertex(410,310);
vertex(412,240);
vertex(420,240);
vertex(412,180);
vertex(430,175);
vertex(410,120);
vertex(415,117);
vertex(388,78);
vertex(365,90);
vertex(295,23);
vertex(278,40);

endShape(CLOSE);
noStroke();

// ----------------------------------------------DRAW FOREGROUND

fill(orange);
quad(130,30, 225,168,  135,300,   30,175);

//Lines And Arcs

// (blue spear in righthand lower corner)
fill(aqua);
beginShape();

vertex(370,290);
vertex(400,310);
vertex(450,370);

vertex(500,435);
vertex(515,460);
vertex(520,height);
vertex(505,height);
endShape(CLOSE);


// (checkers)
fill(0);
quad(350,418,390,418,390,425,356,425);
quad(345,425,356,425,365,440,352,440);
quad(345,440,352,440,356,450,345,450);
quad(365,440,390,440,390,450,370,450);
quad(356,450,370,450,382,460,362,460);
quad(345,460,362,460,380,474,345,474);
quad(382,460,390,460,390,474,384,462);
quad(380,474,390,474,390,height,385,height);

// (blue spheres on LEFT side of screen, going down)

fill(blue);
ellipse(295,75, 22,22);
ellipse(270,125, 21,21);
ellipse(235,170, 21,21);
ellipse(150,185, 22,22);
ellipse(200,225, 21,21);
ellipse(145,295, 22,22);
ellipse(45,295, 22,22);
ellipse(100,375, 22,22);
ellipse(30,415, 22,22);
fill(aqua);
ellipse(16,470, 15,15);




// (blue spheres on RIGHT side of screen, going down)
fill(blue);
ellipse(430,66,22,22);
ellipse(430,185,22,22);
ellipse(412,256,22,22);
ellipse(383,340,22,22);

fill(aqua);
ellipse(555,440,15,15);


// black lines (straight) from top to bottom

stroke(10);
strokeWeight(2.5);

line(250,13,width,218);
line(110,0,width,300);
line(0,260,width,409);

beginShape();
noFill();
vertex(480,0);
curveVertex(550,40);
curveVertex(700,200);
curveVertex(515,350);
curveVertex(384,400);
curveVertex(330,395);
vertex(300,416);

endShape();



// (Rewrite 2nd blue dot on RIGHT SIDE for layers)
fill(blue);
noStroke();
ellipse(430,185,22,22);

// Red Stuff

fill(red);
ellipse(19,220,18,18);

//Red Curve
beginShape();
stroke(red);
noFill();
vertex(335,0);
curveVertex(335,0);
curveVertex(360,100);
curveVertex(270,240);
curveVertex(240,300);
vertex(170,360);
endShape();

quad(620,50,width,50,width,80,621,52);

//Yellow Lines
stroke(yellow);
line(150,130,220,85);
line(165,145,235,100);
//star
beginShape();
fill(250);
stroke(250);
ellipse(177,125,7,7);
endShape();




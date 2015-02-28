
//Adam Oaks
//Assignment 2.1 - Davis2 Replica
//Computational Methods ARCH 6050
//Jan 20, 2011

size(400,280);
smooth();

//pink
fill(243,214,216);
noStroke();
quad(0,165,155,165,180,280,0,280);

//top left green
fill(75,139,45);
noStroke();
rect(0,0,140,165);

//white quad
fill(255);
noStroke();
quad(35,55,140,0,180,280,35,200);

//right dark green
fill(7,42,18);
noStroke();
quad(140,0,400,0,400,280,180,280);

//dark yellow
fill(220,156,7);
noStroke();
quad(160,145,300,130,400,280,180,280);

//green triangle
fill(0,82,3);
noStroke();
triangle(140,0,300,0,145,30);
triangle(300,0,400,0,400,10);

//lower right white
fill(255);
noStroke();
beginShape();
curveVertex(346,252);
curveVertex(346,252);
curveVertex(346,215);
curveVertex(348,210);
curveVertex(350,205);
curveVertex(350,205);
curveVertex(343,205);
curveVertex(337,208);
curveVertex(333,219);
curveVertex(333,219);
curveVertex(249,219);
curveVertex(249,219);
curveVertex(265,252);
curveVertex(265,252);
endShape();

//middle red
fill(215,3,0);
noStroke();
quad(160,150,245,170,290,235,170,215);

//dark yellow circle
fill(220,156,7);
noStroke();
ellipse(245,185,26,22);

//red line
stroke(217,60,10);
strokeWeight(2.5);
line(145,40,300,35);
line(300,35,300,130);

//dark red line
stroke(131,50,25);
strokeWeight(2);
line(0,0,25,35);
line(25,35,25,165);

//lower red line
stroke(199,90,32);
strokeWeight(1.5);
line(146,263,19,263);
line(19,263,16,180);
line(16,180,21,177);
line(21,177,35,177);

//black line
stroke(0);
noFill();
strokeWeight(1);
line(300,130,295,185);
line(295,185,232,182);

line(346,252,340,246);
line(340,246,340,215);
arc(350,215,20,20,PI, TWO_PI-PI/2);

line(238,195,195,192);
line(246,173,202,173);

noFill();
beginShape();
curveVertex(195,192);
curveVertex(195,192);
curveVertex(190,187);
curveVertex(192,177);
curveVertex(202,173);
curveVertex(202,173);
endShape();

//thin white line
stroke(255);
strokeWeight(1);
line(140,0,165,15);
line(165,15,165,25);
line(165,15,185,5);
line(185,5,185,25);
line(185,5,200,15);
line(200,15,200,20);
line(300,35,300,0);
line(245,35,300,0);

noFill();
beginShape();
curveVertex(300,0);
curveVertex(300,0);
curveVertex(333,20);
curveVertex(370,75);
curveVertex(365,140);
curveVertex(325,170);
curveVertex(325,170);
endShape();

beginShape();
curveVertex(373,122);
curveVertex(373,122);
curveVertex(361,101);
curveVertex(340,85);
curveVertex(328,82);
curveVertex(314,85);
curveVertex(300,92);
curveVertex(300,92);
endShape();

//white shape right
fill(255);
noStroke();
beginShape();
curveVertex(373,122);
curveVertex(373,122);
curveVertex(370,140);
curveVertex(349,164);
curveVertex(309,195);
curveVertex(309,195);
curveVertex(313,197);
curveVertex(313,197);
curveVertex(345,187);
curveVertex(368,175);
curveVertex(371,172);
curveVertex(373,166);
curveVertex(376,158);
curveVertex(384,156);
curveVertex(393,146);
curveVertex(388,134);
curveVertex(387,133);
curveVertex(389,131);
curveVertex(395,131);
curveVertex(400,127);
curveVertex(400,127);
endShape();

//white line
stroke(255);
strokeWeight(1.5);
line(155,40,240,65);
line(240,65,250,100);
line(250,100,160,145);
line(250,100,300,130);
line(243,70,300,55);

//pale yellow
fill(252,232,159);
noStroke();
quad(65,100,65,200,53,195,53,100);
quad(110,85,118,85,118,26,108,22);
quad(135,190,144,183,140,108,130,108);

//orange
fill(237,151,49);
beginShape();
curveVertex(65,260);
curveVertex(65,260);
curveVertex(120,210);
curveVertex(120,210);
curveVertex(120,210);
curveVertex(120,135);
curveVertex(120,135);
curveVertex(125,115);
curveVertex(142,110);
curveVertex(142,110);
curveVertex(156,110);
curveVertex(156,110);
curveVertex(153,85);
curveVertex(153,85);
curveVertex(153,85);
curveVertex(100,85);
curveVertex(70,89);
curveVertex(70,89);
curveVertex(67,91);
curveVertex(65,96);
curveVertex(65,96);
endShape();

//black lines left
stroke(0);
strokeWeight(1);
line(65,118,122,118);
line(102,118,102,172);
line(112,118,112,192);
line(120,191,166,191);
line(108,22,108,16);
line(35,80,93,80);
line(93,80,107,85);
line(85,80,85,70);
line(77,45,108,16);

noFill();
beginShape();
curveVertex(85,70);
curveVertex(85,70);
curveVertex(78,67);
curveVertex(74,61);
curveVertex(75,50);
curveVertex(77,45);
curveVertex(77,45);
endShape();

//blue
fill(117,170,208);
noStroke();
quad(65,120,65,195,120,210,90,125);

//dark quad
fill(5,46,32);
quad(78,145,87,145,98,184,88,184);

//red ellipse
fill(218,81,9);
ellipse(82.5,145,9,6);
ellipse(93,184,10,6);

//yellow right
fill(246,212,1);
beginShape();
curveVertex(285,162);
curveVertex(285,162);
curveVertex(285,162);
curveVertex(235,158);
curveVertex(248,147);
curveVertex(253,131);
curveVertex(249,113);
curveVertex(242,101);
curveVertex(230,97);
curveVertex(224,83);
curveVertex(224,83);
curveVertex(224,83);
curveVertex(289,88);
curveVertex(289,88);
endShape();

//black curve right
noFill();
stroke(0);
strokeWeight(.5);
beginShape();
curveVertex(379,150);
curveVertex(379,150);
curveVertex(385,149);
curveVertex(388,143);
curveVertex(386,138);
curveVertex(386,138);
endShape();

beginShape();
curveVertex(379,150);
curveVertex(379,150);
curveVertex(383,146);
curveVertex(385,143);
curveVertex(386,138);
curveVertex(386,138);
endShape();

//gold
fill(124,99,10);
noStroke();
beginShape();
curveVertex(309,195);
curveVertex(309,195);
curveVertex(313,197);
curveVertex(314,219);
curveVertex(317,240);
curveVertex(319,252);
curveVertex(324,266);
curveVertex(327,280);
curveVertex(309,252);
curveVertex(309,252);
endShape();


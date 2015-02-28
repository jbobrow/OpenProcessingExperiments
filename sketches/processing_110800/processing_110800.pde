
///Eunsil Amy Choi 09/20/2013

size(288,197);
noStroke();

//----------------------------------- left ivory top
fill(240,221,204);
quad(0,0,0,90,49,91,39,0);
//----------------------------------- riht ivory top
fill(240,221,204);
quad(204,0,219,72,288,72,288,0);
//---------------- //---------------- blue body rectangle
fill(52,68,102);
quad(39,0,61,197,240,197,204,0);
//---------------------------------- yellow trianles
fill(238,204,17);
beginShape();
vertex(57,133);
vertex(73,83);
vertex(95,142);
vertex(119,96);
vertex(135,164);
endShape();
beginShape();
vertex(141,168);
vertex(165,119);
vertex(177,192);
vertex(208,165);
vertex(208,197);
vertex(174,197);
endShape();
//---------------- //----------------- right red quad
fill(196,17,0);
quad(219,72,223,92,288,89,288,72);
//---------------- //----------------- right green quad
fill(83,144,112);
quad(223,92,240,197,288,197,288,89);
//---------------- //----------------- left red quad
noStroke();
fill(204,0,0);
quad(0,90,49,91,51,111,0,111);
//------------------------------------ left green quad
noStroke();
fill(83,144,112);
quad(0,111,0,197,61,197,54,113);
stroke(20);
//--------------------------------------- curveVertex
fill(218,141,104);
beginShape();
curveVertex(102,150);
curveVertex(102,150);
curveVertex(101,177);
curveVertex(119,189);
curveVertex(124,197);
curveVertex(154, 197);
curveVertex(150, 176);
curveVertex(150, 176);
endShape();

//--------------------------------------- strokes
strokeWeight(1);
line(246,152,247,155);
line(247,159,245,162);
line(250,159,249,163);
line(253,160,254,163);
line(246,152,247,156);
line(253,151,252,156);
line(257,151,257,154);
line(260,160,259,163);

line(251,160,253,163);
line(278,159,278,162);
line(268,156,267,161);
line(262,152,261,156);



strokeWeight(8);
line(233,113,288,110);
line(235,125,288,121);

strokeWeight(4.5);
line(0,113,51,110);
line(223,92,288,89);

strokeWeight(7.5);
line(39,0,61,196);
line(241,170,288,170);
line(242,179,288,179);
line(244,186,257,196);

strokeWeight(3);
line(3,132,54,129);
line(2,137,57,138);
line(0,156,57,161);

strokeWeight(4);
line(284,184,287,186);
line(263,186,287,196);
line(238,144,288,143);
line(0,182,62,184);

strokeWeight(6);
line(204,0,240,196);
line(238,144,288,143);
line(0,190,7,198);
line(18,189,27,198);
line(30,186,47,198);
noFill();
curve(56,197,56,133,178,197,100,197);

//---------------------------------- triangles left
noStroke();
fill(204,0,0);
beginShape();
vertex(0,57);
vertex(7,76);
vertex(15,30);
vertex(23,52);
vertex(35,0);
vertex(0,0);
endShape();
//--------------------------------- triangles right
beginShape();
vertex(203,0);
vertex(209,13);
vertex(211,0);
vertex(217,0);
vertex(223,29);
vertex(237,0);
vertex(250,36);
vertex(263,8);
vertex(275,22);
vertex(288,7);
vertex(288,0);
endShape();

//--------------------------------- white stroke
strokeWeight(1);
stroke(220);
line(255,86,267,71);
line(267,71,281,85);
line(281,85,287,81);
line(287,81,284,77);
line(284,77,283,72);
line(279,71,280,78);
line(274,85,267,78);
line(267,78,267,87);
line(267,87,287,88);

line(9,25,7,39);
line(2,14,5,43);
line(249,0,248,8);
line(26,0,24,17);
line(22,1,18,23);
line(275,0,273,8);
line(272,0,270,8);
line(257,0,256,4);

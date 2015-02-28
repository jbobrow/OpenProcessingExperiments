
//Lauren Lee
//Divided Painting_Week2
//Feb 7th 2013

size(183, 277);
background(41,143,173);
noStroke();
fill(34,114,120);
rect(0,0,79,277);

//Leaves
noStroke();
fill(71,106,52);
beginShape();
vertex(78,80);
vertex(57,55);
vertex(55,69);
vertex(37,43);
vertex(43,71);
vertex(22,59);
vertex(19,71);
vertex(8,68);
vertex(15,83);
vertex(0,87);
vertex(0,161);
vertex(9,171);
vertex(42,131);
vertex(45,116);
vertex(59,126);
vertex(82,97);
endShape(CLOSE);
beginShape();
vertex(21,31);
vertex(0,58);
vertex(0,0);
vertex(81,0);
vertex(118,20);
endShape(CLOSE);
beginShape();
vertex(155,74);
vertex(153,42);
vertex(158,8);
vertex(172,16);
vertex(183,0);
vertex(183,89);
endShape(CLOSE);
beginShape();
vertex(165,127);
vertex(172,84);
vertex(183,71);
vertex(183,143);
endShape(CLOSE);


//Tree Trunk
fill(82,60,40);
smooth();
stroke(64,49,36);
strokeWeight(5);
strokeJoin(BEVEL);
beginShape();
vertex(131,134);
vertex(175,157);
vertex(163,276);
vertex(137,276);
endShape(CLOSE);
stroke(37,35,34);
strokeWeight(5);
strokeJoin(BEVEL);
line(133,158,168,178);
line(134,178,170,163);
line(133,218,168,178);
line(135,178,169,203);
line(134,237,164,264);
line(135,262,168,219);
line(134,237,169,201);
strokeWeight(4);
fill(255,255,255);
line(174,156,166,276);

//Branches
fill(37,35,34);
noStroke();
beginShape();
vertex(129,131);
vertex(124,123);
vertex(100,144);
vertex(115,120);
vertex(85,122);
vertex(101,112);
vertex(83,112);
vertex(90,101);
vertex(0,117);
vertex(13,102);
vertex(0,91);
vertex(26,99);
vertex(2,80);
vertex(32,88);
vertex(20,68);
vertex(54,86);
vertex(41,53);
vertex(72,81);
vertex(72,56);
vertex(104,95);
vertex(103,79);
vertex(128,105);
vertex(115,70);
vertex(104,55);
vertex(87,69);
vertex(95,41);
vertex(71,52);
vertex(65,99);
vertex(55,54);
vertex(53,27);
vertex(35,54);
vertex(34,27);

vertex(18,60);
vertex(20,30);
vertex(0,39);
vertex(0,0);
vertex(23,18);
vertex(35,18);
vertex(27,0);
vertex(50,0);
vertex(59,12);
vertex(58,0);
vertex(71,15);
vertex(69,0);
vertex(86,19);
vertex(91,0);
vertex(104,17);

vertex(105,2);
vertex(116,26);
vertex(122,16);
vertex(124,35);
vertex(150,87);
vertex(155,69);
vertex(139,43);
vertex(160,50);
vertex(134,27);
vertex(149,31);
vertex(140,16);
vertex(160,33);
vertex(150,4);
vertex(166,27);
vertex(162,5);

vertex(172,18);
vertex(183,0);
vertex(183,65);
vertex(157,126);
vertex(166,119);
vertex(172,99);
vertex(183,93);
vertex(183,157);
vertex(174,160);
endShape(CLOSE);

//Small Branches
noStroke();
fill(116,95,64);
beginShape();
vertex(151,137);
vertex(115,109);
vertex(94,104);
vertex(88,94);
vertex(118,108);
vertex(143,126);
vertex(130,79);
vertex(107,38);
vertex(35,11);
vertex(106,29);
vertex(141,85);
vertex(146,121);
vertex(158,82);
vertex(183,58);
vertex(160,95);
vertex(152,136);
endShape(CLOSE);

//Back Scaffolding
fill(37,35,34);
smooth();
strokeWeight(5);
stroke(37,35,34);
beginShape();
vertex(0,120);
vertex(17,142);
vertex(59,129);
vertex(38,216);
vertex(0,222);
endShape(CLOSE);

//Stairs (yellow)
fill(207,174,57);
noStroke();
beginShape();
vertex(0,226);
vertex(81,213);
vertex(103,275);
vertex(0,276);
endShape(CLOSE);
beginShape();
vertex(51,276);
vertex(58,255);
vertex(61,270);
vertex(64,276);
endShape(CLOSE);


//Stairs (brown)
strokeWeight(10);
stroke(37,35,34);
line(79,215,111,276);
fill(37,35,34);
noStroke();
beginShape();
vertex(0,243);
vertex(62,228);
vertex(94,275);
vertex(0,276);
endShape(CLOSE);

//strairs (white)
noStroke();
fill(216,218,197);
beginShape();
vertex(8,221);
vertex(69,214);
vertex(72,224);
vertex(0,228);
endShape(CLOSE);
beginShape();
vertex(16,276);
vertex(15,237);
vertex(22,276);
endShape(CLOSE);
beginShape();
vertex(31,276);
vertex(35,233);
vertex(60,231);
vertex(62,251);
vertex(51,252);
vertex(51,236);
vertex(35,235);
vertex(40,276);
endShape(CLOSE);
beginShape();
vertex(67,276);
vertex(63,259);
vertex(67,250);
vertex(63,238);
vertex(74,239);
vertex(71,250);
vertex(74,260);
vertex(70,276);
endShape(CLOSE);
beginShape();
vertex(83,276);
vertex(83,256);
vertex(91,276);
endShape(CLOSE);
fill(207,174,57);
noStroke();
beginShape();
vertex(51,276);
vertex(58,255);
vertex(61,270);
vertex(64,276);
endShape(CLOSE);

//Scaffolding
stroke(216,218,197);
strokeWeight(8);
line(36,156,36,213);
line(0,108,76,90);
strokeWeight(10);
line(42,111,18,150);
line(18,155,18,213);
strokeWeight(6);
line(80,103,18,155);
line(64,127,36,156);
strokeWeight(10);
stroke(37,35,34);
line(0,116,74,98);
fill(216,218,197);
line(75,108,73,213);
stroke(216,218,197);
strokeWeight(7);
ellipse(78,90,7,7);
ellipse(80,103,5,5);
ellipse(79,213,5,5);
strokeWeight(3);
line(80,103,77,207);
stroke(186,200,171);
strokeWeight(3);
line(180,150,173,268);





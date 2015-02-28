
size(200,200);
background(255);
smooth();
noFill();//lian

noStroke();
colorMode(RGB, 200);
for (int i = 0; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}


beginShape();
curveVertex(135,38);
curveVertex(120,39);
curveVertex(114,41);
curveVertex(101,54);
curveVertex(96,62);
curveVertex(95,85);
curveVertex(91,83);
curveVertex(90,90);
curveVertex(93,100);
curveVertex(95,107);
curveVertex(98,111);
curveVertex(100,119);
curveVertex(120,139);
curveVertex(134,139);
curveVertex(155,123);
curveVertex(158,117);
curveVertex(159,105);
curveVertex(163,105);
curveVertex(168,95);
curveVertex(170,84);
curveVertex(169,80);
curveVertex(163,82);
curveVertex(163,69);
curveVertex(160,58);
curveVertex(153,49);
curveVertex(144,43);
curveVertex(135,38);
curveVertex(120,39);
curveVertex(114,41);
endShape();
//zuomeimao
fill(75,71,69);
beginShape();
curveVertex(117,71);
curveVertex(112,70);
curveVertex(107,71);
curveVertex(104,71);
curveVertex(103,73);
curveVertex(101,76);
curveVertex(100,79);
curveVertex(102,76);
curveVertex(107,74);
curveVertex(113,73);
curveVertex(116,73);
curveVertex(117,71);
curveVertex(112,70);
curveVertex(107,71);
noFill();
endShape();
//youmeimao
beginShape();
curveVertex(131,70);
curveVertex(136,69);
curveVertex(143,69);
curveVertex(147,70);
curveVertex(151,76);
curveVertex(149,75);
curveVertex(145,72);
curveVertex(141,72);
curveVertex(136,72);
curveVertex(132,72);
curveVertex(131,70);
curveVertex(136,69);
curveVertex(143,69);

endShape();


//zuoyan
beginShape();


curveVertex(118,82);
curveVertex(105,82);
curveVertex(106,81);
curveVertex(108,79);
curveVertex(111,79);
curveVertex(113,79);
curveVertex(111,79);
curveVertex(113,79);
curveVertex(115,80);
curveVertex(116,81);
curveVertex(116,82);
curveVertex(116,83);
curveVertex(115,83);
curveVertex(112,84);
curveVertex(108,84);
curveVertex(106,83);
curveVertex(105,83);
curveVertex(118,84);



endShape();

//yanzhu
ellipse(111,81,4,4);

ellipse(111,81,2,2);

//youyan
beginShape();
curveVertex(132,82);
curveVertex(134,80);
curveVertex(137,79);
curveVertex(141,79);
curveVertex(144,80);
curveVertex(146,81);
curveVertex(147,82);
curveVertex(146,82);
curveVertex(141,83);
curveVertex(137,83);
curveVertex(132,83);
curveVertex(132,82);
curveVertex(134,80);
curveVertex(137,79);
curveVertex(141,79);
endShape();


ellipse(139,81,4,4);

ellipse(139,81,2,2);

//bizi
beginShape();
curveVertex(116,103);
curveVertex(118,102);
curveVertex(120,103);
curveVertex(122,105);
curveVertex(124,106);
curveVertex(127,106);
curveVertex(128,105);
curveVertex(130,103);
curveVertex(132,103);
curveVertex(135,103);
endShape();

//zui

beginShape();
curveVertex(139,113);
curveVertex(114,114);
curveVertex(116,115);
curveVertex(130,115);
curveVertex(136,114);
curveVertex(138,114);
curveVertex(127,106);

endShape();

beginShape();
curveVertex(115,113);
curveVertex(116,113);
curveVertex(119,112);
curveVertex(124,112);
curveVertex(126,112);
curveVertex(131,112);
curveVertex(134,113);
curveVertex(126,112);

endShape();


beginShape();
curveVertex(116,117);
curveVertex(119,119);
curveVertex(130,119);
curveVertex(135,117);
curveVertex(137,115);
endShape();

beginShape();
curveVertex(116,83);
curveVertex(115,83);
curveVertex(112,84);
curveVertex(108,84);
curveVertex(106,83);
curveVertex(105,83);
endShape();

noStroke();
colorMode(RGB, 100);
for (int i = 0; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}

PFont font;
font = loadFont("Serif-16.vlw"); 
textFont(font); 
String s = "Portrait of Tangdi.";
text(s, 15, 160, 70, 70);


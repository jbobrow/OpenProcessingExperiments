
size(231,343);
background(6,66,116);

fill(0);
beginShape();
vertex(45,0);
vertex(74,0);
vertex(50,46);
vertex(37,46);
vertex(45,0);
endShape();

fill(116,167,133);
triangle(45,-2,43,17,76,-2);
triangle(232,14,232,-2,221,-2);

noFill();
strokeWeight(3);
beginShape();
vertex(45,-2);
bezierVertex(45,38,10,114,-2,118);
endShape();

beginShape();
fill(0);
vertex(0,31);
bezierVertex(5,40,7,60,7,67);
vertex(7,67);
bezierVertex(6,73,1,72,0,68);
endShape();

strokeWeight(2);
beginShape();
vertex(-2,227);
bezierVertex(2,225,20,202,22,195);
endShape();

noFill();
beginShape();
vertex(-2,224);
bezierVertex(3,220,16,200,17,194);
endShape();

strokeWeight(4);
stroke(6,66,116);
beginShape();
vertex(55,46);
bezierVertex(55,42,71,5,78,-3);
endShape();

noFill();
stroke(0);
strokeWeight(3);
beginShape();
vertex(36,48);
bezierVertex(80,38,115,72,126,200);
endShape();

//Yellow part
strokeWeight(1);
fill(236,185,1);

beginShape();
vertex(130,245);
vertex(126,200);
vertex(150,247);
vertex(166,200);
vertex(190,241);
vertex(200,184);
vertex(227,224);
vertex(232,181);
vertex(231,224);
bezierVertex(224,231,186,268,130,245);
endShape();

//Red Part
fill(216,8,9);
beginShape();
vertex(231,224);
bezierVertex(224,231,186,268,130,245);
vertex(148,344);
vertex(233,344);
vertex(231,224);
endShape();

fill(245,179,117);
beginShape();
vertex(174,257);
bezierVertex(172,256,155,254,153,255);
bezierVertex(152,259,152,280, 153,287);
bezierVertex(155,293,164,297,169,297);
bezierVertex(172,296,196,281,208,281);
bezierVertex(219,281,228,295,232,299);
vertex(232,257);
bezierVertex(228,257,214,247,206,248);
bezierVertex(199,248,173,256,156,251);
endShape();

fill(233,104,22);
noStroke();
smooth();
beginShape();
vertex(156,282);
bezierVertex(157,285,163,289,168,289);
bezierVertex(174,289,184,285,188,282);
bezierVertex(194,278,202,277,205,276);
bezierVertex(209,274,218,269,221,269);
bezierVertex(223,268,222,260,220,258);
bezierVertex(217,255,214,252,210,251);
bezierVertex(207,249,196,254,192,255);
bezierVertex(187,255,183,257,177,258);
bezierVertex(172,260,167,259,164,258);
bezierVertex(160,258,156,259,155,261);
bezierVertex(156,262,154,268,157,285);
endShape();

stroke(255);
noFill();
beginShape();
vertex(182,317);
vertex(184,324);
vertex(192,302);
vertex(199,320);
vertex(205,301);
endShape();

line(215,343,217,324);
line(221,324,218,343);

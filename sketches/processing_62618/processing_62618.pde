
size(600, 600);
background(255);



//Left eyebrow

smooth();
noStroke();
fill(0);

beginShape();
vertex(257,187);
bezierVertex(257,187, 166,166, 108,207);
bezierVertex(108,207, 112,207, 96,190);
bezierVertex(96,190, 178,158, 257,187);
endShape();

//Left eyelush from left to right

beginShape();
vertex(152,235);
bezierVertex(152,235, 115,221, 109,165);
bezierVertex(109,165, 110,158, 114,154);
bezierVertex(114,154, 114,209, 152,235);
endShape();

beginShape();
vertex(169,225);
bezierVertex(169,225, 138,200, 140,164);
bezierVertex(140,164, 141,160, 146,156);
bezierVertex(146,156, 142,192, 169,225);
endShape();

beginShape();
vertex(192,220);
bezierVertex(192,220, 169,191, 169,166);
bezierVertex(169,166, 170,163, 176,160);
bezierVertex(176,160, 170,187, 192,220);
endShape();

beginShape();
vertex(210,219);
bezierVertex(210,219, 193,190, 200,167);
bezierVertex(200,167, 203,164, 208,163);
bezierVertex(208,163, 197,184, 210,219);
endShape();

beginShape();
vertex(233,222);
bezierVertex(233,222, 220,195, 230,172);
bezierVertex(230,172, 234,170, 239,170);
bezierVertex(239,170, 223,197, 233,222);
endShape();



//Right eyebrow
beginShape();
vertex(316,200);
bezierVertex(316,200, 370,151, 495,159);
bezierVertex(495,159, 487,166, 482,177);
bezierVertex(482,177, 389,159, 316,200);
endShape();


//Right eyelush from left to right

beginShape();
vertex(351,210);
bezierVertex(351,210, 362,182, 345,158);
bezierVertex(345,158, 350,158, 355,160);
bezierVertex(355,160, 367,188, 351,210);
endShape();

beginShape();
vertex(377,204);
bezierVertex(377,204, 390,176, 379,148);
bezierVertex(379,148, 384,148, 388,152);
bezierVertex(388,152, 394,184, 377,204);
endShape();

beginShape();
vertex(401,202);
bezierVertex(401,202, 420,168, 406,140);
bezierVertex(406,140, 412,142, 415,144);
bezierVertex(415,144, 424,176, 401,202);
endShape();

beginShape();
vertex(424,203);
bezierVertex(424,203, 445,180, 438,132);
bezierVertex(438,132, 444,135, 447,138);
bezierVertex(447,138, 448,193, 424,203);
endShape();

beginShape();
vertex(444,209);
bezierVertex(444,209, 470,190, 470,122);
bezierVertex(470,122, 474,127, 477,132);
bezierVertex(477,132, 477,202, 444,209);
endShape();



//left eye 


fill(0);

beginShape();
vertex(128,262);
bezierVertex(128,262, 145,231, 190,221);
bezierVertex(190,221, 246,212, 281,234);
bezierVertex(281,234, 258,286, 212,288);
bezierVertex(212,288, 150,292, 128,262);
endShape();


noStroke();
fill(255);

beginShape();
vertex(139,260);
bezierVertex(139,260, 153,241, 195,228);
bezierVertex(195,228, 243,219, 275,236);
bezierVertex(275,236, 255,285, 208,285);
bezierVertex(208,285, 143,285, 139,260);
endShape();


fill(0);
ellipse(214,260, 40,40);


fill(255);
ellipse(221,256, 16,16);


noFill();
stroke(0);
strokeWeight(3);


beginShape();
vertex(139,262);
bezierVertex(172,234, 248,229, 275,236);
endShape();



//right eye 


fill(0);

beginShape();
vertex(327,220);
bezierVertex(327,220, 348,196, 401,196);
bezierVertex(401,196, 451,195, 466,224);
bezierVertex(466,224, 448,255, 396,256);
bezierVertex(396,256, 355,259, 327,220);
endShape();


noStroke();
fill(255); 

beginShape();
vertex(333,221);
bezierVertex(333,221, 353,197, 398,200);
bezierVertex(398,200, 440,204, 463,224);
bezierVertex(463,224, 445,252, 391,254);
bezierVertex(391,254, 345,252, 333,221);
endShape();


fill(0);
ellipse(366,230, 30,30);


fill(255);
ellipse(365,225, 11,11);


noFill();
stroke(0);
strokeWeight(3);


beginShape();
vertex(332,221);
bezierVertex(350,210, 428,200, 463,223);
endShape();





//Nose

smooth();
noStroke();
fill(0);

beginShape();
vertex(285,149);
bezierVertex(285,149, 315,294, 272,324);
bezierVertex(272,324, 220,361, 258,384);
bezierVertex(258,384, 273,393, 282,377);
bezierVertex(282,377, 298,410, 340,362);
bezierVertex(340,362, 331,355, 319,371);
bezierVertex(319,371, 295,398, 287,358);
bezierVertex(287,358, 280,374, 270,373);
bezierVertex(270,373, 228,370, 278,330);
bezierVertex(278,330, 332,296, 285,149);

endShape();





//Mouse: Upper Lip

smooth();
noStroke();
fill(0);

beginShape();
vertex(202,462);
bezierVertex(202,462, 222,441, 242,432);
bezierVertex(242,432, 260,444, 293,444);
bezierVertex(293,444, 312,417, 336,414);
bezierVertex(336,414, 398,400, 441,409);
bezierVertex(441,409, 330,477, 202,462);
endShape();


noStroke();
fill(255);

beginShape();
vertex(214,458);
bezierVertex(214,458, 222,446, 242,438);
bezierVertex(242,438, 265,448, 295,447);
bezierVertex(295,447, 314,423, 329,422);
bezierVertex(329,422, 388,410, 424,412);
bezierVertex(424,412, 311,468, 214,458);
endShape();



//Mouse: Lower Lip

smooth();
noStroke();
fill(0);

beginShape();
vertex(202,462);
bezierVertex(202,462, 314,475, 441,409);
bezierVertex(441,409, 408,482, 323,498);
bezierVertex(323,498, 237,514, 202,462);
endShape();


noStroke();
fill(255);

beginShape();
vertex(215,467);
bezierVertex(215,467, 338,481, 427,421);
bezierVertex(427,421, 389,488, 307,494);
bezierVertex(307,494, 245,502, 215,467);
endShape();


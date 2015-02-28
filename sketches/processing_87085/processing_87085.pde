
size(800,600);
smooth();
background (61,44,37);

strokeWeight(0);
for (int i = 0; i<900; i+=40){
  fill(61,44,37);
  rect(i,0,i,600);
}

strokeWeight(0);
for (int i = 0; i<900; i+=40){
  fill(255);
  rect(i,200,i,600);
}

strokeWeight(0);
for (int i = 0; i<900; i+=40){
  fill(150);
  rect(i+40,400,i,600);
}

strokeWeight(0);
line(40,200,800,200);
strokeWeight(0);
line(80,400,800,400);


smooth();
strokeWeight(2);
fill(0);
int y = (20*10)+5;
ellipse(490,y,71,54);
ellipse(306,y,71,54);

//head
fill (155,173,127);
strokeWeight(2);
ellipse(488,y,71,54);
ellipse(308,y,71,54);
strokeWeight(2);
int d = (16*10)+1;
rect(315,99,d,d);
smooth();
fill(212,252,255);
strokeWeight(2);
ellipse (353,167,52,30);
smooth();
fill(212,252,255);
strokeWeight(2);
ellipse (433,167,52,30);
beginShape();
smooth();
fill(0);

//hair and nose
strokeWeight(2);
vertex(315,99);
vertex(324,117);
vertex(324,108);
vertex(340,132);
vertex(356,153);
vertex(400,132);
vertex(420,132);
vertex(428,117);
vertex(445,126);
vertex(468,118);
vertex(476,99);
endShape(CLOSE);
beginShape();
fill(0);
vertex(395,193);
vertex(390,197);
vertex(390,199);
vertex(392,201);
vertex(393,199);
vertex(403,201);
endShape(CLOSE);

//body
beginShape();
strokeWeight(2);
fill(0);
smooth();
vertex(347,220);
vertex(444,209);
vertex(439,226);
vertex(407,235);
vertex(387,250);
endShape(CLOSE);
beginShape();
smooth();
fill(255);
vertex(367,218);
vertex(387,216);
vertex(385,222);
vertex(374,229);
endShape(CLOSE);
beginShape();
fill(155,173,127);
vertex(362,279);
vertex(315,306);
vertex(297,369);
vertex(314,379);
endShape(CLOSE);
beginShape();
vertex(412,279);
vertex(440,306);
vertex(459,333);
vertex(459,378);
vertex(455,384);
endShape(CLOSE);
beginShape();
fill(125,119,87);
vertex(379,261);
vertex(400,261);
vertex(419,289);
vertex(456,364);
vertex(455,384);
vertex(436,416);
vertex(330,415);
vertex(320,403);
vertex(310,365);
vertex(320,330);
endShape(CLOSE);
beginShape();
fill(92,79,62);
vertex(330,415);
vertex(436,416);
vertex(465,476);
vertex(383,502);
vertex(290,466);
endShape(CLOSE);
beginShape();
fill(0);
vertex(290,466);
vertex(383,502);
vertex(380,520);
vertex(357,530);
vertex(286,513);
vertex(235,494);
vertex(245,468);
endShape(CLOSE);
beginShape();
vertex(383,502);
vertex(465,476);
vertex(506,492);
vertex(518,514);
vertex(516,542);
vertex(448,546);
vertex(380,520);
endShape(CLOSE);
strokeWeight(2);
line(389,415,383,502);
beginShape();
fill(155,173,127);
strokeWeight(1);
vertex(378,315);
vertex(375,320);
vertex(389,325);
endShape(CLOSE);
beginShape();
vertex(360,350);
vertex(348,370);
vertex(350,380);
vertex(365,375);
endShape(CLOSE);



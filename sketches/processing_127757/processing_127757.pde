
void setup()
{
  size(600,600);
  background(171,171,186);
  smooth();
  
  //è¡£æ��
 noStroke();
 fill(247,196,193);
 beginShape();
vertex(75,0);
curveVertex(98,122);
curveVertex(144,174);
curveVertex(236,200);
curveVertex(415,192);
curveVertex(509,151);
curveVertex(530,122);
vertex(600,0); 
endShape(CLOSE);

//è��å­�
 noStroke();
 fill(255,195,75);
beginShape();
vertex(271,239);
vertex(307,240);
vertex(338,241);
vertex(348,241);
vertex(349,238);
vertex(349,229);
vertex(353,206);
vertex(355,198);
vertex(361,196);
vertex(370,196);
vertex(379,197);
vertex(377,168);
vertex(375,159);
vertex(374,146);
vertex(368,128);
vertex(351,94);
vertex(321,69);
vertex(304,81);
vertex(273,107);
vertex(262,150);
vertex(261,175);
vertex(264,197);
vertex(269,212);
vertex(270,231);
endShape(CLOSE);

//è¡£é �
stroke(216,124,156);
noFill();
strokeWeight(16);
bezier(262,201,246,66,359,-8,380,194);

//é ­é«®è�²å¡�
noStroke();
fill(123,54,30);
bezier(236,269,236,269,26,440,42,600);
bezier(383,272,383,272,593,443,577,600);
 beginShape();
vertex(235,269);
vertex(384,272);
vertex(578,600);
vertex(41,600);
endShape(CLOSE);

//é ­
noStroke();
fill(255,195,75);
ellipse(309,322,169,204);

//å�´å·´
noStroke();
fill(122,27,28);
ellipse(307,260,47,18);
//ç��
noStroke();
fill(255);
rectMode(CENTER);
rect(308,254,43,5);
rect(307,265,45,5);
//å�´å��
strokeWeight(6);
stroke(255,0,0);
noFill();
ellipse(307,260,47,18);
stroke(249,193,95);
ellipse(307,260,57,24);

//ç�¼ç��
noStroke();
fill(255);
ellipse(351,333,46,17);//å�³ç�¼
ellipse(260,333,46,17);//å·¦ç�¼
//ç�¼ç� 
fill(92,38,20);
ellipse(349,333,18,18);
ellipse(258,333,18,18);
fill(10);
ellipse(346,334,7,7);
ellipse(260,334,7,7);
//ç�¼ç�®
fill(249,193,95);
ellipse(351,323,34,8);
ellipse(260,323,34,8);

//é¼»å­�
fill(20);
ellipse(315,294,6,4);
ellipse(297,294,6,4);
//é¼»æ¨�
fill(255,227,219,100);
ellipse(306,335,5,58);
stroke(237,113,0,100);
strokeWeight(1);
noFill();
bezier(294,307,299,351,309,424,320,307);
//é¼»ç¿¼
fill(237,113,0,100);
stroke(237,113,0);
strokeWeight(1);
bezier(289,292,289,292,279,304,294,307);
bezier(322,291,322,291,330,306,320,307);

//è��é °
fill(255,227,219,100);
noStroke();
ellipse(358,298,45,35);
ellipse(255,298,45,35);

//ç��æ¯�
noFill();
stroke(70);
strokeWeight(2);
bezier(332,353,338,370,367,365,372,353);
bezier(239,354,245,371,274,366,279,354);
}

void draw()
{
}

void keyPressed()
{
 int x = int(random(0,600));
 int y = int(random(0,600));

//é ­é«®
fill(191,random(36,133),random(0,102),random(5,20));
stroke(191,random(36,133),random(0,102),random(100,200));
strokeWeight(0.5);
//ç��æµ·
bezier(305,422,305,422,291,399,random(307,393),random(377,450));
bezier(305,426,305,426,261,431,random(222,310),random(377,450));
bezier(310,427,310,427,361,442,random(310,393),random(377,450));
line(310,427,random(250,350),random(377,600));
//ä¸­å¾�é«®
bezier(305,422,305,422,291,399,random(307,393),random(400,700));
bezier(305,426,305,426,261,431,random(222,310),random(400,700));
bezier(310,427,310,427,361,442,random(310,393),random(400,700));
line(310,427,random(250,350),random(377,600));
//å·¦å¾�å��é��é«®
bezier(236,269,236,269,26,440,random(0,127),random(425,600));
bezier(223,331,223,331,98,541,random(60,300),random(425,650));
bezier(235,375,235,375,168,549,random(70,350),random(425,700));
//å�³å¾�å��é��é«®
bezier(383,272,383,272,593,443,random(450,600),random(425,650));
bezier(393,332,393,332,518,541,random(400,500),random(425,650));
bezier(380,376,380,376,448,550,random(350,450),random(425,650));
}


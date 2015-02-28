
// Assignment 1: Miro in Processing (10/2)
// TePangChiang  N76014087

void setup() {
size(480,600);
background(235);
smooth();
strokeWeight(1.5);
}

void draw() {

fill(0);
  noStroke();
  beginShape(); // 14-black back
  vertex(185,372); // first point
  bezierVertex(182,382,182,386,180,395);
  bezierVertex(180,405,180,405,178.5,415);
  bezierVertex(177,431,177,431,177,447);
  bezierVertex(177,459,177,461,180,472);
  bezierVertex(182,483,182,485,185,495);
  bezierVertex(199,515,203,515,220,526);
  bezierVertex(243,530,247,530,275,526);
  bezierVertex(297,514,297,510,310,497);
  bezierVertex(316,488,316,488,322,478);
  bezierVertex(327,451,324,449,322,420);
  bezierVertex(300,420,300,420,275,420);
  bezierVertex(275,395,275,395,275,372);
  endShape();  
  
fill(250,142,3);
  noStroke();
  beginShape(); // deep yellow
  vertex(185,373); // first point
  bezierVertex(182,382,182,386,180,395);
  bezierVertex(200,400,198,405,205,420);
  bezierVertex(218,420,218,420,232,420);
  bezierVertex(236,396.5,236,396.5,239,373);
  bezierVertex(213,373,213,373,185,373);
  endShape();  
  
fill(48,63,4);
  noStroke();
  beginShape(); // green
  vertex(204,420); // first point
  bezierVertex(205,430,205,430,202,440);
  bezierVertex(218,440,218,440,230,440);
  bezierVertex(231,430,231,430,233,420);
  bezierVertex(220,420,220,420,205,420);
  endShape();

fill(48,63,4);
  noStroke();
  beginShape(); // green-2
  vertex(234,420); // first point
  bezierVertex(243,420,243,420,252,420);
  bezierVertex(254,412,254,412,254,405);
  bezierVertex(245,405,245,405,236,405);
  bezierVertex(235,412,235,412,234,420);
  endShape();

fill(255,239,6);
  noStroke();
  beginShape(); // light yellow
  vertex(252,420); // first point
  bezierVertex(252,420,252,420,274,420);
  bezierVertex(274,405,274,405,274,405);
  bezierVertex(263,405,263,405,254,405);
  bezierVertex(253,415,253,415,252,420);
  endShape(); 
 
fill(48,63,4);
  noStroke();
  beginShape(); // green-3
  vertex(275,420); // first point
  bezierVertex(275,446,275,446,275,472);
  bezierVertex(285,473,285,473,295,474);
  bezierVertex(295,447,295,447,295,420);
  bezierVertex(284,420,284,420,275,420);
  endShape();
 
fill(29,50,157);
  noStroke();
  beginShape(); // blue-1
  vertex(240,372); // first point
  bezierVertex(238,383,238,383,237,392);
  bezierVertex(246,392,246,392,255,392);
  bezierVertex(256,382,256,382,257,372);
  bezierVertex(248,372,248,372,240,372);
  endShape(); 
 
beginShape(); // blue-2
  vertex(275,420); // first point
  bezierVertex(284,420,284,420,295,420);
  bezierVertex(295,413,295,413,295,405);
  bezierVertex(285,405,285,405,275,405);
  bezierVertex(275,413,275,413,275,420);
  endShape();

beginShape(); // blue-3
  vertex(231,440); // first point
  bezierVertex(230,450,230,450,228,459);
  bezierVertex(251,462,251,462,274,465);
  bezierVertex(274,453,274,453,274,440);
  bezierVertex(253,440,253,440,231,440);
  endShape();

beginShape(); // blue-4
  vertex(203,420); // first point
  bezierVertex(192,418,192,418,178.5,415);
  bezierVertex(178.5,430,178.5,430,178.5,444);
  bezierVertex(186,447,186,447,195,451);
  bezierVertex(203,435,203,435,203,420);
  endShape();

fill(206,64,10);
  noStroke();
  beginShape(); // red-1
  vertex(197,452); // first point
  bezierVertex(192,461,192,461,182,474);
  bezierVertex(183,485,183,485,186,495);
  bezierVertex(204,495,204,495,223,495);
  bezierVertex(226,477,226,477,228,459);
  bezierVertex(211,455,211,455,197,452);
  endShape(); 
 
beginShape(); // red-2
  vertex(225,495); // first point
  bezierVertex(223,510,223,510,222,524);
  bezierVertex(246,528,246,528,275,524);
  bezierVertex(275,509,275,509,275,493);
  bezierVertex(248,494,248,494,223,495);
  endShape();  
  
beginShape(); // red-3
  vertex(275,493); // first point
  bezierVertex(291,493,291,493,313,492);
  bezierVertex(318,485,318,485,322,478);
  bezierVertex(299,476,299,476,275,474);
  bezierVertex(275,484,275,484,275,493);
  endShape(); 
 
beginShape(); // red-4
  vertex(296,406); // first point
  bezierVertex(296,413,296,413,296,420);
  bezierVertex(309,420,309,420,322,420);
  bezierVertex(320,412,320,412,319,406);
  bezierVertex(307,406,307,406,296,406);
  endShape();  
  
beginShape(); // red-5
  vertex(257,395); // first point
  bezierVertex(255,395,255,395,255,405);
  bezierVertex(264,405,264,405,274,405);
  bezierVertex(274,395,274,395,274,395);
  bezierVertex(266,395,266,395,257,395);
  endShape();  
  
fill(27,53,8);
  beginShape();
  noStroke(); // 1
  vertex(270,8); // first point
  bezierVertex(210,89,210,91,187,160);
  bezierVertex(158,187,162,187,140,215);
  bezierVertex(110,175,110,175,104,120);
  bezierVertex(110,95,110,95,132,69);
  bezierVertex(180,30,180,30,270,8);
  endShape();
  
fill(0);
  beginShape();
  noStroke(); // 2 
  vertex(187,160); // first point
  bezierVertex(190,195,190,197,202,232);
  bezierVertex(171,232,171,232,140,215);
  bezierVertex(160,187,160,187,187,160);
  endShape();
  
fill(206,64,10);
  noStroke();
  beginShape(); // 16
  vertex(294,184); // first point
  bezierVertex(298,200,298,200,297,215);
  bezierVertex(296,229,296,229,286,242);
  bezierVertex(273,244,277,244,265,237);
  bezierVertex(270,218,270,218,276,200);
  bezierVertex(268,190,268,190,260,200);
  bezierVertex(260,203,260,203,254,215);
  bezierVertex(244,225,240,225,230,215);
  bezierVertex(233,200,233,200,240,184);
  bezierVertex(250,175,245,170,272,166);
  bezierVertex(283,170,283,170,294,184);
  endShape();
  
fill(0);
  noStroke();
  beginShape(); // 16-kai
  vertex(294,184); // first point
  bezierVertex(298,200,298,200,297,215);
  bezierVertex(281,221,281,221,265,237);
  bezierVertex(270,218,270,218,276,200);
  bezierVertex(268,190,268,190,260,200);
  bezierVertex(260,203,260,203,254,215);
  bezierVertex(244,225,240,225,230,215);
  bezierVertex(233,200,233,200,240,184);
  bezierVertex(250,175,245,170,272,166);
  bezierVertex(283,170,283,170,294,184);
  endShape();

fill(40,56,131);
  noStroke();
  beginShape(); // 15
  vertex(380,260); // first point
  bezierVertex(375,288,373,292,353,319);
  bezierVertex(355,296,358,296,349,273);
  bezierVertex(335,260,335,260,322,255);
  bezierVertex(315,255,320,210,355,222);
  bezierVertex(375,239,375,243,380,260);
  endShape();  
  
fill(0);
  noStroke();
  beginShape(); // 15 - black
  vertex(380,260); // first point
  bezierVertex(375,288,373,292,353,319);
  bezierVertex(355,296,358,296,349,273);
  bezierVertex(335,260,335,260,322,255);
  bezierVertex(335,242,335,236,355,222);
  bezierVertex(375,239,375,243,380,260);
  endShape();   

fill(206,64,10);
  noStroke();
  beginShape(); // 3
  vertex(89,64); // first point
  bezierVertex(72,75,70,110,104,120);
  bezierVertex(110,95,110,95,132,69);
  bezierVertex(105,52,100,60,89,64);
  endShape();
  
fill(0);
  noStroke();
  beginShape(); // 3 - kai
  vertex(104,120); // first point
  bezierVertex(110,95,110,95,132,69);
  bezierVertex(145,85,145,120,104,120);
  endShape();

noFill();
  stroke(0);
  curve(150,350,90,65,25,85,250,350); // 4
  curve(150,280,80,74,37,130,220,350); // 5
  curve(150,200,76,81,65,145,300,450); // 6
  
noFill();
  stroke(0);
  beginShape(); // 14
  vertex(440,180); // first point
  bezierVertex(360,195,378,190,297,215);
  bezierVertex(281,221,281,221,265,237);
  bezierVertex(250,261,250,259,234,282);
  bezierVertex(210,339,210,315,185,372);
  bezierVertex(182,382,182,386,180,395);
  bezierVertex(180,405,180,405,178.5,415);
  bezierVertex(177,431,177,431,177,447);
  bezierVertex(177,459,177,461,180,472);
  bezierVertex(182,483,182,485,185,495);
  bezierVertex(199,515,203,515,220,526);
  bezierVertex(243,530,247,530,275,526);
  bezierVertex(297,514,297,510,310,497);
  bezierVertex(316,488,316,488,322,478);
  bezierVertex(327,451,324,449,322,420);
  bezierVertex(310,351,300,351,310,282);
  bezierVertex(314,269,314,269,322,255);
  bezierVertex(335,242,335,236,355,222);
  bezierVertex(398,202,398,202,440,195);
  endShape();

noFill();
  stroke(0);
  beginShape(); // 7
  curveVertex(320,0); // the first control point
  curveVertex(320,0); // is also the start point of curve
  curveVertex(260,90);
  curveVertex(187,160);
  curveVertex(140,215);
  curveVertex(80,317);
  curveVertex(37,455);
  curveVertex(89,515);
  curveVertex(180,472);
  curveVertex(202,425);
  curveVertex(180,395);
  curveVertex(130,425); // the last point of curve
  curveVertex(130,500); // is also the last control point
  endShape();
  
fill(0);
  stroke(0);
  beginShape(); // 8
  vertex(130,425); // first point
  bezierVertex(115,420,105,420, 79,446);
  bezierVertex(80,466,100,466,120,457);
  bezierVertex(135,444,137,439,130,425);
  endShape();

fill(0);
  stroke(0);
  beginShape(); // 19
  vertex(372,512); // first point
  bezierVertex(340,505,360,486,361,486);
  bezierVertex(388,470,402,490,402,497);
  bezierVertex(400,508,390,515,372,512);
  endShape();
  
noFill();
  stroke(0); // 9
  line(347,407,457,400);
  line(407,355,410,460);
  line(365,347,465,475);
  line(455,355,347,460);
  
  line(170,372,300,372); //10
  line(240,355,215,570); //11
  line(275,335,275,582); //12
  line(235,405,325,405); //13
  line(258,372,252,420); //23
  line(236,392,274,392);
  line(200,440,274,440);
  line(295,397,294,473);
  
noFill();
  stroke(0);
  beginShape(); // 17
  curveVertex(236,568); // the first control point
  curveVertex(236,568); // is also the start point of curve
  curveVertex(275,582);
  curveVertex(320,588);
  curveVertex(362,580); // the last point of curve
  curveVertex(362,580); // is also the last control point
  endShape();
  
noFill();
  stroke(0);
  beginShape(); // 18
  curveVertex(362,580); // the first control point
  curveVertex(362,580); // is also the start point of curve
  curveVertex(372,512); // the last point of curve
  curveVertex(372,512); // is also the last control point
  endShape();

fill(40,56,131);
  noStroke();
  beginShape(); // 27
  vertex(468,282); // first point
  bezierVertex(462,291,462,291,455,302);
  bezierVertex(447,316,447,316,432,330);
  bezierVertex(425,333,425,333,418,336);
  bezierVertex(400,305,430,260,468,282);
  endShape();

fill(0);
  noStroke();
  beginShape(); // 27 - black
  vertex(468,282); // first point
  bezierVertex(462,291,462,291,455,302);
  bezierVertex(447,316,447,316,432,330);
  bezierVertex(425,333,425,333,418,336);
  bezierVertex(465,375,495,310,468,282);
  endShape();
  
fill(0);
  noStroke();
  beginShape(); // 26 - black
  vertex(455,302); // first point
  bezierVertex(447,316,447,316,432,330);
  bezierVertex(420,295,455,295,455,302);
  endShape(); 

fill(206,64,10);
  noStroke();
  beginShape(); // 26
  vertex(455,302); // first point
  bezierVertex(447,316,447,316,432,330);
  bezierVertex(450,350,470,320,455,302);
  endShape();  

fill(0);
  noStroke();
  beginShape(); // 25 - a
  vertex(429,132); // first point
  bezierVertex(434,127,434,127,439,122);
  bezierVertex(451,135,451,135,464,152);
  bezierVertex(447,142,447,142,429,132);
  endShape();
  
fill(0);
  noStroke();
  beginShape(); // 25 - b
  vertex(464,152); // first point
  bezierVertex(472,156,472,156,480,160);
  bezierVertex(480,168,480,168,480,176);
  bezierVertex(476,178,476,178,473,179);
  bezierVertex(469,166,469,166,464,152);
  endShape();
  
fill(0);
  stroke(0);
  line(473,179,449,205);
  
fill(206,64,10);
  noStroke();
  beginShape(); // 25
  vertex(408,106); // first point
  bezierVertex(423,110,423,110,439,122);
  bezierVertex(435,138,400,135,408,106);
  endShape();
  
fill(0);
  noStroke();
  beginShape(); // 25 - kai
  vertex(408,106); // first point
  bezierVertex(423,110,423,110,439,122);
  bezierVertex(455,90,415,80,408,106);
  endShape();
  
noFill();
  stroke(0);
  beginShape(); // 24
  vertex(435,222); // first point
  bezierVertex(440,200,440,180,426,158);
  bezierVertex(399,140,399,145,352,144);
  bezierVertex(340,137,340,125,352,118);
  bezierVertex(380,107,380,107,408,106);
  bezierVertex(423,110,423,110,439,122);
  bezierVertex(451,135,451,135,464,152);
  bezierVertex(480,210,480,234,468,282);
  bezierVertex(462,291,462,291,455,302);
  bezierVertex(447,316,447,316,432,330);
  bezierVertex(425,333,425,333,418,336);
  bezierVertex(400,335,395,335,383,315);
  bezierVertex(390,292,390,292,410,267);
  bezierVertex(430,245,430,245,435,222);
  endShape();  
    
}



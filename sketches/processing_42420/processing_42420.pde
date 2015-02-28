
//author:robertlun,ncku arch
//purpose: exercise on class 
//concept: practice program structure.
//reference:http:http://www.openprocessing.org/visuals/?visualID=40885

void setup()
{//背景
  size(528, 334);
  background(255, 251, 210);
  smooth();
   
noStroke(); 
fill(255,203,67);
quad(0,0,225,0,185,40,0,89); 
noLoop();
}

void line1(){
//碎線條
stroke(0);
strokeWeight(2);
line(65,73,316,0);
line(161,65,223,0);
line(515,0,529,12);
line(437,334,489,299);
line(512,334,528,273);
line(353,236,528,239);
}

void curve1(){
//curve
noFill();
strokeWeight(3);
stroke(78,101,59);
beginShape();
vertex(338,82);
bezierVertex(346,63,363,62,375,78);
endShape();
 
noFill();
strokeWeight(4);
stroke(220,191,161);
beginShape();
vertex(329,71);
bezierVertex(343,51,368,52,382,69);
endShape();
 
strokeWeight(4);
stroke(244,222,161);
beginShape();
vertex(409,64);
bezierVertex(426,54,445,52,463,60);
endShape();
}

void backcolor(){
//中間大塊背景色
noStroke();
fill(250,245,238);
beginShape();
vertex(307,290);
vertex(213,240);
vertex(292,41);
vertex(361,105);
vertex(394,49);
vertex(435,89);
vertex(506,17);
vertex(515,24);
vertex(528,12);
vertex(528,36);
vertex(307,290);
endShape();
}

void colorarea(){
//中間大塊色塊
 
//GREEN
fill(91,114,34);
quad(248,150,259,121,325,156,302,191);
fill(54,99,40);
quad(377,149,392,132,406,145,392,159);
fill(140,158,46);
quad(284,280,310,252,328,269,307,291);
//BROWN
fill(113,46,1);
quad(212,241,236,181,280,222,254,263);
//YELLOW
fill(230,222,176);
quad(291,235,319,205,338,219,310,251);
fill(219,166,126);
quad(374,181,393,159,410,171,391,193);
fill(96,166,169);
quad(324,156,343,128,375,149,353,172);
 
//BLACK
noStroke();
fill(0);
quad(273,87,293,40,360,104,343,129);
quad(360,104,371,86,405,119,391,133);
quad(380,71,396,50,434,93,417,106);
quad(281,223,301,191,321,206,292,234);
quad(404,120,418,106,430,119,418,132);
quad(405,145,418,131,433,144,419,159);
quad(488,36,507,16,515,26,497,46);
quad(475,68,497,44,509,55,487,81);
quad(514,26,528,11,528,38,528,38);
quad(93,188,98,180,309,292,296,307);
 
//中間大塊輪廓
stroke(0);
strokeWeight(3);
line(213,240,292,41);
line(253,262,394,49);
line(261,266,506,17);
line(284,280,528,10);
line(307,290,526,35);
 
line(235,180,328,269);
line(247,149,356,236);
line(259,120,392,192);
line(273,84,410,171);
line(292,40,420,158);
line(371,86,433,143);
line(380,73,443,131);
line(394,50,457,114);
line(467,57,486,81);
line(488,36,508,55);
strokeWeight(9);
line(332,189,528,153);
stroke(70,27,0);
line(321,239,528,180);
noStroke();
fill(230,222,176);
quad(295,235,320,208,335,220,310,251);
}

void circle1(){ 
//circle
stroke(0);
strokeWeight(3);
fill(245,245,245);
arc(528, 238,110,105,PI, TWO_PI-PI/2);
 
noStroke();
fill(228,230,245);
ellipse(58,271,150,150);
fill(156,189,220);
ellipse(58,271,130,130);
fill(100,187,200);
ellipse(58,271,120,120);
 
stroke(0);
fill(255,214,0);
ellipse(58,271,90,90);

noFill();
strokeWeight(2);
beginShape();
vertex(176,223);
bezierVertex(177,154,215,139,252,139);
endShape();
}


void curvecont(){ 
//上方連續曲線
smooth();
noFill();
strokeWeight(9.5);
beginShape();
vertex(143,111);
bezierVertex(101,65,103,37,121,29);
endShape();
 
strokeWeight(8);
beginShape();
vertex(115,31);
bezierVertex(136,21,163,37,179,45);
endShape();
 
strokeWeight(6);
beginShape();
vertex(170,43);
bezierVertex(210,56,237,28,252,0);
endShape();
 
strokeWeight(3);
beginShape();
vertex(317,0);
bezierVertex(332,9,347,12,371,-2);
endShape();
} 
 

void draw()
{
  line1();
  curve1();
 backcolor();
 colorarea();
circle1();
curvecont();
}


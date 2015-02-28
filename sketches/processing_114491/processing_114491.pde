
// Assignment 02 -Miro The Melancholic
// Echo Chen (puyce7244@yahoo.com.tw)
 
void setup(){
  size(500,360);
  background(203,177,142);
}
 
void draw(){
//-----------------------------------
//I want that this area can "move".(a~l)
  if (mousePressed) {
  fill(0,5); 
  rect(0,0,width,height);
   }
  else {
    fill(mouseX, mouseY,0);
    noStroke();
    beginShape();
    vertex(309, 126);
    bezierVertex(258, 149, 222, 149, 258, 218);
    endShape();
    
    fill(mouseY,mouseX,0);
    noStroke();
    beginShape();
    vertex(258, 218);
    bezierVertex(309, 202, 343, 202, 309,126);
    endShape();
  }
 
  
    
    
 

//1.the eyes in central
//  a.black part
//fill(0,0,0);
//noStroke();
//beginShape();
//vertex(309, 126);
//bezierVertex(258, 149, 222, 149, 258, 218);
 //endShape();
 
// b.red part
//fill(193,51,35);
//noStroke();
//beginShape();
//vertex(258, 218);
//bezierVertex(309, 202, 343, 202, 309,126);
//endShape();
 
// c.half of circle (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(291,158);
bezierVertex(283,152, 264, 165, 281,177);
endShape();
 
// d.half of circle (black)
fill(0);
noStroke();
beginShape();
vertex(291,158);
bezierVertex(299,165,298,180,280,177);
endShape();
 
// e.six hands-1-1
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(25,238);
bezierVertex(-9,314,98,326,145,280);
endShape();
 
// e.six hands-1-2
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(145,280);
bezierVertex(181,245,214,195,246,193);
endShape();
 
// e.fill - circle - 1-1 (black)
fill(0);
stroke(0);
beginShape();
vertex(118,297);
bezierVertex(116,287,129,286,131,290);
endShape();
 
// e.fill - circle - 1-2 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(118,297);
bezierVertex(120,308,142,306,131,290);
endShape();
 
// e.fill - circle - 2-1
fill(0);
noStroke();
beginShape();
vertex(217,208);
bezierVertex(214,199,224,194,228,199);
endShape();
 
// e.fill - circle - 2-2
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(217,208);
bezierVertex(224,218,235,206,228,199);
endShape();
 
// e.fill - triangle up 
fill(0);
noStroke();
beginShape();
triangle(43,253,67,293,98,260);
endShape();
 
// e.fill - triangle up 
fill(0);
noStroke();
beginShape();
vertex(43,253);
bezierVertex(66,248,96,258,98,260);
endShape();
 
// e.fill - triangle down 
fill(0);
noStroke();
beginShape();
triangle(67,293,21,342,91,337);
endShape();
 
// e.fill - triangle down 
fill(0);
noStroke();
beginShape();
vertex(21,342);
bezierVertex(57,350,80,344,91,337);
endShape();
 
// e.fill - quad 
fill(mouseX, mouseY,0);
noStroke();
quad(54,304,74,306,83,320,38,323);
 
// e.line  
stroke(1);
strokeWeight(1);
line(22,322,99,320);
 
 
// f.six hands-2-1
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(50,156);
bezierVertex(13,194,73,250,140,232);
endShape();
 
// f.six hands-2-2
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(140,232);
bezierVertex(172,216,214,172,243,176);
endShape();
 
// f.fill - triangle - 1 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(22,199);
bezierVertex(27,193,45,194,59,199);
endShape();
 
// f.fill - triangle - 2 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
triangle(22, 199, 35, 215, 59, 199);
endShape();
 
 
// f.fill - triangle - 1 (black)
fill(0);
noStroke();
beginShape();
triangle(42, 195, 48, 205, 59, 199);
endShape();
 
// f.fill - triangle - 3 (black)
fill(0);
noStroke();
beginShape();
triangle(19, 230, 35, 215, 45, 235);
endShape();
 
// f.fill - triangle - 3 - 1 (black)
fill(0);
noStroke();
beginShape();
vertex(19,230);
bezierVertex(23, 239, 41, 238, 45, 235);
endShape();
 
// f.fill - circle - 1 (black)
fill(0);
noStroke();
beginShape();
vertex(63,221);
bezierVertex(71, 213, 87, 217, 84, 230);
endShape();
 
// f.fill - circle - 1 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(63,221);
bezierVertex(53, 239, 80, 244, 84, 230);
endShape();
 
// g.six hands-3-1
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(105,116);
bezierVertex(115,256,197,170,247,160);
endShape();
 
// g.Fill - circle (black)
fill(0);
noStroke();
beginShape();
vertex(214,173);
bezierVertex(210,159,226,155,232,165);
endShape();
 
// g.Fill - circle (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(214,173);
bezierVertex(219,181,236,178,232,165);
endShape();
 
// g.triangle down - 1 (blue)
fill(mouseX, mouseY,0);
triangle(88,125,64,165,130,170);
 
// g.triangle down - 2 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(64,165);
bezierVertex(96,190,129,170,130,170);
endShape();
 
// g.triangle down - 3 (black)
fill(0);
noStroke();
triangle(108,145,130,170,116,175);
 
// g.curve
noFill();
stroke(0);
strokeWeight(1);
beginShape();
curveVertex(75,182);
curveVertex(75,182);
curveVertex(82,171);
curveVertex(106,173);
curveVertex(112,190);
curveVertex(112,190);
endShape();
 
// g.triangle up - 1 (black)
fill(0);
triangle(67,87,107,93,88,125);
 
// g.triangle up - 2 (black)
fill(0);
noStroke();
beginShape();
vertex(67,87);
bezierVertex(75,82,97,86,107,93);
endShape();
 
// h.curve-1 cross 1,2,3 hands
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(197,112);
bezierVertex(170,219,137,238,140,232);
endShape();
 
// h.cirvus-2 cross 1,2,3 hands
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(140,232);
bezierVertex(111,314,238,303,196,228);
endShape();
 
// h.cirvus-3 cross 1,2,3 hands
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(196,228);
bezierVertex(184,221,179,223,166,235);
endShape();
 
// h.fill - cross 1,2,3 hands
fill(0);
stroke(0);
strokeWeight(1);
beginShape();
vertex(145,280);
bezierVertex(197,324,216,241,196,228);
endShape();
 
// h.fill - end circle 1 - cross 1,2,3 hands
fill(0);
beginShape();
vertex(166,235);
bezierVertex(153,235,155,249,165,248);
endShape();
 
// h.fill - end circle 2 - cross 1,2,3 hands
fill(0);
stroke(0);
beginShape();
vertex(165,248);
bezierVertex(175,248,174,236,166,235);
endShape();
 
 
// i.six hands-4
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(303,204);
bezierVertex(302,244,296,276,318,291);
endShape();
 
// 1.circle -1 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(302,247);
bezierVertex(290,245,285,266,303,266);
endShape();
 
// i.circle -2 (black)
fill(0);
beginShape();
vertex(302,247);
bezierVertex(317,249,312,266,303,266);
endShape();
  
// j.six hands-5
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(319,186);
bezierVertex(346,193,337,261,390,261);
endShape();
 
// j.circle -1 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(348,236);
bezierVertex(336,244,345,260,360,253);
endShape();
 
// j.circle -2 (black)
fill(0);
beginShape();
vertex(348,236);
bezierVertex(360,231,370,243,360,253);
endShape();
 
// k.six hands-6
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(322,166);
bezierVertex(381,133,459,177,482,182);
endShape();
 
// k.circle -1 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(355,156);
bezierVertex(358,128,395,128,399,157);
endShape();
 
// k.circle -2 (black)
fill(0);
beginShape();
vertex(355,156);
bezierVertex(352,180,395,195,399,157);
endShape();
 
// k.hourglass -1 (blue)
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(430,170);
bezierVertex(366,128,507,92,430,170);
endShape();
 
// k.hourglass -2 (black)
fill(0);
beginShape();
vertex(430,170);
bezierVertex(387,220,500,227,430,170);
endShape();
 
// k.hourglass - triangle -3 (black)
fill(0);
triangle(419,161,434,165,430,170);
 
//-----------------------------------
//I want that this area can't "move".(l~q)
 
// l.Spiral a (between 1&4 hands)
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(242,264);
bezierVertex(299,261,212,346,205,266);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(205,266);
bezierVertex(218,237,271,221,275,280);
endShape();
 
fill(0);
beginShape();
vertex(246,264);
bezierVertex(235,251,219,260,224,271);
bezierVertex(232,283,246,274,246,264);
endShape();
 
// m.Spiral b  (between 4&5 hands)
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(404,318);
bezierVertex(426,283,437,354,393,340);
bezierVertex(361,311,445,262,432,327);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(404,318);
bezierVertex(395,318,396,331,404,331);
bezierVertex(413,331,413,318,404,318);
endShape();
 
// m.Spiral c  (between 3&6 hands)
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(310,0);
bezierVertex(252,76,404,78,364,0);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(330,0);
bezierVertex(282,32,330,67,350,38);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(350,38);
bezierVertex(367,15,349,-8,334,19);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(334,18);
bezierVertex(320,18,320,37,334,37);
bezierVertex(347,37,347,18,334,18);
endShape();
 
// m.Spiral d  (between 3&6 hands)
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(500,125);
bezierVertex(467,128,470,89,494,88);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(500,100);
bezierVertex(488,100,488,116,500,116);
endShape();
 
//n.little robet a
 
fill(0);
triangle(144,112,128,144,155,147);
 
fill(0);
beginShape();
vertex(148,95);
bezierVertex(134,93,133,112,144,112);
bezierVertex(155,113,162,99,148,95);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(120,91);
bezierVertex(129,99,101,128,136,129);
bezierVertex(169,137,176,112,168,93);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
triangle(136,129,144,112,150,130);
 
fill(0);
noStroke();
beginShape();
vertex(171,105);
bezierVertex(163,103,158,115,169,118);
bezierVertex(181,118,181,106,171,105);
endShape();
 
 
//o.little robet b
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(218,85);
bezierVertex(291,83,316,90,388,95);
endShape();
 
fill(0);
noStroke();
triangle(218,85,241,134,286,87);
 
fill(0);
noStroke();
triangle(337,92,360,128,388,95);
 
fill(0);
noStroke();
beginShape();
vertex(294,88);
bezierVertex(294,117,329,108,329,90);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(294,88);
bezierVertex(298,71,323,67,329,71);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(329,90);
bezierVertex(327,81,323,70,311,90);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(302,89);
bezierVertex(303,85,314,78,318,90);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(302,89);
bezierVertex(301,102,318,102,318,90);
endShape();
 
//p.little robet c
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(372,209);
bezierVertex(390,207,411,209,425,213);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(372,209);
bezierVertex(371,201,360,202,359,209);
bezierVertex(360,217,372,216,372,209);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
quad(388,204,415,204,415,235,389,228);
 
fill(0);
noStroke();
quad(388,204,415,204,415,210,389,208);
 
fill(119,116,85);
noStroke();
triangle(399,220,414,259,382,256);
 
fill(0);
noStroke();
triangle(399,220,394,230,404,232);
 
fill(0);
noStroke();
quad(387,245,410,247,414,259,382,256);
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(379,245);
bezierVertex(395,243,415,248,422,248);
endShape();
 
//q. star (1-10,left to right)
 
noFill();
stroke(0);
strokeWeight(1);
line(55,86,54,128);
line(44,100,66,122);
line(44,112,66,113);
line(65,100,48,119);
 
noFill();
stroke(0);
strokeWeight(1);
line(85,205,122,204);
line(104,196,105,222);
line(96,193,120,220);
line(122,196,90,218);
 
noFill();
stroke(0);
strokeWeight(1);
line(140,166,164,165);
line(152,155,149,178);
line(143,157,160,177);
line(160,157,143,175);
 
noFill();
stroke(0);
strokeWeight(1);
line(218,312,220,337);
line(205,325,233,323);
line(208,317,231,333);
line(230,314,210,333);
 
noFill();
stroke(0);
strokeWeight(1);
line(262,16,267,53);
line(250,38,285,28);
line(247,26,285,42);
line(287,13,250,48);
 
noFill();
stroke(0);
strokeWeight(1);
line(343,285,339,321);
line(323,305,365,303);
line(327,290,354,321);
line(364,285,325,317);
 
noFill();
stroke(0);
strokeWeight(1);
line(430,219,426,242);
line(422,228,437,229);
line(425,221,434,238);
line(436,221,422,235);
 
noFill();
stroke(0);
strokeWeight(1);
line(450,321,449,350);
line(439,335,463,336);
line(441,321,463,350);
line(460,324,440,346);
 
//r. little circle
 
fill(0);
noStroke();
beginShape();
vertex(405,115);
bezierVertex(405,106,418,106,418,115);
bezierVertex(418,123,405,123,405,115);
endShape();
 
//s. little hourglass
 
fill(0);
noStroke();
triangle(333,124,324,137,342,135);
 
fill(0);
noStroke();
triangle(333,124,321,113,340,115);
 
fill(0);
noStroke();
beginShape();
vertex(321,113);
bezierVertex(328,108,339,112,340,115);
endShape();
 
//-----------------------------------
//I want that this area can't "move".(s~)
//the stuff around canvas!(left to right)
 
//t.half of star add 2 circle
 
fill(0);
noStroke();
triangle(0,19,30,70,142,41);
 
fill(0);
noStroke();
quad(0,19,30,70,30,174,0,124);
 
fill(0);
noStroke();
beginShape();
vertex(143,10);
bezierVertex(44,6,85,118,139,76);
bezierVertex(246,135,247,-55,143,10);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(143,10);
bezierVertex(115,35,133,75,139,76);
bezierVertex(160,62,172,24,143,10);
endShape();
 
fill(0);
noStroke();
triangle(144,42,87,32,83,55);
 
fill(193,51,35);
noStroke();
quad(87,32,83,55,127,46,127,39);
 
fill(0);
noStroke();
beginShape();
vertex(57,0);
bezierVertex(59,20,98,11,103,0);
endShape();
 
fill(193,51,35);
noStroke();
beginShape();
vertex(0,162);
bezierVertex(16,192,16,224,0,245);
endShape();
 
fill(0);
noStroke();
quad(87,360,96,340,147,354,147,360);
 
//t. 3 bubbles
 
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(168,360);
bezierVertex(172,343,196,338,200,360);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(175,349);
bezierVertex(140,335,196,310,191,347);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(175,349);
bezierVertex(180,344,188,345,191,347);
bezierVertex(187,353,179,353,175,349);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(175,328);
bezierVertex(112,303,218,290,175,328);
endShape();
 
//u. shark fin
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(200,360);
bezierVertex(265,352,345,355,370,360);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
triangle(235,360,302,297,305,360);
 
fill(0);
noStroke();
quad(235,360,305,360,305,355,238,357);
 
fill(0);
noStroke();
beginShape();
vertex(344,360);
bezierVertex(335,342,370,331,367,360);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(387,360);
bezierVertex(390,351,401,350,405,360);
endShape();
 
//v. 2 cross curve
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(500,288);
bezierVertex(390,296,454,202,500,190);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(500,220);
bezierVertex(492,216,470,223,475,244);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(475,244);
bezierVertex(459,241,451,268,475,269);
bezierVertex(491,265,488,244,475,244);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(453,280);
bezierVertex(467,296,490,287,500,287);
bezierVertex(500,341,431,311,453,280);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(500,287);
bezierVertex(497,277,487,279,482,284);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(471,291);
bezierVertex(474,279,487,283,487,291);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(471,291);
bezierVertex(469,302,487,306,487,291);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(453,280);
bezierVertex(454,276,461,273,464,273);
endShape();
 
// w. right up
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(416,94);
bezierVertex(430,38,410,6,404,0);
endShape();
 
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(416,94);
bezierVertex(450,102,498,74,500,64);
endShape();
 
fill(0);
noStroke();
quad(474,6,500,6,500,0,476,0);
 
stroke(0);
strokeWeight(1);
line(466,6,500,5);
line(474,6,462,42);
line(427,0,428,14);
 
fill(0);
noStroke();
beginShape();
vertex(462,42);
bezierVertex(442,40,443,66,462,63);
bezierVertex(472,63,477,46,462,42);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(427,14);
bezierVertex(413,15,413,36,427,36);
bezierVertex(442,36,445,15,427,14);
endShape();
 
fill(mouseX, mouseY,0);
noStroke();
triangle(382,52,398,68,430,44);
 
fill(0);
noStroke();
triangle(398,68,382,78,408,80);
triangle(422,52,420,47,430,44);
 
fill(mouseX, mouseY,0);
noStroke();
beginShape();
vertex(451,92);
bezierVertex(447,80,464,76,468,87);
endShape();
 
fill(0);
noStroke();
beginShape();
vertex(451,92);
bezierVertex(453,105,472,98,468,87);
endShape();
}





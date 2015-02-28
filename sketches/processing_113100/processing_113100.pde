
//draw joan miro the melancholic singer
//Kang-Yu,Liu

void setup() {
  size(390,488);
  background(233,241,244);
  smooth();
}


void draw(){
  noStroke();
  fill(199,64,9);
  ellipse(88,74,54,49);
  //top left corner
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
 vertex(75,53);
 bezierVertex(75,53,52,20,23,37);
 bezierVertex(23,37,7,60,23,68);
 endShape();
 
beginShape();
vertex(66,63);
 bezierVertex(66,63,43,42,32,77);
 bezierVertex(32,77,22,82,31,105);
endShape();

beginShape();
vertex(63,70);
bezierVertex(63,70,57,60,44,73);
bezierVertex(30,84,57,117,58,116);
endShape();

beginShape();
vertex(246,0);
bezierVertex(246,0,252,38,195,92);
bezierVertex(138,144,90,186,51,288);
bezierVertex(51,288,7,366,47,405);
bezierVertex(84,444,144,390,130,398);
bezierVertex(126,402,192,348,150,323);
bezierVertex(150,323,126,312,105,346);
endShape();

beginShape();
vertex(357,147);
bezierVertex(357,147,253,171,253,171);
bezierVertex(253,171,222,180,205,210);
bezierVertex(205,210,167,263,167,263);
bezierVertex(167,263,141,306,143,353);
bezierVertex(143,353,135,438,195,429);
bezierVertex(195,429,247,442,264,379);
bezierVertex(264,379,268,360,254,297);
bezierVertex(254,297,228,207,300,176);
bezierVertex(300,176,357,158,357,158);
endShape();

beginShape();
vertex(195,288);
bezierVertex(195,288,195,330,187,350);
bezierVertex(187,350,177,464,177,464);
endShape();

beginShape();
vertex(221,274);
bezierVertex(221,274,228,336,221,354);
bezierVertex(221,354,221,475,221,475);
endShape();

beginShape();
vertex(302,416);
bezierVertex(302,416,306,438,293,470);
bezierVertex(293,470,276,496,191,464);
endShape();

strokeWeight(2);
beginShape();
vertex(285,96);
bezierVertex(285,96,351,52,384,141);
bezierVertex(416,230,393,162,377,239);
bezierVertex(377,239,361,270,339,274);
bezierVertex(339,274,303,274,312,250);
bezierVertex(312,250,322,225,337,213);
bezierVertex(337,213,362,182,352,141);
bezierVertex(352,141,354,126,321,120);
bezierVertex(321,120,296,116,289,119);
bezierVertex(289,119,270,112,285,96);
endShape();



strokeWeight(1);
line(139,305,244,305);
line(191,332,265,332);
line(239,323,239,385);
line(334,288,334,375);
line(285,332,372,326);
line(298,284,378,385);
line(369,291,283,375);

noStroke();
fill(0);
beginShape();
vertex(153,130);
bezierVertex(153,130,150,180,166,189);
bezierVertex(166,189,156,198,113,175);
bezierVertex(113,175,126,150,153,130);
endShape();

fill(30,59,13);
beginShape();
vertex(221,8);
bezierVertex(221,8,183,12,153,130);
bezierVertex(153,130,113,175,113,175);
bezierVertex(113,175,78,156,85,99);
bezierVertex(85,99,90,42,221,8);
endShape();





}


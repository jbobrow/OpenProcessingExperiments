
int r;
int sr;

r = 45;
sr = 36;

size(600,600);
background(244,223,192);
translate(-70,45);
scale(1.04);
//broad blue line//
beginShape();
noStroke();
fill(120,211,255);
vertex(70,0);
vertex(700,394);
vertex(700,472);
vertex(0,149);
vertex(-50,-70);
endShape();



//biggest ellipse//
stroke(0);
strokeWeight(28);
fill(38,125,127,170);
ellipse(380,284,310,310);


//smallest ellipses group//
noStroke();
fill(251,94,163);
ellipse(276,42,sr,sr);
fill(53,76,20);
ellipse(341,86,sr,sr);
fill(184,226,216);
ellipse(240,134,r,r);
fill(23,124,120);
ellipse(341,170,sr,sr);
fill(172,50,109);
stroke(255,192,221);
strokeWeight(2);
ellipse(345,249,60,60);
noStroke();
fill(251,94,163);
ellipse(264,302,sr,sr);
fill(210,64,64);
ellipse(351,336,sr,sr);
fill(240,1,7);
ellipse(266,395,40,40);

//orange ellipse//
fill(171,53,11,225);
ellipse(483,156,210,210);


//five lines group//
stroke(0);
strokeWeight(0.8);
line(0,104,700,264);
line(0,141,700,277);
line(0,180,700,292);
line(0,220,700,305);
line(0,259,700,320);

//right ellipse group//
noStroke();
fill(251,94,163);
ellipse(526,28,r,r);
stroke(255);
strokeWeight(4);
ellipse(513,121,r,r);
noStroke();
ellipse(581,190,r,r);
fill(171,218,0);
ellipse(549,285,r,r);
fill(251,94,163);
ellipse(467,318,r,r);



//this must be placed at right below the lines//
//left ellipse group//
fill(88,207,250);
stroke(0);
strokeWeight(4);
ellipse(140,287,r,r);

fill(251,94,163);
strokeWeight(2);
ellipse(147,132,r,r);
noStroke();
ellipse(158,211,r,r);
ellipse(156,438,r,r);
//this must be placed at right below the lines//


//ellipse link lines//
//left
stroke(0);
strokeWeight(2);
line(147,139,156,198);
line(157,216,137,287);
line(140,293,159,434);
//centre
line(274,41,341,84);
strokeWeight(1);
line(341,90,244,131);
strokeWeight(2);
line(244,141,342,169);
strokeWeight(1);
line(272,211,342,244);
strokeWeight(2);
line(341,250,272,296);
line(271,306,346,330);
strokeWeight(3);
line(344,341,271,391);
//right
strokeWeight(2);
line(549,0,526,24);
line(523,32,511,117);
line(520,128,577,183);
line(582,197,552,283);
line(545,288,469,317);
//link lines group end//

//scratch lines group 1
pushMatrix();
translate(58,154);
rotate(radians(-63));
strokeWeight(1);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();

//scratch lines group 2
pushMatrix();
translate(334,28);
scale(0.83);
rotate(radians(12));
strokeWeight(1.2);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();

//scratch lines group 3
pushMatrix();
translate(-27,420);
rotate(radians(-11));
strokeWeight(1);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();

//scratch lines group 4
pushMatrix();
translate(71,415);
rotate(radians(-11));
strokeWeight(1);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();

//scratch lines group 5
pushMatrix();
translate(207,372);
scale(0.58);
rotate(radians(12));
strokeWeight(1.5);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();

//scratch lines group 6
pushMatrix();
translate(441,360);
scale(1.1);
rotate(radians(13));
strokeWeight(1.5);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();

//scratch lines group 7
pushMatrix();
translate(553,465);
scale(0.7);
rotate(radians(-54));
strokeWeight(1.5);
line(0,0,70,72);
line(19,0,89,72);
line(38,0,108,72);
line(50,39,143,3);
line(42,55,136,19);
line(35,72,128,36);
popMatrix();


//this must be placed at bottom//
fill(224,0,5);
noStroke();
ellipse(140,287,17,17);
//this must be placed at bottom//

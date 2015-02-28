
size(600, 600);
 background(241,197,220);
 smooth();
 
//NOSE
stroke(244,153,183);
strokeWeight(2);
line(276,325,247,390);
line(247,390,265,417);
noStroke();
fill(244,153,183);
triangle(289,412,286,419,320,421);
 
//GLASSES
stroke(59,35,20);
strokeWeight(12);
noFill();
bezier(156,270,196,263,241,271,283,303);
bezier(165,270,147,376,256,389,282,305);
bezier(302,304,354,284,387,291,454,314);
bezier(302,307,303,384,428,447,449,314);
line(281,303,302,305);
line(457,315,498,306);
 
//LARGE CIRCLES
noStroke();
fill(195, 154, 107);
ellipseMode(CORNER);
ellipse(159,150,104,104);
ellipse(241,36,104,104);
ellipse(328,-4,104,104);
ellipse(382,42,104,104);
ellipse(457,39,104,104);
ellipse(521,109,104,104);
ellipse(564,201,104,104);
ellipse(488,241,104,104);
ellipse(583,331,104,104);
ellipse(511,428,104,104);
ellipse(432,-18,104,104);
ellipse(548,0,104,104);
ellipse(180,41,104,104);
 
//MEDIUM CIRCLES
noStroke();
fill(168,123,79);
ellipseMode(CORNER);
ellipse(192,504,74,74);
ellipse(89,277,74,74);
ellipse(159,171,74,74);
ellipse(191,87,74,74);
ellipse(324,4,74,74);
ellipse(433,4,74,74);
ellipse(478,59,74,74);
ellipse(441,126,74,74);
ellipse(487,183,74,74);
ellipse(588,225,74,74);
ellipse(574,380,74,74);
ellipse(493,510,74,74);
ellipse(288,81,74,74);

//SMALL CIRCLES
noStroke();
fill(116,76,40);
ellipseMode(CORNER);
ellipse(172,436,45,45);
ellipse(128,333,45,45);
ellipse(202,135,45,45);
ellipse(369,86,45,45);
ellipse(286,51,45,45);
ellipse(474,202,45,45);
ellipse(535,208,45,45);
ellipse(578,343,45,45);
ellipse(229,33,45,45);
ellipse(450,51,45,45);
ellipse(493,442,45,45);

//TINY CIRCLES
noStroke();
fill(96,56,19);
ellipseMode(CORNER);
ellipse(196,558,34,34);
ellipse(154,411,34,34);
ellipse(147,326,34,34);
ellipse(216,93,34,34);
ellipse(387,0,34,34);
ellipse(549,76,34,34);
ellipse(500,124,34,34);
ellipse(507,183,34,34);
ellipse(502,498,34,34);

//EYES
noStroke();
fill(107,153,204);
ellipseMode(CORNER);
ellipse(240,299,19,19);
ellipse(380,311,23,23);

//MOUTH
noStroke();
fill(156,66,122);
triangle(253,455,297,475,285,460);
triangle(276,477,303,464,367,471);
bezier(253,460,265,511,295,514,369,477);

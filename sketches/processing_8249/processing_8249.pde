
size(640,480);
// set background
background(240,222,172);
smooth();
// draw three triangles without stroke
noStroke();
//   the highest one
fill(244,238,222);
triangle(0,480,126,13,261,480);
//   because the opacity effect, 
//   draw the shape on the left and bottom edge
//   then draw the line on the top edge of this shape.
fill(210,225,210);
beginShape();
  vertex(0,403);
  vertex(66,463);
  vertex(88,480);
  vertex(0,480);
endShape();
//   the triangle on the bottom, the part which filled in brown.
fill(162,120,59);
triangle(41,480,226,357,261,480);
//  the short-black line on the bottom edge, above the brown part of the triangle.
stroke(0,0,0);
strokeWeight(5);
line(73,490,142,472);
//   the trignagle on the bottom, the part which filled in green.
//   this part is'nt a triangle, it a quadrangle.
noStroke();
fill(96,135,90);
beginShape();
  vertex(226,357);
  vertex(240,348);
  vertex(325,480);
  vertex(261,480);
endShape(CLOSE);
// draw shapes above the highest triangle.
//  draw the yellow triangle.
noStroke();
fill(248,203,45);
triangle(130,108,165,60,190,108);
//  draw the light-blue circle. 
fill(157,176,174);
ellipse(61,75,35,35);
// the outline-only one.
noFill();
stroke(0,0,0);
strokeWeight(2);
beginShape();
  vertex(3,74);
  vertex(215,214);
  vertex(9,128);
endShape();
//  draw the line across the highest triangle, colored in yellow and black.
stroke(208,190,83);
strokeWeight(8);
line(163,370,269,283);
stroke(0,0,0);
strokeWeight(2);
line(161,368,266,280);
// the one with black and green color filled.
//   the part with green color filled.
fill(119,139,91);
noStroke();
beginShape();
  vertex(0,419);
  vertex(119,254);
  vertex(319,373);
  vertex(121,275);
endShape(CLOSE);
//  the line cross this shape. With red and black color.
stroke(187,105,102);
strokeWeight(3);
line(12,361,229,245);
stroke(0,0,0);
strokeWeight(1);
line(14,363,229,245);
//   the part with black color filled.
noStroke();
fill(0,0,0);
beginShape();
  vertex(0,419);
  vertex(119,254);
  vertex(319,373);
  vertex(118,263);
endShape(CLOSE);
// draw outline of these shape. No fill.
//   the outline of the highest triangle.
noFill();
strokeWeight(3);
stroke(0,0,0);
beginShape();
  vertex(0,480);
  vertex(126,13);
  vertex(261,480);
endShape();
//   the line from the left edge to the bottom.
//     the first part.
strokeWeight(2);
line(0,403,67,462);
//     the second part, has opacity effect.
strokeWeight(2);
stroke(0,0,0,80);
line(67,462,87,480);
//  draw the two arc on the left edge.
//    refrence the whole image to find the center point of these arches.
stroke(0,0,0);
arc(59,283,340,340,PI,radians(255));
arc(119,254,450,450,PI,radians(255));
//  draw circles
//    the concentric circles on the right side of the highest triangle.
strokeWeight(2);
fill(186,196,194);
ellipse(207,123,42,42);
noStroke();
fill(72,102,153);
ellipse(207,123,28,28);
//    the filled circle in the highest triangle.
fill(223,222,201);
ellipse(122,217,40,40);
stroke(0,0,0);
strokeWeight(1);
noFill();
ellipse(122,217,32,32);
//    the concentric circle on the left edge of the picture.(just half-appeared)
fill(243,238,224);
ellipse(0,265,85,85);
strokeWeight(5);
ellipse(0,265,55,55);
//    the red circle which center is out of the panel.
noStroke();
fill(153,60,40);
ellipse(-8,174,28,28);
//  draw the black-white shape on the left edge of the panel.
noFill();
stroke(0,0,0);
strokeWeight(2);
quad(0,324,13,307,24,317,0,343);
noStroke();
fill(0,0,0);
quad(0,324,13,307,24,317,10,333);
//  draw the wave-line across the highest triangle.
noFill();
//  draw the shadow(thick and colored wave line).
stroke(189,139,127);
strokeWeight(4);
arc(122,383,70,70, radians(135), radians(315));
stroke(176,71,73);
strokeWeight(5);
arc(168,336,57,57, radians(135), radians(315));
strokeWeight(4);
arc(225,305,68,68, radians(155), radians(295));
strokeWeight(3);
arc(258,269,30,30, radians(155), radians(295));
//  draw the thin-black line of the wave.
stroke(0,0,0);
strokeWeight(1);
arc(124,385,70,70, radians(135), radians(315));
strokeWeight(2);
arc(170,338,55,55, radians(135), radians(315));
//  draw lines above those wave line.
strokeWeight(1.3);
line(120,345,266,222);
line(91,403,278,229);
//  draw line
strokeWeight(2);
line(25,328,159,264);
strokeWeight(1);
line(22,325,156,261);
//  the graphics on the top edge of the panel.
//  the graphics include lines and arc.
//    two vertical lines.
strokeWeight(1);
line(243,0,243,158);
strokeWeight(2);
line(247,0,247,158);
//    two groups of horizontal lines, the upper one.
strokeWeight(3);
line(227,28,267,28);
//    the lower one.
strokeWeight(1);
line(231,142,268,142);
strokeWeight(2);
line(231,145,268,145);
//    the arc.
strokeWeight(1.3);
arc(257,67,40,40,radians(85),radians(280));

/*
draw the concentric circle with multi colors on the ring.
set center point of the concentric circle.
set diameter of the concentric circle.
(the width and height parameters of the ellispe.)
*/
int x=211;
int y=414;
int D=85;

// the out-line of the concentric-circle.
stroke(0);
fill(0);
ellipse(x,y,D,D);

// the light-color circle in the core of the concentric-circle.
fill(244,238,222);
noStroke();
ellipse(x,y,D-20,D-20);

// the blue arc on the outer-ring of the concentric-circle.
noFill();
strokeCap(SQUARE);
stroke(73,117,156);
strokeWeight(6);

/*
the radians of the arc is referred from other works on Open-processing.
source: http://www.openprocessing.org/visuals/?visualID=6956
*/
arc(x,y,D-8,D-10,4.1,5.05);
arc(x,y,D-8,D-10,1,2.5);
arc(x,y,D-8,D-10,-0.3,0.2);

// yellow arc
stroke(254,203,69);
strokeWeight(6);
arc(x,y,D-8,D-10,-0.6,-0.45);
arc(x,y,D-8,D-10,2.9,3.3);

//  white arc
stroke(255);
strokeWeight(6);
arc(x, y, D-10, D-8, 4.4, 4.425); 
arc(x, y, D-10, D-8, 4.475, 4.5); 
arc(x, y, D-10, D-8, 1.57, 1.61); 
arc(x, y, D-10, D-8, 1.67, 1.71); 
arc(x, y, D-10, D-8, 1.77, 1.81); 
arc(x, y, D-10, D-8, 1.87, 1.91);

// the black circle in the concentric-circle
noStroke();
fill(0);
ellipse(219,411,13,13);

// set focus point of these colorful triangle above the concentric-circle.

int a_x=225;
int a_y=397;
int b_x=230;
int b_y=422;
int c_x=207;
int c_y=404;

// draw triangles.

fill(182,55,0);
triangle(261,355,266,359,a_x,a_y);
triangle(162,393,164,384,c_x,c_y);

fill(255);
quad(247,371,248,375,240,383,238,382);
quad(173,388,178,389,174,397,169,395);
triangle(273,478,279,472,b_x,b_y);

fill(119,111,91);
quad(132,385,139,371,161,383,157,392);

fill(182,55,0);
triangle(243,439,245,435,b_x,b_y);

// draw the seperate black quad.

noFill();
strokeWeight(2);
stroke(0);
ellipse(x,y,D,D);

fill(0);
quad(287,319,295,327,270,352,266,348);
quad(273,467,268,471,265,470,272,465);
quad(265,467,262,464,267,460,269,462);
quad(260,460,258,459,263,455,265,457);

//draw the black-white circle on the green quad.
//draw yellow and red rings first.
strokeWeight(5);
stroke(254,196,61);
fill(209,222,215);
arc(281,412,63,63,4.2,TWO_PI+1);
stroke(196,67,8);
noFill();
arc(281,412,92,92,4.2,TWO_PI+1);
//draw the semi-circle.
noStroke();
fill(0);
ellipse(281,412,30,30);
fill(255);
arc(281,412,28,28,1,4.2);
//the matrix with white and red on the right part of the frame.
noStroke();
fill(243,236,226);
quad(553,342,615,341,614,405,552,402);
fill(191,80,67);
quad(586,343,615,341,615,373,585,371);
fill(223,186,142);
quad(585,371,554,372,551,403,582,403);
stroke(0);
strokeWeight(2.5);
line(549,454,555,298);
line(583,456,586,297);
line(615,455,617,296);
line(502,339,640,343);
line(498,370,640,374);
line(500,401,640,406);

//the net with many color
//paint color on the net
noStroke();
fill(243,236,226);
beginShape();
vertex(335,375);
vertex(290,308);
vertex(323,286);
vertex(279,211);
vertex(640,21);
vertex(640,68);
vertex(468,159);
vertex(485,195);
vertex(369,254);
vertex(380,274);
vertex(479,212);
vertex(471,234);
vertex(377,297);
vertex(419,368);
endShape();
fill(215,134,66);
quad(425,480,353,365,361,357,434,480);
quad(448,480,366,355,378,346,455,480);
quad(485,480,378,298,388,291,490,480);

stroke(0);
triangle(370,256,595,137,380,276);
fill(87,84,72);
quad(350,363,339,347,350,339,361,356);
noStroke();
fill(0);
quad(477,290,506,270,517,290,490,310);
quad(310,265,327,256,338,275,322,286);
quad(315,239,336,228,346,247,326,258);
quad(313,216,301,200,314,190,326,210);
quad(474,179,499,164,510,182,483,196);
quad(535,125,550,115,562,134,542,142);
fill(211,225,194);
quad(366,328,356,335,345,321,357,313);
quad(345,321,335,306,319,314,329,328);
//dark qrey square
fill(172,165,156);
quad(317,312,302,322,291,309,308,297);
quad(323,287,339,277,346,296,333,302);
quad(290,229,306,220,317,238,301,249);
quad(388,222,377,207,404,192,421,207);
quad(460,139,447,121,470,108,482,128);
quad(565,84,554,66,579,52,590,71);
quad(341,201,362,190,373,206,351,218);
quad(362,190,388,177,370,161,350,172);
/*
quad();
quad();
quad();
quad();
*/
//draw the black and red quad near the rings above.
strokeWeight(2);
stroke(0);
fill(193,30,16);
quad(275,480,359,413,367,417,287,480);
fill(251,200,61);
quad(359,413,428,361,431,368,367,417);
fill(0);
quad(428,361,573,252,579,260,431,368);
//line begin on the bottom edge of the frame, left to right.
line(399,480,291,308);
line(425,480,309,296);
line(434,480,276,211);
line(448,480,343,322);
line(455,480,297,200);
line(485,480,315,189);
line(492,480,330,183);
line(350,173,388,225);
line(372,161,421,207);
line(460,139,447,121);
line(482,128,470,108);
line(565,84,554,66);
line(579,52,590,71);
line(380,274,368,280);
//line end on the right edge of the frame, top to down.
line(276,211,640,21);
line(290,228,637,46);
line(301,248,640,69);
line(310,266,500,164);
line(323,285,370,256);
line(378,297,482,228);
line(334,375,377,345);
line(324,357,368,327);
line(313,340,358,311);
line(302,323,348,294);
line(290,309,370,254);



fill(87,84,72);
quad(482,228,498,258,471,277,453,248);

noStroke();
fill(0);
quad(531,176,546,168,554,184,540,193);
quad(541,203,560,192,570,212,554,223);
quad(476,480,325,429,328,425,495,480);
quad(323,359,314,343,330,331,339,346);

// draw circles

fill(12,112,159,98);
ellipse(386,378,95,95);
fill(179,165,158,95);
strokeWeight(3);
stroke(218,91,38);
ellipse(498,231,60,60);
strokeWeight(6);
stroke(213,201,121);
fill(12,112,159,98);
ellipse(498,157,65,65);
noStroke();
fill(184,124,82,98);
ellipse(362,191,75,75);
noFill();
strokeWeight(1);
stroke(0);
ellipse(498,157,68,68);
strokeWeight(3);
fill(243,236,226);
ellipse(590,179,50,50);
fill(186,192,128,99);
ellipse(344,186,80,80);

//draw lonely rectangle on the top-right of the frame.
fill(224,210,112);
rect(417,49,20,18);

//draw the red rectangle above the "Net";
noStroke();
fill(217,46,36,90);
rect(254,195,70,50);
fill(255,42,102);
quad(289,228,279,211,297,200,307,220);




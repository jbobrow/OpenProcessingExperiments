
/* Assignment 1 - DRAW
Simon Wiscombe
CTIN 544 - Experiments in Interactivity II

Drawing Info:
This is a drawing of a Rubick's cube keychain, imperfections et al.
*/

size(640,480);
background(255,248,220);
smooth();

// ----- REAR THIRD ----- //
// black plastic
fill(0,0,0);
stroke(0);
quad(333,81, 377,58, 385,249, 350,278);
quad(377,58, 333,81, 271,68, 227,26);
triangle(333,81, 338,133, 271,68);
quad(319,258, 345,217, 350,278, 324,269);

// Layer squares, grouped by color.
// red
fill(255,0,0);
stroke(255,0,0);
quad(349,220, 384,191, 387,249, 353,278);

// orange
fill(241,90,36);
stroke(241,90,36);
quad(337,81, 379,60, 382,124, 343,149);

// blue
fill(0,0,255);
stroke(0,0,255);
quad(342,153, 382,127, 383,187, 350,216);

// white
fill(255,255,255);
stroke(255,255,255);
quad(278,65, 321,44, 375,54, 333,77);

// green
fill(0,255,0);
stroke(0,255,0);
quad(227,50, 269,34, 320,44, 273,62);

// yellow
fill(255,255,0);
stroke(255,255,0);
triangle(263,32, 243,41, 226,24);

// ----- MIDDLE SECTION ----- //
// black plastic
fill(0,0,0);
stroke(0);
quad(161,31, 214,13, 375,169, 330,199);
quad(329,198, 375,169, 320,259, 307,234);
triangle(143,81, 161,31, 193,62);
triangle(330,199, 307,234, 252,122);

// red
fill(255,0,0);
stroke(255,0,0);
triangle(310,240, 345,217, 319,257);

// orange
fill(241,90,36);
stroke(241,90,36);
quad(331,201, 373,173, 344,216, 303,244);

// old yeller
fill(255,255,0);
stroke(255,255,0);
quad(274,141, 321,115, 370,164, 326,193);

// green
fill(0,255,0);
stroke(0,255,0);
quad(219,86, 268,64, 316,110, 269,136);

// white
fill(255,255,255);
stroke(255,255,255);
quad(161,31, 214,13, 262,58, 210,81);

// ----- FRONT LAYER ----- //
// black plastic
fill(0,0,0);
stroke(0,0,0);
quad(42,138, 156,74, 278,315, 136,330);
quad(156,74, 219,54, 328,275, 278,315);

// red
fill(255,0,0);
stroke(255,0,0);
quad(76,126, 111,110, 145,178, 109,191);
quad(194,256, 238,246, 272,314, 225,319);
quad(143,264, 171,324, 136,329, 109,272);

// orange
fill(241,90,36);
stroke(241,90,36);
quad(153,85, 188,159, 147,175, 112,106);

// yellow
fill(255,255,0);
stroke(255,255,0);
quad(162,78, 220,56, 256,125, 200,154);
quad(156,181, 199,164, 234,235, 190,248);
quad(116,198, 152,183, 186,250, 148,259);
quad(151,266, 190,257, 221,321, 179,325);

// green
fill(0,255,0);
stroke(0,255,0);
quad(206,162, 259,133, 292,202, 243,234);
quad(76,206, 109,194, 139,257, 107,265);

// blue
fill(0,0,255);
stroke(0,0,255);
quad(45, 140, 72,125, 102,189, 74,200);

// white
fill(255,255,255);
stroke(255,255,255);
quad(247,242, 296,209, 327,275, 280,310);

// ---- MAKING THE KEYCHAIN PART ---- //
/*
This entire part, in order to get the layering correct, is gonna look
confusing as hell to someone who doesn't know what I did. Sorry. I'm
basically threading the pieces of the chain into each other so that the
layering is correct. Usually it means splitting each curve or ellipse
into multiple parts and altering their draw order appropriately.
*/

noFill();
strokeWeight(4);

stroke(30,30,32,40);
beginShape();
curveVertex(381,247);
curveVertex(390,243);
curveVertex(404,247);
curveVertex(399,259);
curveVertex(384,254);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(380,246);
curveVertex(389,242);
curveVertex(403,246);
curveVertex(398,258);
curveVertex(383,253);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(379,245);
curveVertex(388,241);
curveVertex(402,245);
curveVertex(397,257);
curveVertex(382,252);
endShape();
/*
// reference!
stroke(0,255,0);
point(398,258);
*/
stroke(30,30,32,40);
arc(406,260,23,25,radians(216),radians(374));
stroke(100,100,110);
arc(405,259,23,25,radians(216),radians(374));
stroke(200,200,200,100);
arc(404,258,23,25,radians(216),radians(374));

stroke(30,30,32,40);
beginShape();
curveVertex(410+1,246+1);
curveVertex(410+1,264+1);
curveVertex(418+1,271+1);
curveVertex(434+1,261+1);
curveVertex(441+1,265+1);
curveVertex(430+1,265+1);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(410,246);
curveVertex(410,264);
curveVertex(418,271);
curveVertex(434,261);
curveVertex(441,265);
curveVertex(430,265);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(410-1,246-1);
curveVertex(410-1,264-1);
curveVertex(418-1,271-1);
curveVertex(434-1,261-1);
curveVertex(441-1,265-1);
curveVertex(430-1,265-1);
endShape();

stroke(30,30,32,40);
arc(406,260,23,25,radians(15),radians(215));
stroke(100,100,110);
arc(405,259,23,25,radians(15),radians(215));
stroke(200,200,200,100);
arc(404,258,23,25,radians(15),radians(215));

stroke(30,30,32,40);
beginShape();
curveVertex(404,247);
curveVertex(399,259);
curveVertex(384,254);
curveVertex(381,247);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(403,246);
curveVertex(398,258);
curveVertex(383,253);
curveVertex(380,246);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(403,245);
curveVertex(397,257);
curveVertex(382,252);
curveVertex(379,245);
endShape();

stroke(30,30,32,40);
beginShape();
curveVertex(456,273);
curveVertex(468,278);
curveVertex(465,266);
curveVertex(451,271);
curveVertex(436,265);
curveVertex(435,249);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(455,272);
curveVertex(467,277);
curveVertex(464,265);
curveVertex(450,270);
curveVertex(435,264);
curveVertex(434,248);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(454,271);
curveVertex(466,276);
curveVertex(463,264);
curveVertex(449,269);
curveVertex(434,263);
curveVertex(433,247);
endShape();

stroke(30,30,32,40);
beginShape();
curveVertex(467,288);
curveVertex(460,274);
curveVertex(474,271);
curveVertex(477,281);
curveVertex(473,300);
curveVertex(467,288);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(466,287);
curveVertex(459,273);
curveVertex(473,270);
curveVertex(476,280);
curveVertex(472,299);
curveVertex(466,287);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(465,286);
curveVertex(458,272);
curveVertex(472,269);
curveVertex(475,279);
curveVertex(471,298);
curveVertex(465,286);
endShape();

strokeWeight(6);
stroke(30,30,32,40);
arc(482,384,150,150,radians(260),radians(360));
stroke(100,100,110);
arc(480,382,150,150,radians(260),radians(360));
stroke(200,200,200,100);
arc(478,380,150,150,radians(260),radians(360));

strokeWeight(4);
stroke(30,30,32,40);
ellipse(473,304,20,25);
stroke(100,100,110);
ellipse(472,303,20,25);
stroke(200,200,200,100);
ellipse(471,302,20,25);

stroke(30,30,32,40);
beginShape();
curveVertex(473,300);
curveVertex(467,288);
curveVertex(473,300);
curveVertex(467,288);
curveVertex(460,274);
curveVertex(474,271);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(472,299);
curveVertex(466,287);
curveVertex(472,299);
curveVertex(466,287);
curveVertex(459,273);
curveVertex(473,270);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(471,298);
curveVertex(465,286);
curveVertex(471,298);
curveVertex(465,286);
curveVertex(458,272);
curveVertex(472,269);
endShape();

stroke(30,30,32,40);
beginShape();
curveVertex(437,278);
curveVertex(436,264);
curveVertex(442,259);
curveVertex(456,272);
curveVertex(468,277);
curveVertex(465,265);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(436,278);
curveVertex(435,264);
curveVertex(443,259);
curveVertex(455,272);
curveVertex(467,277);
curveVertex(464,265);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(435,278);
curveVertex(434,264);
curveVertex(442,259);
curveVertex(454,272);
curveVertex(466,277);
curveVertex(463,265);
endShape();

stroke(30,30,32,40);
beginShape();
curveVertex(434+1,261+1);
curveVertex(441+1,265+1);
curveVertex(430+1,265+1);
curveVertex(417+1,258+1);
curveVertex(410+1,264+1);
curveVertex(410+1,280+1);
endShape();

stroke(100,100,110);
beginShape();
curveVertex(434,261);
curveVertex(441,265);
curveVertex(430,265);
curveVertex(417,258);
curveVertex(410,264);
curveVertex(410,280);
endShape();

stroke(200,200,200,100);
beginShape();
curveVertex(434-1,261-1);
curveVertex(441-1,265-1);
curveVertex(430-1,265-1);
curveVertex(417-1,258-1);
curveVertex(410-1,264-1);
curveVertex(410-1,280-1);
endShape();

strokeWeight(6);
stroke(30,30,32,40);
arc(482,384,150,150,radians(1),radians(255));
stroke(100,100,110);
arc(480,382,150,150,0,radians(258));
stroke(200,200,200,100);
arc(478,380,150,150,radians(1),radians(260));



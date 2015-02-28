
//stadia med

size(640,480);
background(224,225,180);
smooth();
//lines under the weather
stroke(1);
strokeWeight(2.5);
line(323,367,  509,291);
line(410,358,  515,310);
line(114,423,  112,480);
line(384,194,  643,114);
line(327,262, 518,235);
line(0,83,  260,58);
//italian flag
noStroke();
fill(23,79,56);
quad(507,159, 531,134, 531,328,501,339);
fill(255,255,255);
quad(531,134, 555,112, 555,317, 531,328);
fill(204,47,54,255);
quad(555,112, 579,90, 578,306, 555,317);

//grey matter
fill(152,151,131);
quad(51,0, 86,0, 86,60, 51,60);
quad(199,88, 244,88, 244,213, 199,213);
quad(439,4, 475,8, 456,182, 431,190);

stroke(1);
strokeWeight(2.5);
line(0,225,  641,189);

noStroke();
//WHITE and LIGHT BLUE and brown quads
fill(88,180,216);
quad(0,451, 334,451, 334,466, 0,466);
fill(255,255,255);
quad(424,373, 469,373, 299,480, 254,480);
quad(499,69, 561,62, 454,142, 406,142);
quad(153,440, 191,445, 135,480, 91,480);
  //japanese flag
quad(301,330, 333,315, 330,394, 299,400);
fill(93,56,48,255);
quad(138,62, 141,70, 413,0, 380,0);
fill(204,47,54,255);
ellipse(315,350,16,23);


//BLUE QUADS
fill(2,101,163);
quad(0,171, 631,213, 635,215, 0,200);
quad(41,231, 151,148, 295,165, 123,231);
quad(576,144, 597,143, 642,184, 642,202);

fill(35,81,162);
quad(319,348, 640,348, 640,352, 317,356);
//GREEN AND PURPLE QUADS
fill(23,79,56);
quad(65,311, 192,311, 192,328, 65,328);
quad(420,0, 605,0, 605,7, 419,30);
fill(86,89,131);
quad(0,315, 43,315, 43,331, 0,331);

//yullow floats
/*beginShape();
noStroke();
fill(243,184,48,255);
bezier(80,41,245,-42, 297,-51,333,-4);
vertex(333,-4);
vertex(325,30);
bezier(325,30,276,21, 149,33,80,64);
vertex(80,64);
vertex(80,41);
endShape(CLOSE);
*/

 //trailing arrows
fill(0,0,0);
triangle(569,167, 600,184, 592,191);
triangle(553,140, 545,148, 534,131);
triangle(513,111, 522,104, 503,95);
triangle(413,7, 443,24, 439,32);

//blue quads
fill(35,81,162);
quad(45,52, 75,52, 75,119, 45,119);
quad(134,195, 533,100, 533,105, 138,201);

stroke(1);
strokeWeight(2.5);


//HORIZONTAL LINES

line(0,20,  175,-1);
line(260,58,  617,-1);
line(0,158,  442,126);
line(442,126,  640, 92);
line(0,158,  442,126);
line(0,277,  327,262);
line(30,422,  326,418);
line(50,194,  440,177);

line(-1,285,  63,282);
line(-1,399,  63,396);
line(78,155, 599,-1);
line(61,371,  104,321);
line(52,368, 90,344);

//VERTICAL LINES
line(4,0,  0,112);
line(42,19,  42,256);
line(42,19,  52,-1);
line(73,9,  73,253);
line(150,-1,  145,88);
line(178,-1,  174, 85);
line(265,-1,  266,96);
line(112,106,  112,190);
line(307,184,  302,253);
line(183,187,  180,245);
line(36,300,  354,206);

//line quads
noFill();
strokeWeight(2.5);
quad(101,32, 165,32,  165,81, 101,81);
quad(172,109, 239,109, 240,179, 172,182);
quad(259,104, 320,105, 320,176, 259,178);
line(335,181,  337,103);
line(337,103,  402,101);
line(402,101, 399,178);


//lines stayin' on top, keepin' it real!


noStroke();
//---------------------------------------------
//triangles +translate 

//mid row 1
pushMatrix();
//blue triangle
beginShape();
noStroke();
fill(43,73,132,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
//////red triangle
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////blue
translate(30,-7);
beginShape();
noStroke();
fill(43,73,132,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
/////// white
translate(30,-7);
beginShape();
noStroke();
fill(255,255,255,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
//////red triangle
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
///////blue
translate(30,-7);
beginShape();
noStroke();
fill(43,73,132,255);
vertex(125,259);
vertex(153,252);
vertex(139,313);
endShape(CLOSE);
popMatrix();

//bottom triangle line
pushMatrix();
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,351);
vertex(153,344);
vertex(139,409);
endShape(CLOSE);
/////// white
translate(30,-7);
beginShape();
noStroke();
fill(255,255,255,255);
vertex(153,344);
vertex(125,351);
vertex(139,409);
endShape(CLOSE);
/////// white
translate(30,-7);
beginShape();
noStroke();
fill(255,255,255,255);
vertex(153,344);
vertex(125,351);
vertex(139,409);
endShape(CLOSE);
/////// white
translate(30,-7);
beginShape();
noStroke();
fill(255,255,255,255);
vertex(153,344);
vertex(125,351);
vertex(139,409);
endShape(CLOSE);
/////// blue
translate(30,-7);
beginShape();
noStroke();
fill(43,73,132,255);
vertex(153,344);
vertex(125,351);
vertex(139,409);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,351);
vertex(153,344);
vertex(139,409);
endShape(CLOSE);
///////red
translate(30,-7);
beginShape();
noStroke();
fill(204,47,54,255);
vertex(125,351);
vertex(153,344);
vertex(139,409);
endShape(CLOSE);
/////// blue
translate(30,-7);
beginShape();
noStroke();
fill(43,73,132,255);
vertex(153,344);
vertex(125,351);
vertex(139,409);
endShape(CLOSE);
popMatrix();

//top triangle line
///////red
pushMatrix();
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////white
beginShape();
noStroke();
fill(255,255,255,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////blue
beginShape();
noStroke();
fill(43,73,132,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////blue
beginShape();
noStroke();
fill(43,73,132,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
popMatrix();

//CROPPED TOP TRIANGLE LINE
//top triangle line
///////blue
pushMatrix();
translate(0,-96);
pushMatrix();
beginShape();
noStroke();
fill(43,73,132,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////blue
beginShape();
noStroke();
fill(43,73,132,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////red
beginShape();
noStroke();
fill(204,47,54,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
///////blue
beginShape();
noStroke();
fill(43,73,132,255);
vertex(427,96);
vertex(457,89);
vertex(444,151);
endShape(CLOSE);
translate(30,-7);
popMatrix();
popMatrix();
//-----------------------------triangles DONE


//corner-happy-lonely orange triangle
beginShape();
noStroke();
fill(229,109,57,2345);
vertex(601,430);
vertex(637,479);
vertex(566,479);
endShape(CLOSE);

//---------------------------------------

//CURVALICIOUSNESS
noFill();
stroke(250,40,50,255);
strokeWeight(2.5);
bezier(0,70,243,156, 313,294,260,396);
bezier(171,0, 293,120, 210,336, 61,464);
stroke(0,0,0,255);
bezier(267,9,318,15, 404,19,477,12);
bezier(477,12,507,9, 545,24,559,35);
bezier(559,35,576,46, 608,60,633,58);
bezier(640,212,629,223, 576,233,549,240);
bezier(548,246,520,255, 460,264,462,284);
bezier(49,367,58,375, 66,374,80,371);

//-------and to top it all off!
fill(250,40,50,255);
noStroke();
triangle(185,438, 230,438, 208,459);
fill(243,184,48);
quad(368,183, 437,181, 439,196, 346,197);
fill(43,73,132,255);
quad(212,55, 298,54, 281,77, 222,77);

fill(54,115,168);
quad(338,443, 430,443, 430,446, 338,446);
quad(339,453, 431,453, 431,456, 339,456);




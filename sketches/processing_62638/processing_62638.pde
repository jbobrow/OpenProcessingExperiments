
/*
ACCD Summer 2012
ID02
1a Draw
Charlene Chen
05/25/2012
*/

size(640,480);
smooth();

background(197,200,166);

//gray pink shapes in the background
fill(186,178,155);
stroke(119,110,99, 100);
quad(125,278, 640,178, 640,354, 126, 409);
noStroke();
quad(0,418, 347,418, 178,480, 0, 480);

//gray lines in the background
noFill();
stroke(119,110,99);
beginShape();
vertex(0,480);
bezierVertex(214,51, 1065,410, 640,229);
endShape();

beginShape();
vertex(32,480);
bezierVertex(457,187, 820,390, 640,288);
endShape();

beginShape();
vertex(89,480);
bezierVertex(458,223, 820,410, 640,319);
endShape();

beginShape();
vertex(71,480);
bezierVertex(154,168, 985,300, 568,234);
endShape();

beginShape();
vertex(332,480);
bezierVertex(500,345, 780,335, 640,342);
endShape();

beginShape();
vertex(506,480);
bezierVertex(599,398, 680,385, 640,392);
endShape();

beginShape();
vertex(536,480);
vertex(526,465);
vertex(578,465);
endShape();

//left green rect
fill(13,95,72, 200);
stroke(13,95,72);
quad(59,40, 64, 376, 245,384, 244,71);


//purple 1
fill(57,43,86, 240);
stroke(45,41,70);
quad(0,264, 0, 342, 189,480, 291,480);

//purple 2
fill(57,43,86, 230);
stroke(45,41,70);
quad(317,383, 396,392, 515,480, 443,480);

//pink line
fill(207,165,143);
noStroke();
quad(0,3, 0, 38, 640,83, 640,48);

//riight green rect
fill(57,96,70,230);
stroke(57,96,70);
quad(565,0, 556,356, 640,393, 640,0);

//white center right rect
fill(191,195,190, 220);
stroke(191,195,190);
quad(330,380, 324,94, 512,100, 518,397);

//red bottom left rect
fill(173,51,45,250);
stroke(173,51,45);
strokeWeight(1);
beginShape();
vertex(139,480);
vertex(133,389);
vertex(298,283);
vertex(314,441);
bezierVertex(267,427, 215,452, 241,439);
bezierVertex(188,469, 173,490, 179,480);
endShape();

//black lines
stroke(0);
strokeWeight(4);
line(0,19, 640,271);
line(84,127, 362,152);
line(640,248, 0,191);
line(640,393, 0,169);
line(640,386, 443,380);
line(640,360, 71,313);

//left blue rect
fill(0,55,110,253);
strokeWeight(1);
stroke(0,55,110);
quad(4,10, 10,266, 93,266, 82,9);


//red cross
fill(178,58,58,240);
stroke(178,58,58);
smooth();
beginShape();
vertex(0,0);
vertex(19,0);
vertex(18,22);
vertex(67,20);
vertex(67,43);
vertex(18,44);
vertex(18,74);
vertex(0,74);
endShape();

//pink center rect
fill(174,74,105);
stroke(164,64,97);
beginShape();
vertex(188,84);
vertex(199,194);
bezierVertex(280,153, 427,154, 360,155);
bezierVertex(509,159, 534,179, 522,169);
vertex(512, 40);
endShape();

//black lines
stroke(0);
strokeWeight(4);
line(88,127, 362,152);

noFill();
strokeWeight(2);
beginShape();
vertex(640,41);
vertex(433,59);
vertex(595,129);
vertex(640,130);
endShape();

beginShape();
vertex(640,174);
vertex(535,165);
vertex(353,72);
vertex(179,53);
endShape();

line(537,104, 640,97);

//right blue rect
strokeWeight(1);
fill(41,72,149,250);
stroke(0,55,110);
quad(501,103, 508,244, 541,247, 536,104);

/*
//light blue line
fill(68,137,186,250);
stroke(73,157,205);
quad(0,253, 0,296, 54,480, 70,480);
*/

//black lines
stroke(0);
strokeWeight(4);
line(0,433, 282,478);

/*
//red bottom left rect
fill(173,51,45,250);
stroke(173,51,45);
strokeWeight(1);
beginShape();
vertex(139,480);
vertex(133,389);
vertex(298,283);
vertex(314,441);
bezierVertex(267,427, 215,452, 241,439);
bezierVertex(188,469, 173,490, 179,480);
endShape();
*/

/*
//red center bottom left shape 
fill(179,45,49,250);
stroke(179,45,49);
quad(253,480, 253,317, 333,433, 330,480);

//white center bottom left shape 
fill(238,237,222,240);
stroke(238,237,222);
quad(289,480, 253,317, 333,433, 320,480);

//blue line
strokeWeight(7);
stroke(0,55,110);
strokeCap(ROUND);
line(118,418, 640,280);
*/

//lower brown line
fill(68,35,27,245);
stroke(68,35,27);
strokeWeight(1);
quad(0,239, 0,253, 640,355, 640,346);

//upper brown line
fill(99,65,47,250);
stroke(99,65,47);
quad(166,0, 277,0, 640,72, 640,90);

/*
//red center bottom left shape 
fill(179,45,49,250);
stroke(179,45,49);
quad(253,480, 253,317, 333,433, 330,480);

//white center bottom left shape 
fill(238,237,222,240);
stroke(238,237,222);
quad(289,480, 253,317, 333,433, 320,480);
*/

//red lower right rect 1
fill(191,47,54, 230);
stroke(191,47,54);
quad(464,384, 640,407, 640,453, 475,433);

//red lower right rect 2
fill(191,47,54, 220);
stroke(191,47,54);
quad(496,410, 613,331, 613,354, 534,411);

//black lines
noFill();
stroke(0);
strokeWeight(4);
line(0,281, 601,458);
line(591,376, 600,454);

strokeWeight(1);
line(600,454, 592,385);


//light blue line
strokeWeight(1);
fill(68,137,186,250);
stroke(73,157,205);
quad(0,253, 0,296, 54,480, 70,480);

//red center bottom left shape 
fill(179,45,49,250);
stroke(179,45,49);
quad(253,480, 253,317, 333,433, 330,480);

//white center bottom left shape 
fill(238,237,222,240);
stroke(238,237,222);
quad(289,480, 253,317, 333,433, 320,480);

//blue line
strokeWeight(7);
stroke(0,55,110);
strokeCap(ROUND);
line(118,418, 640,280);

//gray center bottom shape
strokeWeight(1);
fill(139,144,129, 250);
stroke(139,144,129);
quad(344,362, 395,361, 398,480, 346,480);

//gray bottom right shape
fill(139,144,129, 250);
stroke(139,144,129);
quad(602,439, 640,443, 640,480, 605,480);

//bottom right blue rect
fill(41,72,149,250);
stroke(0,55,110);
quad(576,453, 623,455, 623,480, 576,480);

//blue circles
fill(55,105,161,240);
stroke(55,105,161);
ellipse(601,466, 22,22);
ellipse(481,450, 22,22);

//shark fins ATTEMPT
fill(13,51,74,250);
stroke(13,51,74);
beginShape();
//vertex(315,162);
vertex(270,175);
bezierVertex( 247,115, 209,79, 229,97);
bezierVertex(173,47, 132,32, 152,40);
bezierVertex(269,62, 363,260, 315,162);
endShape();

beginShape();
vertex(231,205);
vertex(203,216);
bezierVertex(202,161, 99,103, 149,128);
bezierVertex(230,155, 227,258, 231,205);
endShape();

beginShape();
vertex(175,238);
vertex(143,254);
bezierVertex(139,205, 62,166, 100,186);
bezierVertex(161,200, 191,276, 175,238);
endShape();

triangle(82,297, 103,270, 111,280);

//light blue rounded line
strokeWeight(10);
strokeCap(ROUND);
fill(21,116,170, 250);
stroke(21,116,170);
line(283,153, 358,269);

//blue lines
strokeWeight(7);
strokeCap(SQUARE);
stroke(0,55,110);
line(79,49, 198,480);
line(354,0, 463,480);

strokeCap(ROUND);
line(382,341, 414,480);

stroke(41,83,168);
line(0,86, 640,20);

//orange triangle
strokeWeight(1);
fill(224,107,46,240);
stroke(224,107,46);
triangle(621,148, 640,144, 640,209);

//yellow shapes
fill(234,172,50, 245);
stroke(234,172,50);
quad(64,338, 184,336, 183,345, 76,347);
quad(75,387, 184,386, 184,396, 66,397);

//upper right purple triangle
fill(89,86,143,240);
stroke(89,86,143);
triangle(471,0, 533,0, 471,45);

//gray blue arc
noFill();
strokeWeight(10);
stroke(56,87,97);
strokeCap(ROUND);
beginShape();
vertex(513,0);
bezierVertex(486,50, 505,131, 495,76);
endShape();

//black lines
stroke(0);
strokeWeight(4);
line(368,356, 383,480);
line(403,347, 416,480);

noFill();
strokeWeight(7);
beginShape();
vertex(273,444);
//bezierVertex(421,132, 277,260, 567,7);
bezierVertex(412,-30, 730,-85, 670,-60);
endShape();

beginShape();
vertex(620,480);
bezierVertex(632,421, 645,410, 640,416);
endShape();


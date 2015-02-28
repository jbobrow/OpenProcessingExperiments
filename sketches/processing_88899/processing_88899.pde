
//Valentina Pherson
//February 10, 2013
//Picasso Slice

size (183, 276);
//layer 1
//green 1a
strokeWeight(5);
fill(71, 98, 28);
beginShape();
vertex (0,0);
vertex (134,0);
vertex (134,60);
vertex (40,67);
vertex (36,218);
vertex (0,100);
endShape (CLOSE);
//white 1
fill(218, 216, 170);
beginShape();
triangle (0,100,36, 218, 0, 276);
endShape (CLOSE);
//green 1b
fill(71, 98, 28);
beginShape();
triangle (36, 218,164,276, 0, 276);
endShape (CLOSE);
//yellow 1
fill(218, 168, 5);
beginShape();
vertex (36,218);
vertex (40,67);
vertex (134,60);
vertex (183,97);
vertex (183, 276);
vertex (164, 276);
endShape (CLOSE);
//blue 1
strokeWeight(0);
fill(133, 167, 133);
beginShape();
triangle (134,60,134, 0, 183, 0);
endShape (CLOSE);
//green 1c
strokeWeight(5);
fill(71, 98, 28);
beginShape();
triangle (134,60, 183, 0, 183, 97);
endShape (CLOSE);
//white 1b
strokeWeight(0);
fill(218, 216, 170);
rect(127,0,7,60);

//layer 2
//yellow 2a
strokeWeight(4);
fill(218, 168, 5);
rect(31,0, 9, 218);
//yellow 2b
fill(218, 168, 5);
triangle(0,0,127,0,108, 24);
//black 2a
strokeWeight(0);
fill(35, 17, 5);
triangle(127,0,127,60,40,67);
//white 2a
strokeWeight(4);
fill(218, 216, 170);
rect(36, 218,8,58);
//white 2b
beginShape();
vertex (36,218);
vertex (168,276);
vertex (139,276);
vertex (33,229);
endShape (CLOSE);
//yellow 2c
fill(170, 112, 16);
strokeWeight(0);
beginShape();
vertex (36,210);
vertex (183,179);
vertex (183,192);
vertex (41,225);
endShape (CLOSE);

//layer 3
//white 3a
fill(218, 216, 170);
beginShape();
vertex (36,210);
vertex (40,67);
vertex (51,67);
vertex (61,200);
vertex (91,201);
endShape (CLOSE);
//white circle
fill(218, 216, 170);
ellipse(40,217,30,30);
//black 3a
fill(35, 17, 5);
beginShape();
vertex (61,200);
vertex (59,78);
vertex (141,75);
vertex (183,116);
vertex (183,172);
endShape (CLOSE);
//green 3a
fill(71, 98, 28);
beginShape();
curveVertex(70,87);
curveVertex(70,87);
curveVertex(183,151);
curveVertex(68,175);
curveVertex(68,175);
endShape (CLOSE);
//blue3a
fill(52, 122, 121);
beginShape();
vertex (70,87);
vertex (97,100);
vertex (102,170);
vertex (68,175);
endShape (CLOSE);
//red 3a
strokeWeight(4);
fill(169, 19, 4);
beginShape();
vertex (40,62);
vertex (54,62);
vertex (70,50);
vertex (70,90);
vertex (55,75);
vertex (40,76);
endShape (CLOSE);

//layer4
//white 4a
fill(218, 216, 170);
beginShape();
vertex (70,70);
vertex (75,70);
vertex (90,84);
vertex (104,121);
vertex (104,143);
vertex (84,143);
vertex (86,121);
vertex (79,86);
vertex (70,80);
endShape (CLOSE);

//pond ripples
strokeWeight(0);
ellipse(86,150,20,8);
ellipse(86,164,20,8);
ellipse(90,157,20,8);
ellipse(86,140,20,8);
ellipse(96,144,20,8);
ellipse(75,130,15,8);
ellipse(109,150,20,8);
ellipse(109,160,20,8);
ellipse(104,167,13,8);

//bottom leaves
//leaf 1
strokeWeight(4);
fill(71, 98, 28);
beginShape();
triangle(100,276,88,243,118,276);
endShape (CLOSE);
//leaf 3
beginShape();
triangle(119,276,145,229,131,276);
endShape (CLOSE);
//leaf 4
beginShape();
triangle(128,276,169,245,144,276);
endShape (CLOSE);
//leaf 2
beginShape();
triangle(119,276,111,228,131,276);
endShape (CLOSE);
//leaf 6
beginShape();
triangle(160,276,181,214,176,276);
endShape (CLOSE);
//leaf5
beginShape();
triangle(163,276,161,222,172,276);
endShape (CLOSE);

//black circles
//circles top middle
fill(35, 17, 5);
ellipse(56,22,10,10);
ellipse(49,36,10,10);
ellipse(62,42,10,10);
ellipse(49,50,10,10);
ellipse(77,27,10,10);
//circles top right
ellipse(162,66,10,10);
ellipse(174,77,10,10);
ellipse(180,42,20,20);
ellipse(147,46,10,10);
ellipse(158,30,10,10);
ellipse(144,33,10,10);
ellipse(175,14,17,17);
//circles bottom middle
ellipse(84,268,12,12);
ellipse(72,260,12,12);
//circles top left
ellipse(11,16,32,8);
ellipse(11,30,32,6);
ellipse(11,45,32,6);
ellipse(11,60,32,6);
ellipse(11,75,32,6);
ellipse(11,90,32,6);
ellipse(14,105,22,6);
ellipse(16,120,20,6);
ellipse(19,135,14,6);
ellipse(20,150,12,6);
//yellow circle pond
fill(170, 112, 13);
ellipse(122,90,26,20);

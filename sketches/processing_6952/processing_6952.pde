
size (640, 480);
background (204, 190, 164);
smooth (); 

//white top
noStroke();
fill(255);
quad (274, 56, 385, -1, 451, 6, 235, 116);
quad (113, 91, 264, 14, 300, 84, 155, 160);

//white stripes
noStroke();
fill(255);
quad (220, 221, 412, 96, 400, 140, 235, 251);


//pink square
noStroke ();
fill(210, 73, 103, 180);
quad (0, 51, 112, 51, 112, 161, 0, 161);


//orange circle
strokeWeight (5);
stroke (0);
fill(212, 131, 45);
ellipse (150, 50, 160, 160);

//dark orange circle
strokeWeight (1);
stroke (50);
fill(188, 97, 50);
ellipse (185, 38, 140, 160); 

//teal circle
strokeWeight (1);
stroke (50);
fill(147, 175, 150);
ellipse (170, 38, 125, 165); 

//light green square
noStroke();
fill (183, 184, 140);
quad (122, 41, 158, 22, 184, 54, 141, 78);

//dark green square
noStroke();
fill (51, 65, 65);
quad (158, 21, 204, -5, 240, 26, 184, 54);

//mud green square
noStroke();
fill (114, 108, 76);
quad (141, 78, 184, 54, 212, 90, 161, 116);


//colored sqaures in grid
noStroke();
//big blue
fill(195, 204, 219);
quad (555, 350, 617, 353, 613, 402, 557, 400);
//big pink
fill(206, 151, 146);
quad (554, 406, 615, 407, 614, 463, 553, 461);
//half pink
fill (209, 51, 65);
quad(620, 351, 680, 352, 680, 407, 619, 403);
//half blue
fill(195, 204, 219);
quad (619, 407, 680, 409, 680, 465, 619, 461);

//white
fill(255);
quad (46, 279, 176, 198, 295, 399, 179, 481);

//orange slice
noStroke();
fill(209, 123, 64);
quad (216, 263, 235, 251, 361, 481, 344, 479);

//orange slice 2
noStroke();
fill (187, 109, 63);
quad(197, 181, 539, 0, 554, 0, 220, 220);

//cream squares between orange slices
noStroke();
fill (230, 226, 223);
quad (176, 196, 197, 181, 235, 251, 216, 263);

//white stripes
noStroke();
fill(255);
quad (117, 180, 178, 146, 196, 179, 138, 217);

noStroke();
fill(255);
quad (180, 148, 396, 36, 415, 64, 197, 180);


//black 2, 3
noStroke();
fill(0);
quad (100, 149, 136, 129, 155, 161, 117, 180);

//black line bottom pink triangle
strokeWeight(3);
stroke(0);
line (76, 161, 105, 161);

//black, 1, 4
noStroke();
fill(0);
quad (83, 197, 115, 180, 138, 218, 108, 239);

//black bottom grid, 1, 3
quad (85, 338, 120, 318, 143, 358, 110, 380);

//gray above blue circle, 2, 4
fill (42, 40, 45);
quad (144, 357, 167, 342, 180, 370, 166, 391);

//blue circle bottom left
strokeWeight(.5);
stroke(0);
fill(7, 95, 159);
ellipse (235, 420, 160, 170);

//blue circle dark area 1
noStroke();
fill(20, 41, 60);
triangle (159, 390, 177, 360, 184, 377);

//blue circle dark area 2
noStroke();
quad (183, 357, 208, 340, 216, 357, 191, 373);

//blue circle dark area 3
noStroke();
fill(8, 75, 130);
quad (166, 391, 184, 379, 224, 452, 208, 463);

//blue circle dark 4
quad (190, 370, 215, 359, 254, 428, 236, 442);

//blue circle dark rect 1
noStroke();
fill(30, 42, 56);
quad(186, 480, 209, 461, 216, 480, 205, 480);
//blue cirlc dark rect 2
fill (49, 68, 74);
quad (209, 463, 225, 450, 233, 465, 216, 477);
//blue cirlc dark rect 3
fill (37, 58, 75);
quad (224, 451, 236, 442, 244, 455, 232, 464);

//blue cirlc dark rect 4
fill (49, 68, 74);
quad (237, 442, 255, 428, 262, 443, 245, 455);

//blue cirlc dark rect 5
fill (27, 44, 60);
quad (255, 427, 296, 397, 304, 410, 263, 441);

//blue cirlc dark rect 6
fill (62, 70, 72);
quad (296, 398, 309, 387, 318, 402, 305, 411);

//black 24
noStroke();
fill(33, 26, 33);
quad (310, 387, 594, 172, 604, 187, 317, 401);


//dark pink triangle 1
noStroke();
fill (184, 30, 45);
triangle (72, 51, 112, 51, 112, 161);

//dark pink triangle 2
noStroke();
fill (184, 30, 45);
triangle (112, 142, 112, 161, 77, 161);

//dark pink triangle 3
noStroke();
fill (184, 30, 45);
triangle (76, 110, 97, 100, 98, 147);

//dark pink triangle 4
noStroke();
fill (184, 30, 45);
triangle (98, 147, 112, 145, 89, 100);

//black sqaure
fill (0);
quad (70, 64, 92, 55, 111, 90, 91, 104);


//orange circle
strokeWeight (5);
stroke (0);
noFill();
ellipse (150, 50, 160, 160);

//top right gray circle
strokeWeight (5);
stroke(0);
fill (233, 231, 232);
ellipse(620, 20, 100, 100);



//bottom grid
strokeWeight(4);
line (620, 250, 615, 480);
line (555, 250, 550, 480);
line (450, 345, 640, 350);
line (445, 400, 640, 405);
line (445, 460, 640, 465);


//BOTTOM LEFT
//black diagonal
fill(0);
quad (0, 361, 42, 303, 54, 318, 7, 370);

//green diagonal
strokeCap(SQUARE);
strokeWeight(6);
stroke(90, 103, 46);
line (13, 363, 88, 404);
strokeWeight(4);
line (88, 404, 100, 411);

strokeCap(ROUND);
//black diagonal
stroke(0);
strokeWeight(4);
line (0, 350, 84, 399);
strokeWeight(3);
line (84, 399, 90, 403);

//peach arc
noFill();
strokeWeight(7);
stroke(240, 68, 52);
ellipse (11, 478, 185, 185);

strokeWeight(1);
stroke(10);
ellipse (11, 478, 181, 181);

//yellow arc
noFill();
strokeWeight(7);
stroke(243, 181, 0);
ellipse (11, 478, 110, 110);

strokeWeight(1);
stroke(10);
ellipse (11, 478, 106, 106);

//light blue arc
strokeWeight(7);
stroke(200, 209, 225);
fill (200, 209, 225);
ellipse (11, 478, 98, 98);

//black detail
strokeWeight(1);
stroke(0);
fill(0);
ellipse (11, 478, 47, 47);

strokeWeight(1);
stroke(0);
ellipse (11, 478, 47, 47);

strokeWeight(1);
stroke(255);
fill(255);
triangle (5, 459, 17, 480, -10, 480);



//teal detail
strokeWeight(.5);
stroke(0);
fill(20, 53, 47);
triangle (0, 442, 7, 457, -3, 466);

//black boxes
fill(0);
quad (407, 245, 463, 207, 488, 247, 432, 286);



//black squares top right
noStroke();
fill(0);
quad (512, 28, 542, 10, 558, 41, 529, 59);
quad (532, 78, 567, 57, 588, 94, 554, 116);
quad (397, 36, 453, 5, 475, 35, 417, 66);

//yellow circle top
strokeWeight(2);
fill(212, 190, 104);
ellipse (450, -10, 100, 100);

//blue circle top
strokeWeight(.5);
fill(74, 145, 188);
ellipse (450, -10, 80, 80);

//gray over blue and yellow circle tops
noStroke();
fill(0, 150);
quad (414, 25, 451, 8, 471, 37, 443, 51);

//black line on pink square
strokeWeight(2);
line (0, 145, 21, 128);

//bw speckles 2nd bottom on left
noStroke();
fill(255);
quad (41, 129, 77, 111, 96, 150, 64, 170);

//brown specks 5, 3
noStroke();
fill(43, 22, 31);
strokeWeight(9);
ellipse (254, 87, 3, 2);
ellipse (256, 89, 3, 2);
ellipse (252, 85, 3, 2);
ellipse (250, 87, 3, 2);
ellipse (257, 89, 3, 2);
ellipse (249, 85, 3, 2);
ellipse (254, 90, 3, 2);
ellipse (256, 80, 3, 2);
ellipse (252, 95, 3, 2);
ellipse (250, 85, 3, 2);
ellipse (257, 95, 3, 2);
ellipse (249, 100, 3, 2);
ellipse (254, 105, 3, 2);
ellipse (256, 100, 3, 2);
ellipse (252, 80, 3, 2);
ellipse (250, 85, 3, 2);
ellipse (257, 80, 3, 2);
ellipse (249, 75, 3, 2);
ellipse (254, 70, 4, 3);
ellipse (256, 77, 4, 3);
ellipse (252, 78, 4, 3);
ellipse (250, 101, 4, 3);
ellipse (257, 105, 4, 3);
ellipse (249, 100, 4, 3);

ellipse (240, 95, 3, 2);
ellipse (243, 100, 3, 2);
ellipse (246, 105, 3, 2);
ellipse (249, 100, 3, 2);
ellipse (260, 80, 3, 2);
ellipse (263, 85, 3, 2);
ellipse (266, 80, 3, 2);
ellipse (270, 75, 3, 2);
ellipse (240, 74, 3, 2);
ellipse (243, 74, 3, 2);
ellipse (246, 78, 3, 2);
ellipse (249, 82, 3, 2);
ellipse (260, 86, 3, 2);
ellipse (263, 90, 3, 2);
ellipse (266, 84, 3, 2);
ellipse (270, 98, 3, 2);

ellipse (250, 74, 3, 2);
ellipse (253, 74, 3, 2);
ellipse (256, 78, 3, 2);
ellipse (259, 82, 3, 2);
ellipse (261, 86, 3, 2);
ellipse (235, 90, 3, 2);
ellipse (242, 84, 3, 2);
ellipse (239, 98, 3, 2);

ellipse (270, 90, 3, 2);
ellipse (273, 95, 3, 2);
ellipse (267, 95, 3, 2);
ellipse (264, 92, 3, 2);
ellipse (261, 89, 3, 2);
ellipse (253, 90, 3, 2);
ellipse (250, 84, 3, 2);
ellipse (247, 98, 3, 2);

ellipse (220, 89, 3, 2);
ellipse (224, 92, 3, 2);
ellipse (230, 96, 3, 2);
ellipse (230, 80, 3, 2);
ellipse (225, 90, 3, 2);
ellipse (220, 90, 3, 2);

ellipse (269, 77, 3, 2);
ellipse (270, 70, 3, 2);
ellipse (275, 75, 3, 2);
ellipse (280, 70, 3, 2);
ellipse (285, 74, 3, 2);
ellipse (290, 80, 3, 2);
ellipse (270, 77, 3, 2);

ellipse (280, 70, 3, 2);
ellipse (272, 70, 3, 2);
ellipse (255, 75, 3, 2);
ellipse (260, 70, 3, 2);
ellipse (245, 70, 3, 2);
ellipse (240, 90, 3, 2);
ellipse (230, 80, 3, 2);

ellipse (220, 85, 3, 2);
ellipse (225, 85, 3, 2);
ellipse (230, 90, 3, 2);
ellipse (240, 85, 3, 2);
ellipse (245, 80, 3, 2);
ellipse (250, 80, 3, 2);
ellipse (255, 90, 3, 2);

ellipse (220, 100, 3, 2);
ellipse (225, 105, 3, 2);
ellipse (230, 98, 3, 2);
ellipse (240, 105, 3, 2);
ellipse (245, 100, 3, 2);
ellipse (250, 95, 3, 2);
ellipse (255, 105, 3, 2);

ellipse (269, 70, 3, 2);
ellipse (270, 90, 3, 2);
ellipse (275, 80, 3, 2);
ellipse (280, 80, 3, 2);
ellipse (285, 90, 3, 2);
ellipse (290, 85, 3, 2);
ellipse (270, 80, 3, 2);

ellipse (278, 81, 3, 2);
ellipse (278, 85, 3, 2);
ellipse (290, 81, 3, 2);
ellipse (265, 60, 3, 2);

ellipse (215, 90, 3, 2);
ellipse (217, 95, 3, 2);
ellipse (220, 90, 3, 2);
ellipse (215, 95, 3, 2);
ellipse (220, 96, 3, 2);
ellipse (220, 100, 3, 2);
ellipse (225, 105, 3, 2);

ellipse (278, 50, 3, 2);
ellipse (280, 46, 3, 2);
ellipse (260, 70, 3, 2);

ellipse (278, 90, 3, 2);
ellipse (280, 40, 3, 2);
ellipse (260, 30, 3, 2);

ellipse (215, 100, 3, 2);
ellipse (229, 90, 3, 2);
ellipse (218, 90, 3, 2);
ellipse (250, 80, 3, 2);
ellipse (250, 80, 3, 2);

//bw stripes left
strokeWeight(3);
stroke(0);
line (51, 277, 73, 311);
line (57, 273, 77, 306);
line (63, 270, 85, 304);
line (68, 267, 91, 300);
line (74, 263, 97, 296);
line (77, 258, 100, 293);

//bw stripes left 2
strokeWeight(.75);
stroke(0);
line (151, 298, 174, 336);
line (156, 296, 176, 330);
line (162, 294, 181, 328);
line (166, 291, 186, 328);
line (168, 286, 192, 324);


//white top
noStroke();
fill(255);
triangle (247, 0, 284, 0, 254, 16);
quad (254, 19, 271, 55, 375, 0, 285, 0);

//pink square top left corner
noStroke();
fill (195, 46, 50);
quad (19, 94, 55, 75, 75, 110, 41, 128);


//white top right
noStroke();
fill(255);
quad (65, 162, 105, 163, 115, 178, 78, 195);
triangle (113, 124, 130, 130, 113, 139);



//black lines left corner
strokeWeight(7);
stroke(0);
//6
line (18, 90, 193, -2);
//7
line (15, 92, 165, 335);
//1
strokeWeight(3);
line (55, 73, 285, 480);
//2
strokeWeight(2);
line (90, 53, 345, 480);
//3
line (120, 40, 360, 480);
//8
strokeWeight(3);
line (42, 126, 285, 0);
//9
line (65, 165, 375, 0);
//4
strokeWeight(4);
line (157.5, 20, 232.5, 117);
//10
strokeWeight(3);
line (82.5, 195, 450, 6);
//5
strokeWeight(5);
line (210, -1, 300, 83);
//11
strokeWeight(5);
line (45, 277.5, 195, 180);
//12
line (540, -1, 195, 180);
//14
strokeWeight(3);
line (450, 6, 471, 36);
//13
line (555, -1, 197, 232.5);
//15
strokeWeight(3.5);
line (215, 263, 416, 131);
//16
strokeWeight (5);
line (45, 277.5, 172.5, 481);
//17
strokeWeight(4);
line (67.5, 315, 157.5, 255);
//18
line (82.5, 337.5, 172.5, 285);
//19
line (82.5, 255, 217.5, 481);
//20
line (108, 379, 192, 322);
//21
line (129, 412, 231, 345);
strokeWeight(2);
//22
line (166, 343, 240, 481);
//23
line (169, 338, 260, 479);
//24 
strokeWeight(1);
noFill();
quad (182, 481, 594, 172, 604, 187, 208, 481);

//black square with white texture in middle
fill(0);
noStroke();
quad (360, 170, 419, 131, 452, 188, 396, 226); 

//red circle
strokeWeight (.5);
fill(208, 72, 60, 200);
ellipse (450, 129, 110, 110);

//purple circle
strokeWeight (1);
fill(144, 133, 147, 200);
ellipse (447, 127, 100, 100);

//black square with white texture in middle
noFill();
stroke(0);
strokeWeight(2);
quad (360, 171, 419, 129, 452, 188, 396, 226);

//black texture
strokeWeight(4);
fill(255);
strokeCap(SQUARE);
line (49, 130, 55, 140);
line (50, 135, 55, 145);
line (70, 120, 74, 130);
line (60, 120, 65, 127);
line (69, 135, 74, 145);
line (75, 135, 83, 143);
line (55, 142, 58, 150);
line (60, 150, 65, 158);
line (69, 150, 74, 158);
line (80, 147, 85, 155);

line (50, 130, 55, 140);
line (65, 135, 70, 145);
line (70, 120, 75, 130);
line (50, 120, 55, 127);
line (60, 135, 65, 145);

line (85, 135, 90, 143);
line (80, 130, 85, 133);
line (65, 135, 65, 154);
line (65, 141, 70, 150);
line (70, 130, 78, 140);
line (75, 118, 80, 126);
line (73, 115, 78, 124);
line (46, 127, 50, 135);
line (60, 131, 65, 140);
line (75, 144, 80, 155);
line (90, 145, 93, 150);

line (55, 128, 60, 136);
line (64, 129, 69, 134);
line (69, 120, 69, 125);
line (85, 140, 87, 150);
line (68, 115, 73, 122);


//black specks 1, 3
noStroke();
fill(0);
int circlex = 4;
int circley = 5;

ellipse (114, 242, circlex, circley);
ellipse (120, 237, circlex, circley);
ellipse (125, 233, circlex, circley);
ellipse (132, 230, circlex, circley);
ellipse (137, 226, circlex, circley);
ellipse (144, 234, circlex, circley);
ellipse (139, 237, circlex, circley);
ellipse (132, 230, circlex, circley);
ellipse (125, 242, circlex, circley);
ellipse (123, 251, circlex, circley);
ellipse (132, 247, circlex, circley);
ellipse (141, 241, circlex, circley);
ellipse (148, 239, circlex, circley);
ellipse (148, 240, circlex, circley);
ellipse (140, 241, circlex, circley);
ellipse (132, 246, circlex, circley);
ellipse (126, 250, circlex, circley);
ellipse (123, 255, circlex, circley);
ellipse (128, 261, circlex, circley);
ellipse (136, 254, circlex, circley);
ellipse (140, 245, circlex, circley);
ellipse (146, 244, circlex, circley);
ellipse (152, 252, circlex, circley);
ellipse (146, 256, circlex, circley);
ellipse (139, 259, circlex, circley);
ellipse (132, 258, circlex, circley);
ellipse (130, 260, circlex, circley);
ellipse (138, 262, circlex, circley);
ellipse (143, 253, circlex, circley);
ellipse (149, 252, circlex, circley);
ellipse (154, 252, circlex, circley);
ellipse (149, 256, circlex, circley);
ellipse (154, 252, circlex, circley);
ellipse (149, 256, circlex, circley);
ellipse (142, 260, circlex, circley);
ellipse (136, 265, circlex, circley);

ellipse (133, 239, circlex, circley);
ellipse (142, 231, circlex, circley);
ellipse (136, 234, circlex, circley);
ellipse (131, 237, circlex, circley);
ellipse (121, 242, circlex, circley);
ellipse (120, 247, circlex, circley);
ellipse (134, 263, circlex, circley);
ellipse (135, 268, circlex, circley);
ellipse (134, 236, circlex, circley);

strokeWeight(1);
stroke(0);
fill(0);
int circlea = 2;
int circleb = 2;

ellipse (110, 291, circlea, circleb);
ellipse (116, 289, circlea, circleb);
ellipse (122, 289, circlea, circleb);
ellipse (126, 284, circlea, circleb);
ellipse (128, 283, circlea, circleb);
ellipse (130, 285, circlea, circleb);
ellipse (126, 287, circlea, circleb);
ellipse (123, 286, circlea, circleb);
ellipse (119, 289, circlea, circleb);
ellipse (118, 292, circlea, circleb);
ellipse (114, 295, circlea, circleb);
ellipse (115, 295, circlea, circleb);
ellipse (119, 295, circlea, circleb);
ellipse (123, 294, circlea, circleb);
ellipse (127, 291, circlea, circleb);
ellipse (129, 281, circlea, circleb);
ellipse (132, 288, circlea, circleb);
ellipse (134, 293, circlea, circleb);
ellipse (127, 293, circlea, circleb);
ellipse (122, 298, circlea, circleb);
ellipse (119, 298, circlea, circleb);
ellipse (117, 300, circlea, circleb);

ellipse (119, 303, circlea, circleb);
ellipse (124, 299, circlea, circleb);
ellipse (128, 297, circlea, circleb);
ellipse (132, 296, circlea, circleb);
ellipse (135, 297, circlea, circleb);
ellipse (136, 296, circlea, circleb);
ellipse (132, 296, circlea, circleb);
ellipse (135, 292, circlea, circleb);
ellipse (136, 296, circlea, circleb);
ellipse (132, 297, circlea, circleb);
ellipse (128, 300, circlea, circleb);
ellipse (124, 302, circlea, circleb);
ellipse (121, 306, circlea, circleb);
ellipse (125, 304, circlea, circleb);
ellipse (129, 299, circlea, circleb);
ellipse (134, 297, circlea, circleb);
ellipse (137, 290, circlea, circleb);
ellipse (138, 299, circlea, circleb);
ellipse (135, 301, circlea, circleb);
ellipse (121, 304, circlea, circleb);
ellipse (127, 305, circlea, circleb);
ellipse (123, 307, circlea, circleb);
ellipse (126, 308, circlea, circleb);
ellipse (129, 306, circlea, circleb);
ellipse (135, 304, circlea, circleb);
ellipse (140, 300, circlea, circleb);

ellipse (125, 282, circlea, circleb);
ellipse (120, 283, circlea, circleb);
ellipse (119, 288, circlea, circleb);
ellipse (114, 291, circlea, circleb);
ellipse (110, 296, circlea, circleb);
ellipse (115, 297, circlea, circleb);
ellipse (114, 303, circlea, circleb);
ellipse (117, 306, circlea, circleb);
ellipse (123, 310, circlea, circleb);
ellipse (120, 311, circlea, circleb);
ellipse (116, 305, circlea, circleb);


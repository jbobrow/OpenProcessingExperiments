
{
size (640, 480);
background (224, 213, 193);
smooth ();



//white backgrounds
fill (255);
quad (168, 257, 227, 311, 639, 93, 639, 6);
quad (131, 362, 166, 427, 384, 313, 346, 248); 
noStroke ();
triangle (184, 460, 194, 479, 213, 479); 
quad (183, 460, 209, 479, 352, 387, 363, 341);
triangle (107, 462, 81, 479, 117, 479);

//large circle fills
noStroke (); //big yellow circle fill 
fill (214, 165, 62);
ellipse (119, 296, 153, 153);

fill (196, 109, 72); //orange circle fill
ellipse (148, 294, 138, 138);

fill (155, 175, 157); //green circle fill
arc (148, 294, 138, 138, radians (90), radians (270));
triangle (148, 226, 135, 270, 179, 249);

fill(188, 183, 147);
arc (148, 294, 138, 138, radians (90), radians (140));


//quads
noStroke (); //floating square
fill (224, 211, 167);
quad (233, 36, 233, 95, 298, 95, 298, 36);
fill (230, 233, 227);
quad (238, 43, 238, 89, 292, 89, 292, 43); 
strokeWeight (5);
stroke (0);
fill (219, 202, 153);
quad (251, 54, 251, 81, 281, 81, 281, 54); 
strokeWeight (2);
fill (106, 108, 127);
quad (498, 80, 517, 116, 561, 93, 541, 58); //gray square
fill (0);
quad (457, 189, 476, 223, 513, 203, 493, 170); //black blocks
quad (455, 284, 470, 311, 498, 295, 482, 267);
quad (475, 330, 494, 363, 525, 345, 505, 312);
quad (59, 442, 81, 479, 108, 462, 88, 429);
quad (446, 479, 473, 479, 540, 430, 530, 418);
quad (70, 395, 87, 428, 123, 408, 104, 376);
strokeWeight (1); //red box
fill (197, 49, 57);
quad (0, 343, 20, 378, 51, 361, 30, 326);


fill (119, 113, 77); //khaki box
quad (114, 330, 132, 362, 176, 339, 153, 309);
fill (0); //behind yellow
quad (350, 288, 367, 320, 418, 292, 362, 283);
fill (255); //white blocks of background
quad (166, 479, 195, 479, 130, 362, 106, 375);
quad (90, 428, 119, 479, 167, 479, 124, 409);
quad (40, 409, 59, 442, 87, 428, 77, 411);
quad (21, 379, 41, 412, 70, 395, 52, 362);

fill (196, 52, 61);
quad (70, 395, 78, 410, 84, 410, 85, 386);
fill (206, 71, 98); //hot pink in box
quad (52, 362, 70, 394, 84, 387, 83, 345);
fill (152, 97, 74); //light brown in box
quad (32, 327, 52, 361, 67, 353, 44, 321);
fill (51, 40, 39);
quad (44, 320, 66, 353, 86, 344, 65, 310);
noStroke ();
fill (196, 148, 162);
quad (0, 311, 0, 343, 44, 320, 42, 311);
fill (167, 175, 153); //light teal
quad (153, 309, 175, 338, 185, 334, 194, 288);
fill (167, 175, 153); //light teal filler
quad (195, 288, 180, 295, 185, 330, 192, 319); 

fill (193, 200, 183);
quad (78, 302, 95, 338, 113, 329, 94, 295);

fill (0);
quad (314, 413, 348, 465, 398, 433, 350, 390);


//tiny triangle
noStroke ();
fill (219, 93, 117);
triangle (58, 311,44, 311, 45, 318);
fill (202, 131, 148);
triangle (0, 346, 0, 411, 40, 411);
fill (202, 218, 198); //little green triangle
triangle (167, 257, 191, 276, 180, 250);
fill (255, 245, 186); //little pale yellow triangle
triangle (111, 373, 155, 365, 133, 362);

//bottom green fill
fill (193, 202, 182);
triangle (132, 364, 160, 363, 184, 338);

//ellipses
stroke (0);
strokeWeight (4); //white
fill (255);
ellipse (560, 283, 80, 80); 
strokeWeight (1); //yellow
fill (218, 190, 104);
ellipse (398, 241, 109, 109);
fill (82, 146, 191); //blue
ellipse (398, 241, 88, 88);
noFill ();
strokeWeight (5);
ellipse (119, 296, 153, 153); //multi ring
strokeWeight (1);
fill (185, 64, 52);
ellipse (400, 380, 107, 107); //red 
fill (145, 133, 156);
ellipse (398, 375,97, 97); //purple
noFill();
ellipse (148, 294, 138, 138); //small multi ring

//purpley arc
fill (133, 67, 48);
arc (400, 263, 97, 66, radians (65), radians (140));
fill (85, 90, 131);
arc (400, 263, 72, 41, radians (65), radians (140));

//brownish arc
fill (113, 75, 75);
arc (393, 365, 90, 115, radians (90), radians (154));
noStroke ();
fill (145, 133, 156);
triangle (364, 369, 393, 423, 404, 358);

stroke (0);

//pale green arc
fill (193, 200, 183);
arc (148, 294, 138, 138, radians (140), radians (175));

fill (72, 91, 88); //dark green box
quad (129, 276, 152, 308, 196, 285, 167, 256);

fill (176, 174, 128); //light green box
quad (95, 295, 113, 328, 152, 309, 129, 277);


//triangles
fill (0);
triangle (366, 479, 428, 479, 410, 452);
fill (191, 120, 61); //orange triangle
triangle (166, 426, 183, 458, 553, 223);
strokeWeight (2);
fill (215, 84, 110);
triangle (42, 410, 77, 410, 69, 395);
noStroke();
fill (179, 48, 54);
triangle (84, 340, 84, 311, 69, 311);
fill (194, 78, 40);
triangle (84, 345, 84, 362, 70, 353);




//lines
stroke (0);
strokeWeight (4);
line (0, 343, 638, 5);
line (21, 378, 639, 51);
line (41, 411, 640, 93);
line (60, 444, 400, 263);
line (80, 480, 164, 423);
line (143, 440, 574, 210);
line (164, 472, 574, 210);
line (211, 479, 369, 379);
line (0, 346, 80, 479);
line (32, 328, 118, 479);
line (67, 309, 168, 479);
line (95, 295, 195, 479);
line (130, 276, 198, 368);
line (168, 255, 256, 337);
line (400, 263, 418, 291);
line (350, 289, 367, 320);
strokeWeight (3);
line (369, 379, 398, 432);
line (347, 466, 398, 432);
line (314, 413, 347, 466);

// checks
line (26, 375, 47, 408);
line (31, 373, 52, 405);
line (36, 371, 57, 402);
line (41, 369, 62, 399);
line (46, 367, 67, 396);

line (24, 384, 54, 367);
line (28, 390, 58, 372);
line (32, 396, 60, 377);
line (36, 402, 62, 382);
line (40, 408, 66, 388);



//little black triangle
strokeWeight (2);
line (152, 433, 165, 425);

//dots
strokeWeight (3);

point (184, 342);
point (188, 346);
point (192, 350);
point (196, 354);
point (200, 358);
point (204, 362);

point (191, 340);
point (195, 344);
point (199, 348);
point (203, 352);
point (207, 356);
point (211, 360);

point (194, 334);
point (198, 338);
point (202, 342);
point (206, 346);
point (210, 350);
point (214, 354);

point (201, 332);
point (205, 336);
point (209, 340);
point (213, 344);
point (217, 348);
point (221, 352);

point (204, 326);
point (208, 330);
point (212, 334);
point (216, 338);
point (220, 342);
point (224, 346);
point (228, 350);

point (211, 324);
point (215, 328);
point (219, 332);
point (223, 336);
point (227, 340);
point (231, 344);
point (235, 348);

point (218, 322);
point (222, 326);
point (226, 330);
point (230, 334);
point (234, 338);
point (238, 342);
point (242, 346);

point (225, 320);
point (229, 324);
point (233, 328);
point (237, 332);
point (241, 336);
point (245, 340);
point (249, 344);

point (231, 319);
point (235, 323);
point (239, 327);
point (243, 331);
point (247, 335);


line (303, 184, 325, 217);
line (346, 161, 367, 194);

point (311, 185);
point (315, 190);
point (319, 195);
point (323, 200);
point (327, 205);
point (331, 210);

point (314, 180);
point (318, 185);
point (322, 190);
point (326, 195);
point (330, 200);
point (334, 205);

point (321, 180);
point (325, 185);
point (329, 190);
point (333, 195);
point (337, 200);
point (341, 205);

point (324, 175);
point (328, 180);
point (332, 185);
point (336, 190);
point (340, 195);
point (344, 200);
point (348, 205);

point (331, 175);
point (335, 180);
point (339, 185);
point (343, 190);
point (347, 195);
point (351, 200);

point (334, 170);
point (338, 175);
point (342, 180);
point (346, 185);
point (350, 190);
point (354, 195);
point (358, 200);

point (341, 170);
point (345, 175);
point (349, 180);
point (353, 185);
point (357, 190);
point (361, 195);

point (100, 471);
point (102, 475);
point (105, 469);
point (109, 473);
point (105, 478);
point (94, 476);
point (109, 478);
point (97, 477);

}



size (358, 400);
background (144, 163, 169);
smooth();

//body
fill (168, 131, 96);
beginShape();
vertex (63, 204);
curveVertex (53, 217);
curveVertex (53, 217);
curveVertex (48, 223);
curveVertex (32, 258);
curveVertex (27, 292);
curveVertex (32, 325);
curveVertex (48, 361);
vertex (40, 400);
vertex (358, 400);
vertex (358, 316);
curveVertex (351, 305);
curveVertex (351, 305);
curveVertex (344, 294);
curveVertex (347, 285);
curveVertex (340, 241);
curveVertex (337, 223);
curveVertex (325, 205);
curveVertex (325, 206);
endShape(CLOSE);

//body detail
fill (210, 201, 186, 100);
beginShape();
curveVertex (107, 294);
curveVertex (107, 294);
curveVertex (94, 305);
curveVertex (85, 311);
curveVertex (87, 308);
curveVertex (73, 328);
curveVertex (101, 399);
curveVertex (101, 399);
vertex (102, 400);
vertex (282, 400);
curveVertex (292, 390);
curveVertex (292, 390);
curveVertex (304, 371);
curveVertex (332, 317);
curveVertex (321, 302);
curveVertex (299, 268);
curveVertex (285, 276);
curveVertex (261, 288);
curveVertex (227, 298);
curveVertex (177, 308);
curveVertex (144, 306);
curveVertex (117, 303);
curveVertex (117, 303);
endShape(CLOSE);

//head
fill (189, 149,  70);
beginShape ();
curveVertex (69, 173);
curveVertex (69, 173);
curveVertex (63, 132);
curveVertex (43, 92);
curveVertex (48, 68);
vertex (35, 52);
curveVertex (52, 54);
curveVertex (52, 54);
curveVertex (91, 72);
curveVertex (107, 82);
curveVertex (107, 82);
vertex (125, 96);
curveVertex (134, 94);
curveVertex (134, 94);
curveVertex (155, 94);
curveVertex (172, 90); //top midpoint
curveVertex (194, 80);
curveVertex (194, 80);
vertex (214, 73);
curveVertex (221, 62);
curveVertex (221, 62);
curveVertex (237, 35);
curveVertex (246, 18);
curveVertex (264, 2);
curveVertex (264, 2);
vertex (272, 0);
curveVertex (277, 10);
curveVertex (277, 10);
curveVertex (282, 30);
curveVertex (286, 62);
curveVertex (295, 115);
curveVertex (315, 132);
curveVertex (325, 188);
curveVertex (323, 201);
curveVertex (315, 237);
curveVertex (302, 260);
curveVertex (258, 295);
curveVertex (171, 312);
curveVertex (132, 306);
curveVertex (108, 293);
curveVertex (97, 285);
curveVertex (68, 234);
curveVertex (62, 200);
curveVertex (69, 173);
curveVertex (69, 173);
endShape (CLOSE);

//head detail
fill (223, 214, 299, 100);
beginShape();
vertex (181, 103);
curveVertex (178, 120);
curveVertex (178, 120);
curveVertex (170, 133);
curveVertex (172, 145);
curveVertex (169, 150);
curveVertex (171, 157);
curveVertex (175, 163);
curveVertex (168, 188);
curveVertex (161, 197);
curveVertex (152, 217);
curveVertex (143, 231);
curveVertex (127, 254);
curveVertex (107, 256);
curveVertex (100, 257);
curveVertex (86, 249);
curveVertex (86, 249);
vertex (79, 250);
curveVertex (88, 266);
curveVertex (88, 266);
curveVertex (98, 283);
curveVertex (114, 298);
curveVertex (129, 305);
curveVertex (174, 309);
curveVertex (266, 289);
curveVertex (288, 271);
curveVertex (311, 242);
curveVertex (323, 199);
curveVertex (323, 199);
vertex (325, 192);
curveVertex (313, 195);
curveVertex (313, 195);
curveVertex (295, 207);
curveVertex (268, 195);
curveVertex (248, 182);
curveVertex (223, 167);
curveVertex (216, 159);
curveVertex (203, 139);
curveVertex (192, 132);
curveVertex (187, 126);
curveVertex (187, 111);
curveVertex (187, 111);
vertex (181, 103);
endShape(CLOSE);

//face
//eyes
strokeWeight (10);
strokeCap (ROUND);
line (118,206, 127,192);
line (127,192, 159, 185);
line (159,185, 171,195);
line (232,174, 235,165);
line (235,165, 269,156);
line (269,156, 281,162);
//nose
strokeWeight (6);
line (191,231, 217,236);
line (217,236, 234,222);
line (217,236, 219,254);
//mouth
line (172,270, 188,274);
line (188,274, 219,254);
line (219,254, 256,257);
line (256,257, 269,243);
//whiskers
stroke (255, 255, 255, 150);
strokeWeight (3);
line (186,253, 80,280);
line (186,254, 95,295);
line (187,255, 101,306);
line (254,237, 333,213);
line (254,237, 343, 227);
line (254,238, 348, 256);

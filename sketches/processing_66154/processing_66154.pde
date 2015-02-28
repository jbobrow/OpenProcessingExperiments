
//miro

size (250, 234);
background (250, 246, 227);
smooth ();
noFill ();
stroke (0);

strokeWeight (1);
bezier (43, 0, 37, 9, 24, 24, 28, 38); //leftside curve
bezier (28, 38, 31, 52, 55, 49, 60, 48);

bezier (250, 2, 238, 5, 231, 11, 228, 22); //topright curve
bezier (228, 22, 226, 33, 231, 36, 232, 48);
bezier (232, 48, 233, 58, 234, 60, 235, 73);
bezier (235, 73, 237, 87, 246, 96, 250, 97);

bezier (0, 209, 4, 210, 2, 212, 17, 212); //bottomleft curve
bezier (17, 212, 32, 212, 29, 211, 35, 207);
bezier (35, 207, 41, 204, 38, 189, 39, 181);
bezier (39, 181, 40, 172, 41, 172, 42, 162);

bezier (0, 163, 4, 160, 4, 161, 8, 151); //small curve
bezier (8, 151, 11, 145, 11, 138, 12, 135);

bezier (0, 226, 3, 222, 10, 217, 13, 211); //bottom left curve (second one)
bezier (13, 211, 13, 206, 14, 208, 14, 204);

stroke (0); //STARS & LINES
strokeWeight (1);
strokeCap (ROUND);
line (30, 76, 60, 112); //star1
line (44, 73, 46, 118);
line (55, 81, 28, 114);
line (25, 94, 67, 93);

line (192, 87, 220, 87); //star2
line (194, 72, 217, 102);
line (207, 70, 204, 102);
line (218, 80, 193, 98);

line (180, 140, 213, 140); //star3
line (180, 126, 215, 158);
line (193, 123, 194, 158);
line (212, 124, 177, 158);

line (137, 223, 161, 221); //star4
line (135, 208, 161, 233);
line (149, 205, 149, 233);
line (161, 209, 142, 233);

line (226, 171, 249, 172); //star5
line (231, 162, 249, 179);
line (241, 157, 241, 186);
line (249, 165, 227, 185);

line (249, 220, 226, 233); //rightbottom line

line (189, 1, 157, 14); //top line

line (163, 83, 164, 106); //center line

line (238, 118, 238, 132); //right side line

line (10, 61, 9, 85); //left side line

fill (0);                // top left triangle shape
beginShape ();
vertex (61, 48);
bezierVertex (81, 32, 81, 32, 81, 32);
bezierVertex (83, 43, 84, 47, 84, 53);
bezierVertex (84, 59, 85, 70, 79, 76);
bezierVertex (76, 70, 67, 57, 61, 48);
endShape ();

fill (0);
beginShape ();
vertex (113, 0);
bezierVertex (113, 6, 118, 25, 139, 37);
bezierVertex (159, 50, 196, 45, 196, 45);
bezierVertex (196, 45, 170, 28, 163, 18);
bezierVertex (155, 9, 146, 0, 146, 0);
bezierVertex (146, 0, 113, 0, 113, 0);
endShape ();

fill (0);
beginShape ();
vertex (110, 233);
bezierVertex (110, 233, 121, 210, 124, 186);
bezierVertex (128, 164, 127, 112, 130, 102);
bezierVertex (133, 92, 147, 62, 150, 57);
bezierVertex (152, 47, 153, 34, 153, 34);
bezierVertex (153, 34, 134, 26, 134, 26);
bezierVertex (134, 26, 132, 44, 122, 59);
bezierVertex (114, 69, 106, 86, 100, 97);
bezierVertex (95, 108, 89, 123, 80, 136);
bezierVertex (71, 147, 63, 163, 58, 174);
bezierVertex (54, 187, 40, 222, 39, 233);
bezierVertex (39, 233, 110, 233, 110, 233);
endShape ();

fill (255, 35, 23); //redshape1
beginShape ();
vertex (131, 32);
bezierVertex (131, 32, 133, 22, 144, 24);
bezierVertex (155, 25, 152, 43, 152, 43);
bezierVertex (152, 43, 146, 42, 141, 39);
bezierVertex (136, 37, 131, 32, 131, 32);
endShape ();

fill (0); //blackellipse
beginShape ();
vertex (9, 49);
bezierVertex (16, 48, 19, 55, 19, 55);
bezierVertex (19, 55, 20, 62, 9, 63);
bezierVertex (0, 64, 0, 57, 0, 57);
bezierVertex (0, 57, 2, 49, 9, 49);
endShape ();

fill (0); //blackellipse2
beginShape ();
vertex (10, 84);
bezierVertex (18, 85, 18, 90, 18, 90);
bezierVertex (18, 90, 16, 96, 7, 96);
bezierVertex (0, 96, 0, 92, 0, 92);
bezierVertex (0, 92, 0, 84, 10, 84);
endShape ();

fill (240, 49, 39); //redshape2
beginShape ();
vertex (0, 152);
bezierVertex (2, 145, 9, 146, 9, 146);
bezierVertex (9, 146, 9, 149, 7, 151);
bezierVertex (6, 155, 5, 157, 5, 157);
bezierVertex (0, 158, 0, 152, 0, 152);
endShape ();

fill (0); //blackshape
beginShape ();
vertex (10, 146);
bezierVertex (10, 146, 16, 147, 15, 152);
bezierVertex (13, 157, 4, 157, 4, 157);
bezierVertex (4, 157, 8, 154, 9, 150);
bezierVertex (9, 148, 10, 146, 10, 146);
endShape ();

fill (0); //blackellipse3
beginShape ();
vertex (163, 70); 
bezierVertex (170, 68, 171, 79, 171, 79);
bezierVertex (171, 79, 171, 84, 163, 84);
bezierVertex (155, 86, 154, 79, 154, 79);
bezierVertex (154, 79, 155, 71, 163, 70);
endShape ();

fill (0); //blackellipse4
beginShape ();
vertex (163, 104);
bezierVertex (172, 103, 173, 110, 173, 110);
bezierVertex (173, 110, 170, 116, 164, 117);
bezierVertex (154, 119, 152, 113, 152, 113);
bezierVertex (152, 113, 153, 105, 163, 104);
endShape ();

fill (0); //blackellipse 5
beginShape ();
vertex (237, 106);
bezierVertex (244, 106, 244, 113, 244, 113);
bezierVertex (244, 113, 245, 119, 238, 119);
bezierVertex (231, 120, 230, 114, 230, 114);
bezierVertex (230, 114, 231, 107, 237, 106);
endShape ();

fill (0); //blackellipse 6
beginShape ();
vertex (238, 131);
bezierVertex (245, 131, 245, 138, 245, 138);
bezierVertex (245, 138, 245, 142, 238, 142);
bezierVertex (230, 143, 231, 137, 231, 137);
bezierVertex (231, 137, 232, 132, 238, 131);
endShape ();

fill (0); //blackellipse 7
beginShape ();
vertex (11, 192);
bezierVertex (18, 189, 20, 197, 20, 197);
bezierVertex (20, 197, 22, 202, 13, 203);
bezierVertex (5, 203, 6, 199, 6, 199);
bezierVertex (6, 199, 5, 195, 11, 192);
endShape ();


fill (255, 35, 23); //redshape3
beginShape ();
vertex (231, 5);
bezierVertex (237, 1, 243, 5, 243, 5);
bezierVertex (243, 5, 239, 7, 237, 9);
bezierVertex (234, 10, 231, 14, 231, 14);
bezierVertex (231, 14, 225, 9, 231, 5);
endShape ();

fill (0); //blackshape
beginShape ();
vertex (236, 9);
bezierVertex (239, 6, 243, 5, 243, 5);
bezierVertex (243, 5, 248, 9, 241, 13);
bezierVertex (234, 18, 231, 14, 231, 14);
bezierVertex (231, 14, 234, 11, 236, 9);
endShape ();

fill (0); //blackshape top
beginShape ();
vertex (200, 0);
bezierVertex (200, 0, 199, 5, 194, 5);
bezierVertex (189, 6, 187, 0, 187, 0);
bezierVertex (187, 0, 200, 0, 200, 0);
endShape ();

fill (0); //triangle
beginShape (TRIANGLES);
vertex (249, 36);
vertex (243, 42);
vertex (249, 46);
endShape ();












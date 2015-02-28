
int counter;



//GIRASOLES EN FEBRERO

size (400, 400);

colorMode (HSB, 360, 100, 100);
background (#554334);
smooth();

noStroke ();
fill (27, 30, 25);
beginShape ();
vertex (209.72, 294.45);
vertex(209.72, 0);
vertex (398.34, 0);
vertex  (398.34, 400);
vertex (209.72, 294.45);
endShape (CLOSE);

noStroke ();
fill (24, 25, 62);
triangle (0, 400, 398.34, 400, 210.27, 297.7);



stroke (43, 32, 62, 30);
strokeWeight (3);
fill (54, 34, 75, 100);
arc (205.7, 218.85, 365, 364, PI, 2*PI );

noStroke();

fill (41, 22, 85, 100);
arc (205.7, 218.85, 350, 354, PI, 2*PI );

//sombra
fill  (34, 27, 50, 50);
ellipse ( 211.39, 366.33, 181, 28);

//maceta
fill (17, 43, 50);
beginShape ();
vertex (244.6, 357.4);
vertex (244.6, 326.8);
vertex (259.52, 326.8);
vertex (273.7, 308.89);
vertex (210.27, 297.7);
vertex (146.84, 308.9);
vertex (161.02, 326.81);
vertex (175.94, 326.81);
vertex (175.94, 357.4);
vertex (244.6, 357.4);

endShape (CLOSE);

//base

fill (17, 41, 25);
rect (164.07, 357.4, 85, 12.43);

fill (17, 43, 39, 150);
rect (175.94, 357.4, 75, 12.43);

fill ( 17, 43, 53);
rect (189, 357.4, 65, 12.43);

fill (17, 45, 64, 150);
rect (201, 357.4, 55, 12.43);

//hoyo
fill (26, 74, 7);
ellipse (209, 307, 85, 8);


//hojas
noStroke ();
fill (71, 30, 56);
beginShape ();
curveVertex (151.66, 300.68);
curveVertex (152.37, 168.32);
curveVertex (173.48, 246.3);
curveVertex (151.66, 300.68);
endShape (CLOSE);

noStroke ();
fill (71, 30, 56);
beginShape ();

curveVertex (151.66, 300.68);
curveVertex (152.37, 268.32);
curveVertex (173.48, 246.3);
curveVertex (171.4, 280.42);
curveVertex (151.66, 300.68);
endShape (CLOSE);


//girasol

noStroke ();
beginShape ();
fill ( 47, 58, 89, 200);
curveVertex ( 166.52, 156.18);
curveVertex (180.39, 159.78);
curveVertex (171.14, 170.05);
curveVertex (176.27, 180.33);
curveVertex (162.4, 178.27);
curveVertex (162.92, 180.84);
curveVertex (160.86, 197.79);
curveVertex (159.72, 197.5);
curveVertex (152.65, 180.84);
curveVertex (139.26, 197.28);
curveVertex (139.26, 179.81);
curveVertex (126.17, 179.81);
curveVertex (143.91, 165.94);
curveVertex (118.08, 162.37);
curveVertex (123.08, 153.1);
curveVertex (152.45, 150.02);
curveVertex (139.1, 140.69);
curveVertex (139.35, 131.11);
curveVertex (148.01, 134.31);
curveVertex (157.78, 149.5);
curveVertex (160.28, 146.93);
curveVertex (178.33, 144.37);
curveVertex (171, 154);
curveVertex (166.52, 156.18);

endShape (CLOSE);
fill (78, 45, 47, 200);
arc (236, 230, 25, 25, radians (225), radians (405));


noStroke ();
beginShape ();
fill (54, 51, 95, 200);
curveVertex ( 156.52, 146.18);
curveVertex (170.39, 149.78);
curveVertex (161.14, 160.05);
curveVertex (166.27, 170.33);
curveVertex (142.4, 168.27);
curveVertex (142.92, 170.84);
curveVertex (150.86, 187.79);
curveVertex (149.72, 187.5);
curveVertex (142.65, 170.84);
curveVertex (129.26, 187.28);
curveVertex (129.26, 189.81);
curveVertex (116.17, 189.81);
curveVertex (133.91, 155.94);
curveVertex (108.08, 152.37);
curveVertex (113.08, 143.1);
curveVertex (142.45, 140.02);
curveVertex (129.1, 130.69);
curveVertex (129.35, 121.11);
curveVertex (138.01, 124.31);
curveVertex (147.78, 139.5);
curveVertex (150.28, 136.93);
curveVertex (168.33, 134.37);
curveVertex (161, 144);
curveVertex (16.52, 146.18);



endShape (CLOSE);

fill (58, 34, 93, 200);
ellipse (150.55, 160.31, 32, 29);

fill (3, 29, 7, 200);
ellipse (150.55, 160.31, 30, 27);

//tallos 
stroke(48, 35, 58);
noFill ();
beginShape ();


bezier (84.9, 173.07, 181.91, 173.07, 183.94, 318, 183.58, 302.41);

bezier ( 314.75, 173.07, 240.12, 158.15, 236.97, 318, 236.97, 302.41);

// flores
stroke(50, 74, 79);
fill (30, 81, 87);
ellipse (66.99, 174.59, 40, 41);

fill (39, 81, 87);
stroke(39, 76, 57, 100);
ellipse (67, 178, 20, 19);

fill (40, 74, 79);
ellipse (337, 172, 45, 45);

fill (53, 58, 90);
stroke (61, 70, 88);
ellipse (336.66, 172.33, 20, 20);

noStroke ();
fill (54, 88, 94, 150);
triangle (348.86, 152.49, 324.52, 152.49, 337.05, 171.55);

fill (54, 85, 84, 150);
triangle (312.53, 166.65, 320, 189, 337.05, 171.55);

fill (54, 88, 94, 150);
triangle (324, 194, 349, 194, 337.05, 171.55);

fill (54, 85, 84, 150);
triangle (360, 184, 358, 160, 337.05, 171.55);

//girasoles2

fill (50, 67, 95);
ellipse (278, 235, 36, 37);

ellipse (129, 100, 56, 37);

ellipse (94, 142, 26, 37);

ellipse (309, 147, 50, 26);

//girasoles 1
fill (33, 67, 42);
ellipse (278, 235, 26, 27);

ellipse (129, 100, 46, 27);

ellipse (94, 142, 16, 27);

ellipse (309, 147, 30, 16);

//girasoles 1
fill (50, 30, 15);

ellipse (278, 235, 16, 17);

ellipse (129, 100, 36, 17);

ellipse (94, 142, 6, 17);

ellipse (309, 147, 20, 6);



stroke (61, 35, 60);
line(210, 42, 210, 297);


//GIRASOLES RAROS

noStroke ();
fill  (53, 69, 88);
ellipse (245, 133, 51, 51);

noStroke ();
fill (47, 74, 88);

triangle (262, 103, 228, 103, 245, 133);
triangle (274, 113, 278, 147, 245, 133);
triangle (262, 163, 228, 163, 245, 133);
triangle (222, 158, 212, 126, 245, 133);

stroke ( 24, 54, 39);
strokeWeight (30);
point (245, 133);

stroke ( 47, 50, 13);
strokeWeight (20);
point (245, 133);


//2 girasol

noStroke ();
fill  (53, 69, 88);
ellipse (129, 229, 53, 53);

noStroke ();
fill (47, 74, 88);

triangle (100, 258, 87, 217, 129, 229);
triangle (107, 190, 150, 190, 129, 229);
triangle (165, 203, 169, 245, 129, 229);
triangle (150, 264, 107, 264, 129, 229);

stroke ( 24, 54, 39);
strokeWeight (40);
point (129, 229);

stroke ( 47, 50, 13);
strokeWeight (20);
point (129, 229);


//flor on top
noStroke ();
fill (93, 52, 65);

arc (210.27, 30.14, 35, 23, 0, PI);

///centro
fill (26, 65, 40);

ellipse (211, 26, 40, 14);

fill (26, 69, 19);

ellipse (211, 26, 30, 5);

//petalos

fill (46, 76, 91);

beginShape ();
curveVertex (198.31, 30.07);
curveVertex (180.8, 14.76);
curveVertex (187.78, 9.78);
curveVertex (197.36, 18.35);
curveVertex (198.31, 30.07);
endShape(CLOSE);


beginShape ();

curveVertex (205.75, 27.76);
curveVertex (199.08, 5.47);
curveVertex (207.65, 4.97);
curveVertex (211.19, 17.33);
curveVertex (205.75, 27.76);
endShape(CLOSE);

beginShape ();
curveVertex (215.8, 28);
curveVertex (218.19, 4.87);
curveVertex (226.29, 7.7);
curveVertex (224.82, 20.46);
curveVertex (215.8, 28);
endShape(CLOSE);

beginShape ();
curveVertex (225.91, 29.1);
curveVertex (237.24, 8.79);
curveVertex (243.57, 14.58);
curveVertex (237.18, 25.73);
curveVertex (225.91, 29.1);

endShape(CLOSE);

//petalos2

beginShape ();

curveVertex (189, 36);
curveVertex (196, 19);
curveVertex (202, 22);
curveVertex (198.15, 30.85);
curveVertex (189, 36);
endShape(CLOSE);

beginShape ();
curveVertex (204.21, 34.56);
curveVertex (214, 20);
curveVertex (219, 23);
curveVertex (214, 31);
curveVertex (204.21, 34.56);
endShape(CLOSE);

beginShape ();
curveVertex (188, 37);
curveVertex (171, 22);
curveVertex (178, 17);
curveVertex (187, 26);
curveVertex (188, 37);
endShape(CLOSE);

beginShape ();

curveVertex (218, 33);
curveVertex (232, 20);
curveVertex (237, 24);
curveVertex (230, 31);
curveVertex (218, 33);
endShape(CLOSE);

fill (40, 68, 90);
beginShape ();
vertex (95, 96);
vertex (121, 96);
vertex (109, 119);
vertex (131, 104);
vertex (133, 130);
vertex (109, 119);
vertex (121, 143);
vertex (95, 143);
vertex (109, 119);
vertex (90, 139);
vertex (82, 114);
vertex (109, 119);
vertex (95, 96);
endShape (CLOSE);


stroke (40, 61, 23, 150);
strokeWeight  (8);
point (109, 119);

//muchas flores 
stroke (40, 61, 23, 100);
strokeWeight  (4);

fill (24, 62, 57, 100);
ellipse (176, 93, 62, 62);
ellipse (248, 75, 60, 65);
ellipse (144, 94, 40, 40);
ellipse (153, 218, 26, 26);
ellipse (232, 171, 25, 27);
ellipse (229, 72, 15, 15);
ellipse (288, 170, 30, 30);

fill (24, 4, 96, 150);
ellipse (274, 208, 27, 28);
ellipse (213, 141, 20, 20);
ellipse (200, 175, 30, 30);
ellipse (238, 188, 20, 20);

stroke (68, 25, 98, 50);

fill (24, 4, 96, 50);


//FIN

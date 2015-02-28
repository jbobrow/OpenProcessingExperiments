
size (335, 410);
background (255,165,0);
smooth();
//yellow ellipse
fill (255,225, 0);
ellipse (265, 80, 40, 40);
//blue triangle
fill (126,192,238);
beginShape(TRIANGLES);
vertex (70, 140);
vertex (130, 380);
vertex (260, 380);
//black shape
fill (15,15,15, 220);
beginShape();
vertex (150, 30);
vertex (265, 85);
vertex (310, 215);
vertex (95, 300);
vertex (70, 240);
endShape (CLOSE);
//white ellipses on the bottom
fill (237,237,237);
ellipse (280, 365, 25, 25);
ellipse (305, 365, 25, 25);
ellipse (330, 365, 25, 25);
//blue bottom rectangle
noStroke();
fill (142,229,238);
beginShape (QUADS);
vertex(0, 370);
vertex(335, 360);
vertex (335, 390);
vertex (0, 390);
//brown bottom rectangle
fill (139,37,0);
rect (0, 390, 335, 20);
//white ellipses on the top of the brown circle
stroke (0);
fill (237,237,237);
ellipse (110, 420, 25, 25);
ellipse (135, 415, 25, 25);
ellipse (160, 410, 25, 25);
//yellow top triangle
stroke (0);
beginShape(TRIANGLES);
fill (255,215,0, 200);
vertex (250,0);
vertex (280, 20);
vertex (175, 100);
//bottom orange trapezoid
fill (255,127,0);
beginShape(QUADS);
vertex (0,370);
vertex (110, 370);
vertex (98, 320);
vertex (0, 325);
//second red trapezoid
fill (255,36,0);
beginShape (QUADS);
vertex (0, 325);
vertex (80, 322);
vertex (75, 290);
vertex (0, 295);
//top red trapezoid
beginShape (QUADS);
vertex (0, 295);
vertex (55, 292);
vertex (50, 255);
vertex (0, 258);
//small black boxes
fill (0);
rect (25, 340, 20, 20);
rect (25, 308, 18, 7);
//white left box
beginShape (QUADS);
fill (255);
vertex (0, 185);
vertex (0, 150);
vertex (35, 148);
vertex (34, 184);
//top yellow triangle
noStroke ();
fill (255,215,0);
beginShape (TRIANGLES); 
vertex (0, 0);
vertex (0, 75);
vertex (100, 0);
//center blue triangle
fill (108,166,205);
beginShape (TRIANGLES);
vertex (155, 0);
vertex (185, 20);
vertex (215, 0);
//green right triangle
fill (34,139,34);
beginShape (TRIANGLES);
vertex (270, 0);
vertex (335, 0);
vertex (335, 35);
//red triangle on the bottom
stroke (0);
fill (238,0,0);
beginShape (TRIANGLES);
vertex (325, 285);
vertex (270, 325);
vertex (300, 332);
//tiny orange triangle
fill (255,69,0);
beginShape (TRIANGLES);
vertex (190, 355);
vertex (183, 315);
vertex (197, 315);
//tiny blue triangle
beginShape (TRIANGLES);
fill (0,0,156);
vertex (130, 340);
vertex (145, 300);
vertex (155, 305);
//yellow side strip
noStroke ();
fill (255,255,0);
beginShape(QUADS);
vertex (325, 0);
vertex (335, 0);
vertex (335, 330);
vertex (328, 330);
//tiny red diamond
stroke(0);
fill (238,0,0);
beginShape(QUADS);
vertex (290, 260);
vertex (298, 261);
vertex (300, 268);
vertex (292, 267);
//red ellipse
ellipse (70, 115, 20, 20);
ellipse (265, 155, 15, 15);
//strong black line
smooth ();
strokeWeight (5);
line (260, 132, 335, 125);
//curvy blue bit at the bottom
fill (0,0,156);
strokeWeight (1);
beginShape();
curveVertex (85, 340);
curveVertex (85, 340);
curveVertex (110, 370);
curveVertex (140, 345);
curveVertex (160, 310);
curveVertex (185, 295);
curveVertex (185, 295);
vertex (195, 305);
vertex (175, 313);
curveVertex (170, 320);
curveVertex (140, 370);
curveVertex (120, 385);
curveVertex (90, 370);
curveVertex (85, 350);
curveVertex (85, 350);
vertex (85, 340);
endShape();

//curvy line on shape
rectMode(CENTER); // show bounding boxes
noFill ();
  
  stroke(0);
  strokeWeight (2);
  arc(160, 260, 150, 150, -PI/2, -PI/6); // lower quarter circle

//curvy moon thing
beginShape ();
strokeWeight (1);
fill (135,206,235, 155);
vertex (250, 190);
vertex (235, 230);
curveVertex (300, 200);
curveVertex (305, 198);
curveVertex (320, 270);
curveVertex (320, 270);
vertex(321, 265);
vertex (310,230);
curveVertex (300, 200);
curveVertex (285, 180);
curveVertex (250, 190);
curveVertex (250, 190);
endShape ();
//red block
fill (238,0,0);
beginShape();
vertex (260, 170);
vertex (243, 210);
vertex (180, 190);
vertex (175, 120);
vertex (220, 170);
vertex (235, 172);
vertex (240, 160);
vertex (260, 170);
endShape();
//white ellipses
noStroke();
fill(255,239,219);
ellipse (190, 120, 40, 40);
stroke(1);
ellipse (180, 135, 60, 60);
//green ellipse
fill (0,139,69,25);
ellipse (125, 120, 33, 33);
//black line
smooth ();
strokeWeight (1.2); 
line (0, 100, 314, 165);
//black line in circle
line (161, 140, 230, 110);
//curvy blue shape
fill (126,192,238);
beginShape ();
curveVertex (220, 200);
curveVertex (220, 200);
curveVertex (223, 205);
curveVertex (225, 215);
curveVertex (225, 215);
vertex (215, 215);
curveVertex (215, 215);
curveVertex (215, 215);
curveVertex (208, 200);
curveVertex (208, 200);
vertex (220, 200);
endShape();
fill (47,47,79);
beginShape();
curveVertex(225, 215);
curveVertex(225, 215);
curveVertex(224, 225);
curveVertex(222, 228);
curveVertex(222, 228);
vertex (210, 228);
curveVertex(210,228);
curveVertex (212, 225);
curveVertex (215, 215);
curveVertex (215, 215);
endShape();

beginShape (QUADS);
fill (0);
vertex (205, 235);
vertex (200, 245);
vertex (210, 249);
vertex (215, 237);

//triangle transparent
line (110, 240, 192, 195);
line (192, 195, 150, 260);

//yellow half ellipse
fill (230,210,0);
ellipse (240, 125, 30, 30);
line (220, 135, 260, 115);

//yellow black sunset ellipse
noStroke();
ellipse (100, 30, 36, 36);
stroke(0);
fill (38,38,38);
ellipse (100, 30, 26, 26);

//tiny black ellipse
ellipse (300, 162, 6, 6);
//blue ellipse
fill (178,223,238);
ellipseMode(CORNER);
ellipse (255, 280, 25, 30);

//black line in sickle
strokeWeight (3);
line (210, 345, 290, 230);

//last blue ellipse
strokeWeight (1);
fill (202,225,255);
ellipse (245, 250, 10, 24);

//black curved lines
noFill ();
strokeWeight (2);
beginShape ();
curveVertex (200, 300);
curveVertex (200, 300);
curveVertex (230, 310);
curveVertex (260, 330);
curveVertex (260, 330);
endShape ();
beginShape ();
curveVertex (210, 290);
curveVertex (210, 290);
curveVertex (240, 300);
curveVertex (270, 320);
curveVertex (270, 320);
endShape ();

strokeWeight (1);
beginShape ();
curveVertex (220, 250);
curveVertex (220, 250);
curveVertex (260, 265);
curveVertex (265, 290);
curveVertex (270, 300);
curveVertex (280, 315);
curveVertex (280, 315);
endShape (0);

beginShape ();
curveVertex (220, 310);
curveVertex (220, 310);
curveVertex (240, 295);
curveVertex (270, 293);
curveVertex (270, 293);
vertex (315, 270);
endShape ();

//little strokey curves
beginShape ();
curveVertex (225, 260);
curveVertex (225, 260);
curveVertex (227, 265);
curveVertex (230, 270);
curveVertex (230, 270);
endShape ();
beginShape ();
curveVertex (220, 261);
curveVertex (220, 261);
curveVertex (222, 267);
curveVertex (225, 272);
curveVertex (225, 272);
endShape ();
beginShape ();
curveVertex (223, 261);
curveVertex (223, 261);
curveVertex (224, 267);
curveVertex (227, 272);
curveVertex (227, 272);
endShape ();

line(230, 265, 240, 250);

//white ellipse in the triangle
fill(255,239,219);
ellipse (135, 230, 20, 20);

//yellow triangles
fill (238,154,0);
beginShape (TRIANGLES);
vertex (115, 220);
vertex (120, 205);
vertex (145, 216);

fill (255,236,139);
beginShape (TRIANGLES);
vertex (125, 185);
vertex (135, 175);
vertex (150, 200);

stroke (238,0,0);
line (145, 210, 155, 200);
line (160, 220, 170, 215);

//green triangle blue square red square yellow square
noStroke ();
fill (34,139,34);
beginShape (TRIANGLES);
vertex (155, 365);
vertex (145, 390);
vertex (165, 390);

stroke(0);
fill(0,40,235);
rect (195, 383, 13, 13);

fill (238,0,0);
beginShape (QUADS);
vertex (230, 370);
vertex (250, 367);
vertex (251, 389);
vertex (230, 390);

fill (255,215,0);
beginShape (QUADS);
vertex (300, 375);
vertex (300, 390);
vertex (320, 390);
vertex (319, 372);

//tiny black squares
strokeWeight (8);
point (180, 215);
point (230, 160);
strokeWeight (6);
point (185, 303);
point (195, 300);
strokeWeight (3);
point (190, 210);

strokeWeight(1);
line (185, 303, 195, 300);






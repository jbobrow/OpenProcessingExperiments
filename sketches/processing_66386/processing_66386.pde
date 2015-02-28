
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/66386*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

size(250, 234);
PImage b;
b = loadImage("background.jpg");
background(b);
smooth();


//bottom star
stroke (0); 
strokeWeight (1.5);
line (209, 116, 244, 116); 
line (227, 100, 227, 134);
line (218, 105, 237, 129);
line (213, 127, 239, 105);

//top star
line (191, 0, 198, 10);
line (168, 0, 163, 5);
line (181, 0, 181, 7);

// lines
line (116, 201, 156, 201);

line (5, 47, 5, 73);

line (34, 119, 34, 234);

line (0, 148, 65, 148);

line (0, 197, 53, 197);

line (116, 201, 156, 201);

line (125, 229, 161, 229);

line (191, 215, 221, 202);

line (209, 175, 228, 150);

line (228, 150, 238, 175);

line (160, 228, 125, 228);

line (111, 164, 111, 138);


//black shape in the top center
fill(0);
beginShape ();
vertex(23, 0);
bezierVertex(23, 0, 23, 20, 28, 32);
bezierVertex(41, 49, 54, 62, 58, 70);
bezierVertex(64, 85, 70, 105, 72, 105);
bezierVertex(87, 116, 97, 124, 110, 128);
bezierVertex(127, 129, 161, 132, 183, 123);
bezierVertex(198, 112, 206, 106, 214, 97);
bezierVertex(222, 82, 240, 38, 244, 0);
bezierVertex(244, 0, 227, 0, 227, 0);
bezierVertex(226, 5, 214, 34, 194, 37);
bezierVertex(158, 38, 139, 14, 129, 0);
bezierVertex(129, 0, 23, 0, 23, 0);
endShape();

//black cercles
beginShape ();
vertex(34, 217);
bezierVertex(38, 217, 41, 220, 41, 223);
bezierVertex(41, 226, 38, 228, 33, 228);
endShape();

beginShape ();
bezier(141, 170, 138, 161, 154, 155, 156, 169);
bezier(141, 170, 143, 178, 157, 176, 156, 169);

bezier(78,199,80,185,60,175,52,193);
bezier(78,199,75,218,44,214,52,193);

bezier(0,53,19,56,14,35,0,40);
bezier(0,69,16,65,18,86,0,83);
bezier(168,234,171,221,153,218,155,234);
bezier(126,234,131,218,109,217,113,234);

endShape();

noStroke();
beginShape ();
bezier(15, 114, 12, 90, 50, 95, 49, 114);
bezier(15, 114, 17, 137, 48, 136, 49, 114);

bezier(85, 148, 80, 133, 61, 136, 59, 148);
bezier(85, 148, 85, 163, 56, 161, 59, 148);

bezier(64, 89, 52, 92, 56, 112, 70, 104);

beginShape ();
ellipse(111, 166, 18, 14);
ellipse(111, 138, 14, 10);

ellipse(107,201,20,15);
ellipse(165,201,17,16);
ellipse(184,180,17,13);
ellipse(208,177,16,14);
ellipse(236,176,13,12);
ellipse(224,202,13,15);
ellipse(188,218,13,12);



noFill();
stroke(1);
bezier(150, 160, 167, 127, 187, 149, 183, 172);
bezier(0, 31, 5, 32, 20, 29, 24, 20);
endShape();



//redhalf ball
fill (226, 48, 12);
noStroke();
beginShape ();
bezier(64, 89, 70, 89, 79, 100, 70, 104);

beginShape ();
vertex(44, 0);
bezierVertex(44, 0, 44, 2, 26, 24);
bezierVertex(24, 23, 25, 18, 22, 3);
bezierVertex(23, 0, 23, 0, 23, 0);
endShape();

beginShape ();
vertex(34, 217);
bezierVertex(29, 217, 26, 220, 26, 223);
bezierVertex(26, 226, 29, 228, 34, 228);
endShape();

//square
fill(0);
rect(0, 149, 35, 49);



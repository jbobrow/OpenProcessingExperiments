
//background
size (320, 480);
smooth ();
background (45, 49, 58);
int x = 480;

//robot head
noStroke();
fill(187, 215, 86);
quad(129, x-296, 200, x-296, 200, x-233, 129, x-233);

//robot eyes
fill(215, 31, 38);
ellipse(149, x - 271, 21, 21);
ellipse(179, x - 271, 21, 21);

//robot mouth
fill(45, 49, 58);
quad(150, x-247, 177, x-247, 178, x-241, 149, x-241);

//robot neck
fill(112, 113, 113);
quad (144, x - 233, 185, x - 233, 186, x- 223, 142, x - 223);

//robot body
fill(187, 215, 86);
quad (121, x - 223, 211, x - 223, 211, x - 125, 121, x - 125);

//robot command
fill(112, 113, 113);
quad (129, x - 213, 201, x - 213, 201, x - 165, 129, x - 165);

fill(215, 31, 38);
ellipse (177, x - 201, 12, 12);
ellipse (192, x - 201, 12, 12);

//left leg
fill(112, 113, 113);
quad(136, x - 125, 150, x - 125, 153, x - 92, 134, x - 92);
fill(187, 215, 86);
quad(127, x - 92, 159, x - 92, 162, x - 76, 124, x - 76);

//right leg
fill(112, 113, 113);
quad(179, x - 125, 194, x - 125, 197, x- 92, 177, x - 92);
fill(187, 215, 86);
quad(170, x - 92, 203, x- 92, 206, x - 76, 169, x - 76);

//antenna
fill(187, 215, 86);
triangle(164, x - 309, 170, x - 296, 161, x- 296);
ellipse(164, x - 309, 14, 14);

//sparks
fill(215, 31, 38);
beginShape();
vertex(135, x - 313);
vertex(147, x - 318);
vertex(148, x - 312);
vertex(154, x - 312);
vertex(145, x - 307);
vertex(144, x - 312);
endShape();

beginShape();
vertex(162, x - 343);
vertex(168, x - 331);
vertex(162, x - 329);
vertex(162, x - 323);
vertex(157, x - 332);
vertex(162, x - 334);
endShape();

beginShape();
vertex(173, x - 313);
vertex(181, x - 318);
vertex(183, x - 313);
vertex(192, x - 315);
vertex(181, x - 307);
vertex(178, x - 313);
endShape();

//left arm
fill(112, 113, 113);
beginShape();
vertex(121, x - 201);
vertex(77, x - 201);
vertex(77, x - 245);
vertex(95, x - 245);
vertex(95, x - 219);
vertex(121, x - 219);
endShape();

//right arm
fill(112, 113, 113);
beginShape();
vertex(211, x - 220);
vertex(255, x - 220);
vertex(255, x - 176);
vertex(236, x - 176);
vertex(237, x - 201);
vertex(211, x - 201);
endShape();

//right hand
fill(187, 215, 86);
ellipse(86, x - 256, 30, 30);
fill(45, 49, 58);
ellipse(86, x - 265, 17, 17);

//left hand
fill(187, 215, 86);
ellipse(246, x - 165, 30, 30);
fill(45, 49, 58);
ellipse(246, x - 155, 17, 17);

//lines
stroke(0);
strokeWeight(2);
line(143, x - 228, 185, x - 228);

//left leg line
line(135, x - 119, 151, x - 119);
line(134, x - 110, 152, x - 110);
line(134, x - 100, 152, x - 100);

//right leg line
line(179, x - 119, 195, x - 119);
line(178, x - 110, 196, x - 110);
line(178, x - 100, 196, x - 100);

//left arm line
line(77, x - 234, 95, x - 234);
line(77, x - 223, 95, x - 223);
line(77, x - 202, 95, x - 219);
line(102, x - 219, 102, x - 202);
line(112, x - 219, 112, x - 202);

//right arm line
line(220, x - 220, 220, x - 201);
line(229, x - 220, 229, x - 201);
line(237, x - 201, 254, x - 219);
line(237, x - 196, 255, x - 196);
line(237, x - 186, 255, x - 186);

//robot command line
line(141, x - 197, 141, x - 169);
line(145, x - 197, 145, x - 169);
line(149, x - 197, 149, x - 169);
line(153, x - 197, 153, x - 169);

//robot command button
noStroke();
fill(255);
quad(173, x - 189, 182, x - 189, 182, x - 181, 173, x - 181);
quad(184, x - 189, 192, x - 189, 192, x - 181, 184, x - 181);
quad(173, x - 179, 182, x - 179, 182, x- 170, 173, x - 170);
quad(184, x - 179, 192, x - 179, 192, x - 170, 184, x - 170);





//D|MA 28 - Interactivity
//crop of El Lissitzky's Proun, Street Decoration Design
//by April Lee

size(640, 360);
background(235, 223, 196);

smooth();

//bottom right red triangle
stroke(173, 164, 149);
fill(254, 26, 28);
triangle(617, 269, 669, 265, 650, 328);

//bottom right grey lines
stroke(173, 164, 149);
line(548, 328, 530, 333);
line(516, 196, 543, 326);

//black triangle
fill(69, 57, 51);
triangle(404, 242, 504, 205, 529, 335);

//yellow box side
fill(229, 225, 164);
quad(284, 287, 611, 164, 611, 142, 282, 257);

//taupe box side
fill(195, 154, 140);
quad(282, 257, 611, 142, 484, 53, 117, 144);

//black left box side
noStroke();
fill(69, 57, 51);
quad(120, 169, 284, 287, 282, 257, 117, 144);

//blue shape
fill(121, 178, 227);
quad(-21, 254, 453, 142, 395, -91, -66, 6);
stroke(222, 222, 215, 150);
strokeWeight(1);
line(-21, 254, 453, 142);
stroke(126, 111, 118, 150);
line(453, 142, 395, -91);

//top left red shape
strokeWeight(1);
stroke(173, 164, 149);
fill(255, 33, 39);
triangle(51, 67, -81, 94, 21, -52);

//grey line
stroke(222, 222, 215);
strokeWeight(25);
line(-4, 85, 470, -18);

//red line
stroke(227, 35, 35);
strokeWeight(10);
line(-4, 103, 470, -6);

//left circle
fill(33, 24, 30);
noStroke();
ellipse(-150, 289, 426, 426);

//top black line
stroke(31, 30, 33);
strokeWeight(25);
strokeCap(SQUARE);
line(140, 6, 226, -15);

//right red plane
stroke(252, 50, 44);
strokeWeight(9);
strokeCap(SQUARE);
line(497, 115, 643, 78);

//right cream top plane
stroke(173, 164, 149);
strokeWeight(1);
fill(228, 221, 201);
quad(497, 110, 646, 74, 648, 63, 486, 104);

//right cream left plane
noStroke();
quad(486, 104, 497, 110, 498, 119, 487, 112);


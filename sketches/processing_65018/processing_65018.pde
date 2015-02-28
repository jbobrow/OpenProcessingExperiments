
//applet > compress applet > title: test description: workshop 2
size(640, 360);
background(227, 218, 187);

//brown rectangle, bottom left corner
smooth();
stroke(160, 136, 126);
fill(173, 155, 149);
quad(182, 280, 246, 327, -54, 441, -48, 350);

//yellow rectangle, bottom left corner
fill(228, 215, 160);
stroke(200, 194, 174);
quad(246, 327, 246, 342, -48, 448, -48, 433);

//black rectangle, top left corner
fill(31, 28, 27);
stroke(22, 20, 23);
quad(118, 8, 128, 49, 0, 85, 0, 37);

//blue curve
fill(130, 166, 202);
noStroke();
arc(147, 10, 210, 280, radians(10), radians(72));
triangle(145, 95, 220, 100, 178, 143);  

//gray curve
noStroke();
fill(213, 206, 188);
arc(155, 0, 155, 240, 0, radians(65));
triangle(198, 76, 188, 109, 138, 66);

//beige curve
fill(227, 218, 187);
arc(115, 0, 135, 190, 0, radians(75));  

//red triangle, bottom right corner
fill(227, 60, 53);
triangle(435, 360, 530, 349, 510, 360);

//blue quadrangle, left side
fill(122, 165, 204);
stroke(150, 157, 166);
quad(99, 35, 173, 327, -40, 398, -50, 74);



//yellow-brown rectangle
fill(54, 48, 45);
noStroke();
quad(283, 53, 313, 43, 312, 48, 281, 58);
fill(157, 121, 66);
quad(313, 43, 542, 233, 540, 238, 312, 48); 
fill(225, 208, 156);
stroke(221, 199, 134);
quad(281, 58, 312, 48, 540, 238, 510, 248);

//black rectangle, stretches across the page
fill(64, 58, 50);
noStroke();
quad(40, 251, 611, 104, 613, 112, 42, 259);

//white and red rectangle directly below long black rectangle
fill(225, 221, 207);
stroke(211, 203, 178);
quad(0, 281, 329, 197, 331, 207, 0, 291);

//red rectangle connected to white rectangle
fill(212, 59, 51);
noStroke();
quad(0, 291, 332, 207, 332, 212, 0, 296);

//smaller red and white rectangle
fill(229, 222, 204);

quad(183, 310, 189, 312, 189, 314, 183, 313);
//white top
stroke(198, 191, 165);
quad(183, 310, 275, 282, 280, 285, 189, 311);
//red square
fill(223, 56, 49);
noStroke();
quad(189, 311, 280, 285, 280, 288, 189, 314);

//black, white, and red rectangle; center
fill(52, 46, 43);
quad(240, 147, 247, 151, 247, 160, 240, 156); 
fill(228, 218, 192);
stroke(198, 188, 155);
quad(240, 147, 494, 103, 501, 106, 247, 151); 
fill(214, 60, 50);
quad(247, 151, 501, 106, 501, 115, 247, 160);

//red curve
noFill();
strokeWeight(42);
strokeCap(SQUARE);
stroke(203, 31, 27);
arc(15, 10, 315, 322, radians(11), radians(145));





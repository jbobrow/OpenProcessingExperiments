
// Yeonju Cho

size(640,360);
background(222, 215, 189);
smooth();
noStroke();

// a Cube next to the Blue Rect
fill(217, 215, 199);
quad(54, 54, 105, 43, 117, 92, 11, 116);
fill(49, 45, 54);
quad(11, 116, 117, 92, 123, 119, 19, 145);

// 2 Cubes under the Blue Rect
// lower one
fill(79, 68, 61); // black
quad(421, 177, 477, 217, 488, 275, 433, 234);
fill(224, 212, 162); // yellow
quad(477, 217, 484, 214, 496, 273, 488, 275);
// upper one
fill(171, 137, 123); // brown
quad(321, 199, 468, 149, 525, 189, 378, 240);
fill(54, 53, 51); // black
quad(333, 219, 346, 213, 378, 240, 378, 254);
fill(227, 215, 170); // yellow
quad(378, 240, 525, 189, 526, 200, 378, 254);

// a Blue Rect
fill(114, 157, 194);
quad(95, 0, 408, 0, 454, 190, 157, 260);

// a Blue Triangle next to the Blue Rect
fill(114, 157, 194);
triangle(420, 0, 495, 0, 464, 36);

// Red Rect in front of the Blue Rect
fill(217, 46, 43);
quad(0, 150, 256, 86, 273, 154, 0, 224);

// Red Arc in front tof the Blue Rect
fill(217, 46, 43);
arc(204, -216, 610, 610, 0, 1.40);
fill(114, 157, 194);
arc(204, -216, 510, 510, 0, 1.41);

// a Black Circle below the Blue Rect
fill(41, 41, 38);
ellipse(185, 252, 203, 203);

// a Red Cube in front of the Black Circle
fill(207, 203, 186);
quad(127, 198, 156, 186, 170, 193, 140, 204);
quad(140, 204, 170, 193, 104, 360, 77, 360);
fill(219, 53, 44);
quad(127, 198, 140, 204, 77, 360, 61, 360);

// a Yellow Stick and a Grey Stick
// grey one
fill(175, 179, 171);
quad(41, 296, 227, 253, 232, 275, 47, 316);

// yellow one
fill(217, 194, 132);
quad(67, 265, 182, 238, 187, 263, 72, 289);
quad(161, 268, 187, 262, 193, 290, 167, 296);
// fill(219, 168, 0);
// line(160, 266, 161, 269);

// a Red Quad on the right side
fill(209, 29, 29);
quad(528, 249, 640, 231, 640, 330, 592, 350);

// 4 sticks
// 1st
fill(227, 217, 191);
quad(544, 23, 640, 7, 640, 13, 552, 27);
fill(209, 53, 48);
quad(552, 27, 640, 12, 640, 23, 552, 37);
fill(41, 40, 35);
quad(544, 23, 552, 27, 552, 37, 544, 33);
// 2nd
fill(49, 51, 48);
quad(314, 125, 640, 50, 640, 58, 316, 134);
// 3rd
fill(222, 219, 202);
quad(181, 176, 623, 74, 626, 82, 182, 185);
fill(204, 56, 43);
quad(182, 185, 626, 82, 626, 87, 184, 189);
// 4th
fill(227, 219, 202);
quad(470, 172, 564, 148, 568, 151, 474, 175);
fill(219, 68, 48);
quad(474, 175, 568, 151, 570, 155, 475, 178);
fill(227, 172, 202);
quad(470, 172, 474, 175, 475, 178, 469, 176);



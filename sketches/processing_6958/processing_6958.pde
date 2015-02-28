
size (640, 480);
translate(0, -90);
scale(1.9);
get(200, 300, 640, 480);
background (229, 222, 212);
smooth();
noStroke();

//yellow graded circle in top left corner
fill(224, 197, 122);
ellipse(118, 144, 72, 72);
fill(236, 186, 54);
ellipse(118, 144, 58, 58);
//pink graded circle in top left corner
fill(213, 139, 137);
ellipse(84, 74, 150, 150);
//red circle in top left corner
stroke(0);
strokeWeight(0.5);
fill(196, 45, 38);
ellipse(118, 144, 47, 47);
//black circle in top left corner
fill(0);
ellipse(84, 74, 120, 120);
//purple circle in top left corner
fill(127, 79, 122);
ellipse(84, 74, 56, 56);

//black arc + lines group in top left quadrant
stroke(0);
strokeWeight(5);
strokeCap(SQUARE);
noFill();
arc(170, 90, 104, 88, radians(2), radians(95));
arc(170, 90, 104, 96, radians(2), radians(95));
arc(170, 90, 104, 104, radians(2), radians(95));
strokeWeight(1);
line(200, 39, 200, 149);
line(184, 78, 221, 78);
line (187, 86, 224, 85);
line (176, 43, 253, 78);

//black squiggle + lines group in top left quadrant
noFill();
stroke(0);
//arc1
strokeWeight(6);
bezier(98, 226, 91, 222, 81, 205, 82, 201);
//arc2
strokeWeight(5);
strokeCap(ROUND);
bezier(82, 201, 79, 198, 84, 170, 114, 192);
//arc3
strokeWeight(4);
bezier(114, 192, 120, 200, 139, 202, 147, 184);
//arc4
strokeWeight(3);
bezier(147, 184, 153, 169, 164, 157, 184, 173);
//arc5
strokeWeight(2);
bezier(184, 173, 192, 181, 204, 179, 216, 164);
//arc6
strokeWeight(1);
strokeCap(SQUARE);
bezier(216, 164, 236, 150, 253, 141, 283, 145);
line(64, 206, 279, 147);

//line up
stroke(0);
strokeWeight(1);
line(109, 203, 201, 108); 
//line down
line(201, 108, 367, 252);

//MIDLEFT SHAPE CLUSTER
noFill();
// yellow shaded arc behind black arc
stroke(223, 206, 145);
strokeWeight(5);
bezier(114, 274, 111, 249, 124, 234, 152, 235);
//black arc
stroke(0);
strokeWeight(1);
bezier(116, 276, 110, 250, 123, 235, 152, 236);
//yellow shading slope up
stroke(223, 206, 145);
strokeWeight(5);
line(151, 235, 171, 189);
//yellow shading slope down
stroke(223, 206, 145);
strokeWeight(5);
line(171, 189, 188, 205);
//green shaded arc outside black arc
stroke(73, 105, 76);
strokeWeight(3);
bezier(191, 210, 193, 194, 210, 199, 210, 209);
//black arc inside green arc
stroke(0);
strokeWeight(1);
bezier(193, 211, 193, 195, 209, 201, 209, 210);
//purple arc
stroke(217, 196, 213);
strokeWeight(3);
bezier(188, 207, 190, 191, 208, 191, 212, 204);
//yellow shaded arc oustide purple arc
stroke(223, 206, 145);
strokeWeight(2);
bezier(187, 205, 189, 189, 209, 188, 213, 202);
//yellow shading slope up
stroke(223, 206, 145);
strokeWeight(4);
line(213, 202, 219.5, 191);
//yellow shading slope down
stroke(223, 206, 145);
strokeWeight(4);
line(217.5, 191, 226, 200);
//light blue shaded arc
stroke(174, 194, 204);
strokeWeight(3);
bezier(230, 206, 235, 202, 241, 202, 245, 206);
//black arc inside light blue arc
stroke(0);
strokeWeight(2);
bezier(233, 209, 235, 206, 239, 206, 242, 209);
//pink shaded arc
stroke(228, 215, 213);
strokeWeight(2);
bezier(227, 203, 229, 194, 242, 193, 250, 202);
//yellow shaded arc outside pink shaded arc
stroke(223, 206, 145);
strokeWeight(3);
bezier(226, 200, 230, 193, 243, 191, 251, 200);

//light graded purple circle in bottom left corner
fill(175, 170, 197);
noStroke();
ellipse(60, 298, 70, 70);
//blue graded circle in bottom left corner
fill(120, 160, 193);
ellipse(60, 298, 58, 58);
//yellow circle in bottom left corner
stroke(0);
strokeWeight(1);
fill(236, 186, 54);
ellipse(60, 298, 44, 44);

strokeWeight(2);
//vertical shapes
fill(255);
quad(134, 285, 171, 190, 203, 220, 153, 295);
quad(153, 295, 219, 195, 237, 214, 156, 297);
quad(156, 297, 271, 179, 275, 184, 167, 303);
quad(167, 303, 307, 148, 311, 152, 173, 315);

//horizontal lines left to right
line(144, 256, 188, 298);
line(150, 242, 201, 282);
line(156, 228, 217, 262);
line(162, 212, 226, 252);
line(171, 190, 230, 246);
line(208, 212, 237, 239);
line(213, 206, 241, 233);
line(219, 195, 248, 225);
line(251, 199, 262, 209);
line(263, 189, 272, 198);
line(275, 184, 280, 189);

//colored (and black) filled shapes
//big orange
fill(184, 119, 50);
quad(134, 285, 145, 256, 165, 276, 153, 295);
//light blue
fill(206, 214, 220);
quad(153, 295, 165, 276, 171, 282, 156, 297);
//light green
fill(186, 183, 99);
quad (167, 303, 179, 289, 188, 297, 178, 308);
//tan
fill(216, 211, 192);
quad(171, 282, 184, 269, 193, 275, 179, 289);
//dark green
fill(83, 101, 64);
quad(151, 242, 156, 228, 186, 245, 175, 261);
//aqua
fill(99, 151, 179);
quad(186, 245, 195, 233, 209, 242, 200, 252);
//forest green
fill(70, 95, 69);
quad(209, 242, 217, 234, 224, 240, 218, 247);
//pink
fill(217, 174, 176);
quad(209, 257, 218, 247, 226, 252, 217, 262);
//small orange
fill(184, 119, 50);
quad(235, 227, 243, 219, 248, 225, 241, 233);
//black quad 1
fill(0);
quad(165, 276, 175, 261, 184, 269, 171, 282);
//black quad 2
quad(163, 212, 171, 190, 203, 221, 195, 233);
//black quad 3
quad(203, 221, 208, 212, 224, 228, 217, 234);
//black quad 4
quad(224, 240, 230, 233, 237, 239, 230, 246);
//black quad 5
quad(224, 228, 229, 222, 235, 227, 230, 233);
//black quad 6
quad(213, 206, 219, 195, 237, 214, 228, 222);
//black quad 7
quad(257, 204, 267, 193, 272, 198, 262, 209);
//black quad 8
quad(263, 189, 271, 179, 275, 184, 267, 193);
//black quad 9
quad(275, 184, 282, 177, 287, 181, 280, 189);
//black quad 10
quad(289, 168, 294, 162, 299, 166, 294, 172);
//black quad 11
quad(300, 156, 307, 148, 311, 152, 304, 160);

//black thick line in bottom left
fill(0);
quad(79, 256, 77, 260, 173, 315, 178, 308);

//CENTER BOTTOM CLUSTER
//yellow graded circle
noStroke();
//peach circle
stroke(122);
strokeWeight(0.5);
fill(221, 198, 177);
ellipse(236, 366, 38, 38);
//blue circle
strokeWeight(0.5);
fill(14, 96, 143);
ellipse(232, 364, 34, 34);
//line 1
strokeWeight(2);
line(157, 384, 264, 311);
//line 2
strokeWeight(1);
line(175, 408, 251, 334);
//parallel lines


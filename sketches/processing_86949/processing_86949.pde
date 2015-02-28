
size(640, 480);

noStroke();
smooth();

//backgroud color
fill(205, 207, 186);
quad(0, 104, 640, 104, 640, 318, 0, 318);
fill(221, 214, 185);
quad(0, 318, 640, 318, 640, 480, 0, 480);
fill(197, 199, 183);
quad(0, 0, 640, 0, 640, 159, 0, 143);

//dark bars
fill(166, 165, 145);
triangle(0, 0, 22, 0, 0, 8);
quad(336, 0, 365, 0, 0, 154, 0, 130);
quad(620, 0, 639, 0, 0, 408, 0, 377);
quad(640, 220, 640, 250, 430, 479, 392, 480);

//light lines background
noFill();
stroke(134, 136, 124);
line(102, 0, 102, 72);
line(247, 0, 240, 95);
line(423, 0, 420, 130);
line(633, 0, 630, 148);
bezier(102, 72, 145, 89, 507, 151, 640, 152);
bezier(0, 145, 90, 171, 435, 222, 638, 227);
bezier(0, 223, 115, 255, 468, 315, 640, 317);

//blue line
noStroke();
fill(20, 91, 144);
quad(0, 51, 640, 68, 640, 72, 0, 74);

//black lines
noFill();
stroke(34, 47, 44);
strokeWeight(3);
line(0, 199, 640, 378);
line(0, 251, 640, 480);
line(0, 282, 105, 323);
line(105, 323, 469, 155);
line(597, 87, 640, 57);
line(0, 214, 2, 214);
strokeWeight(8);
line(539, 259, 640, 256);

//yellow quad
noStroke();
fill(245, 185, 52);
quad(0, 11, 37, 18, 8, 80, 0, 77);
quad(154, 39, 270, 56, 242, 137, 180, 122);
quad(440, 78, 670, 100, 611, 210, 458, 181);
//black quad
fill(23, 30, 28);
quad(51, 21, 142, 37, 116, 107, 76, 96);
quad(282, 59, 417, 75, 382, 166, 302, 149);

//light blue curve
fill(96, 144, 130);
beginShape();
vertex(47, 44);
bezierVertex(83, 50, 80, 75, 30, 75);
bezierVertex(50, 80, 60, 25, 30, 20);
endShape();



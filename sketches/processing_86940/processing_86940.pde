
size(640, 480);

noStroke();
smooth();

//backgroud color
fill(197, 199, 183);
quad(0, 0, 640, 0, 640, 104, 0, 104);
fill(205, 207, 186);
quad(0, 104, 640, 104, 640, 253, 0, 253);
fill(221, 214, 185);
quad(0, 253, 640, 253, 640, 480, 0, 480);

//3 diagonal bars
fill(166, 165, 145);
quad(104, 0, 120, 0, 0, 133, 0, 107);
quad(350, 0, 361, 0, 208, 479, 166, 479);
quad(620, 0, 639, 0, 640, 37, 632, 37);

//light lines background
stroke(134, 136, 124);
line(176, 0, 176, 110);
line(399, 0, 394, 120);

//light curve line background
noFill();
bezier(0, 94, 139, 115, 542, 139, 640, 111);
bezier(0, 170, 100, 205, 559, 212, 640, 199);

//ellipse
noStroke();
fill(247, 183, 51);
ellipse(553, 75, 374, 124);

//dark line
noFill();
stroke(34, 47, 44);
strokeWeight(8);
line(0, 192, 640, 173);
strokeWeight(3);
line(596, 0, 631, 149);
line(404, 426, 640, 364);
quad(0, 328, 426, 452, 75, 465, 0, 435);

//blue curve
stroke(69, 93, 105);
strokeWeight(8);
bezier(234, 0, 176, 164, 577, 326, 640, 315);




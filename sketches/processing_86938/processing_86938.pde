
background(180, 189, 178);
size(640, 480);

//brown parallelogram
noStroke();
fill(81, 63, 53);
quad(125, 0, 310, 0, 400, 126, 200, 110);
//ivoryquads
fill(216, 212, 183);
rect(260, 0, 35, 120);
quad(200, 110, 400, 126, 460, 200, 250, 190);
triangle(0, 355, 250, 480, 0, 480);
triangle(350,290,500,280,700,550);

fill(81, 63, 53);
quad(530,400, 590,400, 590,470, 530,423);
triangle(590,400, 640,470, 590,470);

//left white rect
noStroke();
fill(255);
quad(0, 0, 35, 0, 45, 250, 0, 260);

//pink rect
noStroke();
fill(187, 84, 113);
rect(0, 0, 70, 150);
triangle(0, 150, 70, 150, 70, 160);
rect(630, 0, 10, 160);


//black rect lines (3)
fill(30, 40, 35);
rect(565, 0, 15, 240);
rect(460, 0, 15, 135);
rect(360, 0, 15, 60);

//horizontal line
stroke(30, 40, 35);
strokeWeight(4);
smooth();
line(0, 89, 640, 65);

//line over pink rect under orange circle
stroke(30, 40, 35);
strokeWeight(4);
line(35, 30, 45, 325);

//orange circle left
noStroke();
fill(255, 122, 56, 222);
ellipse(8, 280, 120, 120);

//star upper left
fill(30, 40, 35);
//triangle(54,25, 58,35, 50,35);
//triangle(58,35, 70,39, 58,43);
//rect(50,35,8,8);
triangle(55, 25, 64, 45, 46, 45);
triangle(46, 45, 46, 32, 65, 32);
fill(187, 84, 113);
triangle(45, 45, 55, 39, 65, 45);
triangle(46, 32, 46, 45, 51, 36);

//line
stroke(30, 40, 35);
strokeWeight(4);
smooth();
line(40, 185, 265, 195);
line(265, 195, 640, 150);

//line
stroke(30, 40, 35);
strokeWeight(4);
line(68,270, 106,270);

//blue parallelogram
noStroke();
fill(44, 78, 142);
quad(90, 192, 190, 196, 210, 330, 120, 330);
quad(450, 205, 495, 205, 515, 320, 450, 320);

//orange oblong shapes
noStroke();
fill(255, 122, 56);
ellipse(210, 280, 125, 125);
ellipse(440, 310, 125, 125);

//fake negative space
fill(180, 189, 178);
rect(240, 280, 100, 100);
fill(44, 78, 142);
rect(140, 220, 20, 108);

//red parallelogram
fill(198, 42, 56);
quad(355, 355, 485, 355, 505, 400, 372, 398);
quad(98, 360, 215, 363, 220, 393, 103, 390);

//peach quad
fill(187, 119, 80);
quad(215, 195, 490, 195, 492, 301, 218, 298);

//golden arrow
fill(243, 185, 97);
triangle(240, 3, 300, 115, 300, 240);
triangle(350, 3, 300, 240, 300, 115);

//cross
smooth();
noStroke();
//blue
fill(0, 114, 176);
rect(235, 78, 25, 130);
rect(208, 110, 80, 25);
//white
fill(255);
rect(240, 78, 15, 130);
rect(208, 115, 80, 15);

//black lines
strokeWeight(5);
smooth();
stroke(30, 40, 35);
line(0,437, 440,444);
line(0,350,250,350);
line(0,375,315,375);
line(315,375, 305,301);

//rect
noStroke();
fill(30, 40, 35);
quad(200,480, 235,440, 260,440, 225,480);
rect(523,410,7,45);

fill(182,83,64);
rect(225,428,85,20);

// lines
stroke(30, 40, 35);
strokeWeight(4);
line(549,350,640,340);

//burgandy lines
stroke(71,33,30);
line(130,415,250,415);
line(219,385,250,385);

//red burst
noStroke();
fill(198, 42, 56);
triangle(480,280, 495,280, 489,315);
quad(534,282, 546,282, 546,290, 498, 316);
triangle(500,322, 548,314, 548,330);
quad(498,330, 547,352, 548, 361, 534,361);
triangle(487, 335, 495, 366, 481, 366);
quad(478, 330, 441, 366, 426, 366, 426, 360);
triangle(477,322, 430,315, 430, 330);
quad(480,315,440,285,430,285,430,295);

//blue line
stroke(19,58,130);
line(-5,280,45,480);
line(45,480, 65,390);
line(-5,280,640,400);




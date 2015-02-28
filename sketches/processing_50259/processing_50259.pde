
// El Lissitzky Crop 2

size(500, 500);
background(229, 219, 194);
smooth();
noFill();


// blue quad
noStroke();
fill(136, 176, 216);
quad(135,0, 500,-9, 530,295, 225,360);

// red arc
noStroke();
stroke(217, 49, 45);
strokeWeight(50);
strokeCap(SQUARE);
arc(243,-265, 780, 780, radians(30), radians(75));


// red quad big
noStroke();
fill(217, 49, 45);
quad(-20, 230, 350, 136, 371,225, -1,317);

// circle
noStroke();
fill(0);
ellipse(252,355, 260,260);

//white quad big
stroke(185);
strokeWeight(1);
fill(255);
quad(90,90, 154,78, 171,144, 38,175);

//navy quad
noStroke();
fill(23,48,113);
quad(38,175, 171,144, 182,179, 48,213);

// small black quad
noStroke();
fill(0);
quad(425,185, 515,165, 520,175, 428,197);

// white long quad 
stroke(185);
strokeWeight(1);
fill(255);
quad(253,252, 520,187, 520,200, 255,262);

// thin red line
stroke(217, 49, 45);
strokeWeight(5);
line(257, 264, 520, 202);

// diagonal red quad
noStroke();
fill(217, 49, 45);
quad(185,280, 203,287, 115,510, 95,510);

//diagonal white quad
stroke(185);
strokeWeight(1);
fill(255);
quad(203,287, 240,272, 152,510, 115,510);

//small white quad
stroke(185);
strokeWeight(1);
fill(255);
quad(185,280, 220,265, 240,272, 203,287);

// yellow quad1
noStroke();
fill(235, 203, 65);
quad(107,365, 220,340, 229,369, 114,396);

// gray quad 
noStroke();
fill(180);
quad(73,403, 313,349, 320,375, 80,430);


// yellow quad2
noStroke();
fill(235, 203, 65);
quad(219,340, 255,332, 270,397, 237,405);

// triangle
noStroke();
fill(164, 145, 139);
triangle(455,310, 510,299, 510,345);

// diagonal gray quad
noStroke();
fill(70);
quad(440,313, 455,310, 510,345, 506,356);













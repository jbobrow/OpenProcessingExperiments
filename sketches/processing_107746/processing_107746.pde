
//hw 1
//© Eden Weingart, August 2013, Pittsburgh, PA

size(400, 400);
background(208, 229, 219);
smooth();

// Diamond
noStroke();
fill(100, 100, 100, 30);
quad(200, -50, 450, 200, 200, 450, -50, 200);
fill(100, 100, 100, 30);
quad(200, -15, 415, 200, 200, 415, -15, 200);
fill(255);
quad(200, 8, 388, 200, 200, 388, 8, 200);
stroke(100, 100, 100, 95);
quad(200, 30, 370, 200, 200, 370, 30, 200);
noFill();
stroke(255);
quad(200, -90, 490, 200, 200, 490, -90, 200);
stroke(100, 100, 100, 95);
noFill();
quad(200, 100, 300, 200, 200, 300, 100, 200);
fill(255);
noStroke();
quad(100, 140, 300, 140, 300, 260, 100, 260 );

// Triangles
fill(245, 49, 15);
noStroke();
triangle(200, 50, 190, 60, 210, 60);
triangle(200, 350, 190, 340, 210, 340);
triangle(50, 200, 60, 190, 60, 210);
triangle(350, 200, 340, 190, 340, 210);

// K
noFill();
strokeWeight(5);
strokeCap(SQUARE);
stroke(0);
arc(176, 163, 53, 70, radians(0), radians(100));
arc(171, 233, 76, 70, radians(270), radians(360));
line(169, 163, 169, 233);

// K Serifs
line(162, 163, 176, 163);
line(195, 163, 209, 163);
line(162, 235, 176, 235);
line(202, 235, 216, 235);

//E
noFill();
line(107, 163, 107, 233);
line(107, 196, 130, 196);

//E Serifs
line(100, 163, 145, 163);
line(100, 235, 145, 235);
line(145, 161, 145, 170); 
line(145, 228, 145, 237); 
line(130, 189, 130, 203);

//W
line(232, 163, 248, 235);
//line(270, 160, 254, 232);
//line(263, 160, 279, 232);
line(296, 163, 279, 235);
arc(243, 161, 41, 152, radians(0), radians(80));
arc(284, 161, 41, 152, radians(100), radians(180));

//W Serifs
line(240, 235, 256, 235);
line(270, 235, 286, 235);
line(288, 163, 302, 163);
line(225, 163, 239, 163);
line(256, 163, 270, 163);

// Decoration




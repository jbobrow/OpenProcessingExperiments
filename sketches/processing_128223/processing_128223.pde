
//copyright Leslie Bloomfield lbloomfi 2014
size (400, 400);
background(178, 235, 255);


//letter l
noStroke();
fill(255, 85, 3);
rect(0, 40, 100, 200);
fill (255, 203, 234, 180);
rect(40, 0, 100, 200);

// letter a
fill(255, 85, 3);
noStroke();
triangle(50, 400, 168, 145, 280, 400);
stroke(255, 203, 234, 180);
strokeWeight(40);
strokeCap(SQUARE);
line(100, 260, 250, 260);

// letter B
fill (255, 85, 3);
strokeWeight(30);
strokeCap(SQUARE);
arc(264,268, 238,200,   radians(250), radians(430));
strokeCap(PROJECT);

arc(199,115, 230,200,   radians(250), radians(430));





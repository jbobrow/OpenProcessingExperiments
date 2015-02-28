
size(450,450);
background(255, 255, 255);

strokeCap(SQUARE);

//lines

//top
strokeWeight(6);
line(200, 0, 200, 175);
strokeWeight(8);
line(0, 175, 450, 175);

//middle
strokeWeight(6);
line(200, 0, 200, 275);
strokeWeight(8);
line(0, 275, 450, 275);

//bottom
strokeWeight(6);
line(40, 275, 40, 450);
line(200, 275, 200, 450);
line(350, 275, 350, 450);
line(200, 425, 350, 425);

//squares
//red
fill(165,0,0);
rect(-5, -5, 205, 180);

//yellow
fill(250, 220, 25);
rect(-5, 275, 45, 200);

//blue
fill(0, 0, 120);
rect(200, 275, 150, 150);

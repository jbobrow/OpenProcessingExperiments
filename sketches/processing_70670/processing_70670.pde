
size (300, 300);
background (255, 255, 255);

smooth();
strokeCap(SQUARE);

//all across horizontal and vertical
strokeWeight(9);
line(70, 0, 70, 300);
line(0, 210, 300, 210);

//upper left horizontal, inner
strokeWeight(13);
line(0, 95, 70, 95);

//bottom left horizontal, inner
strokeWeight(11);
line(275, 260, 300, 260);

//bottom left vertical
strokeWeight(7);
line(275, 210, 275, 300);

// red square
noStroke();
fill(232, 72, 56);
rect(75, 0, 300, 206);

// blue square
fill(68, 156, 202);
rect(0, 215, 66, 300);

// yellow square
fill(248, 219, 1);
rect(279, 265, 300, 300);

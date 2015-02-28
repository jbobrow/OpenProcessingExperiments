
// picture

size(600, 600);
smooth();
background(#66CCCC);

// cloud
noStroke();
fill(#FFFFFF, 190)
ellipse(100, 100, 100, 100);
ellipse(150, 50, 100, 75);
ellipse(200, 100, 100, 100);
ellipse(150, 100, 100, 100);

// sun
fill(#FFFF00)
ellipse(600, 0, 350, 350);

// rays
stroke(#FFFF00);
strokeWeight(8);
line(600, 0, 300, 30);
line(600, 0, 310, 90);
line(600, 0, 330, 150);
line(600, 0, 370, 210);
line(600, 0, 420, 260);
line(600, 0, 485, 295);
line(600, 0, 550, 315);

// trunk
stroke(#643200);
strokeWeight(25);
line(150, 600, 150, 390);

// leaves
noStroke();
fill(#10d800);
ellipse(150, 390, 225, 225);

// flowers
strokeWeight(15);
stroke(#ff003c);
point(110, 340);
point(145, 300);
point(80, 410);
point(190, 360);
point(210, 450);
point(145, 405);
point(115, 470);
point(240, 405);
point(210, 320);

// ground
stroke(#0d712a);
fill(#02712a);
curveTightness(.5);
curve(400, 800, 0, 600, 600, 600, 500, 800);

// house
noStroke();
fill(#bfa867);
rectMode(CORNER);
rect(430, 510, 80, 80);

// roof
noStroke();
fill(#605f46)
triangle(470, 470, 525, 515, 415, 515);

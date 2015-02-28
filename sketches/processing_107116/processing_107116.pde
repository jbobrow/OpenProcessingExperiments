
size(1200,500);

PImage background = loadImage("treb-back.jpg");
image(background,0,0);

// Legs
line(800,450,825,425);
line(850, 450, 825, 425);

// Torso
line(825, 425, 825, 375);

// Arms
line(800, 400, 850, 400);

// Head
fill(0,0);
ellipseMode(CORNER);
ellipse(800, 325, 50, 50);

// House
rect(500,300,150,150);
line(500,300,575,200);
line(575,200,650,300);




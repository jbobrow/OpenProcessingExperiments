
size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

// Neck
stroke(25);
line(276, 257, 276, 170);
line(266, 257, 266, 200);
line(286, 257, 286, 170);

// Antennae
line(276, 155, 246, 50);
line(276, 155, 270, 80);
line(276, 155, 306, 110);
line(276, 155, 342, 170);

// Body
noStroke();
fill(20);
ellipse(264, 377, 33, 33);
fill(250);
ellipse(264, 250, 33, 33);
fill(0);
rect(219, 257, 90, 120);
fill(200);
rect(219, 274, 90, 6);
fill(250);
rect(180, 280, 60, 10);
fill(250);
rect(300, 290, 60, 10);

// Head
fill(0);
ellipse(276, 155, 45, 45);
fill(255);
ellipse(288, 150, 14, 14);
fill(0);
ellipse(288, 150, 3, 3);
fill(153);
ellipse(263, 148, 5, 5);
ellipse(296, 130, 4, 4);
ellipse(305, 162, 3, 3);


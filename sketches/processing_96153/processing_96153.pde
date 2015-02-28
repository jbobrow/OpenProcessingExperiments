
size(400, 400);
background(240, 240, 230);

stroke(50);
noFill();
bezier(385, 20, 210, 10, 90, 90, 15, 80);

noStroke();

ellipseMode(RADIUS);
fill(150, 150, 150, 200);
ellipse(168, 150, 50, 50);

ellipseMode(CORNERS);
fill(240, 50, 0);
ellipse(50, 50, 200, 200);

stroke(50);
line(360, 50, 120, 220);

noStroke();
fill(20, 20, 20, 200);
triangle(320, 100, 150, 150, 75, 120);

rect(20, 275, 250, 40);

fill(10, 10, 10, 200);
rect(280, 15, 5, 315);
rect(286, 15, 5, 315);

fill(250, 40, 0, 200);
rect(40, 300, 268, 50);
rect(311, 300, 30, 50);

stroke(50);
strokeWeight(5);
line(50, 200, 150, 380);



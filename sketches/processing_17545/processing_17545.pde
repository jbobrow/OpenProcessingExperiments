
size(250, 250);
background(0);

//center circle
smooth();
noStroke();
fill(#043574, 150);
ellipse(125, 125, 100, 100);

//surrounding circles
ellipse(80, 80, 100, 100);
//topleft
ellipse(80, 170, 100, 100);
//bottomleft
ellipse(170, 80, 100, 100);
//topright
ellipse(170, 170, 100, 100);
//bottomright

//innerdots
smooth();
noFill();
stroke(#043574, 150);
strokeWeight(6);
ellipse(80, 80, 10, 10);
//topleft
ellipse(80, 170, 10, 10);
//bottomleft
ellipse(170, 80, 10, 10);
//topright
ellipse(170, 170, 10, 10);
//bottomright
ellipse(125, 125, 10, 10);
//center

//diagonallines
smooth();
strokeWeight(1);
stroke(#043574, 150);
line(0, 250, 250, 0);
line(250, 250, 0, 0);
//bottom diagonal lines
line(90, 250, 250, 90);
line(160, 250, 0, 90);
//top diagonal lines
line(160, 0, 0, 160);
line(90, 0, 250, 160);



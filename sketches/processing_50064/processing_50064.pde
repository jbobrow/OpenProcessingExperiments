
// Homework #2
// Jung Lim, junglim, copyright 2012

size(400, 400);
smooth();
background(234, 138, 19);

float x, y, wd, ht;

x = 100;
y = 100;
wd = 200;
ht = 200;

noFill();
strokeWeight(3);
stroke(44, 124, 26);

// Background circles
ellipse(x + wd / 2, y + ht / 2, wd * 0.9, ht * 0.9);
ellipse(x + wd / 2, y + ht / 2, wd, ht);
stroke(95, 165, 50);
strokeWeight(4);
ellipse(x + wd / 2, y + ht / 2, wd * 1.1, ht * 1.1);
ellipse(x + wd / 2, y + ht / 2, wd * 1.2, ht * 1.2);
stroke(136, 193, 51);
strokeWeight(5);
ellipse(x + wd / 2, y + ht / 2, wd * 1.3, ht * 1.3);
ellipse(x + wd / 2, y + ht / 2, wd * 1.4, ht * 1.4);
stroke(194, 222, 76);
strokeWeight(6);
ellipse(x + wd / 2, y + ht / 2, wd * 1.5, ht * 1.5);
ellipse(x + wd / 2, y + ht / 2, wd * 1.6, ht * 1.6);


// Reference points
strokeWeight(1);
stroke(0);
point(x + .30 * wd, y + .40 * ht);
point(x + .44 * wd, y + .40 * ht);
point(x + .44 * wd, y + .58 * ht);
point(x + .43 * wd, y + .59 * ht);
point(x + .42 * wd, y + .60 * ht);
point(x + .30 * wd, y + .60 * ht);

point(x + .56 * wd, y + .40 * ht);
point(x + .56 * wd, y + .58 * ht);
point(x + .57 * wd, y + .59 * ht);
point(x + .58 * wd, y + .60 * ht);
point(x + .70 * wd, y + .60 * ht);


// J
strokeWeight(7);
stroke(220, 250, 53);

beginShape();
vertex(x + .30 * wd, y + .40 * ht);
vertex(x + .30 * wd, y + .40 * ht);
vertex(x + .44 * wd, y + .40 * ht);
vertex(x + .44 * wd, y + .58 * ht);
vertex(x + .43 * wd, y + .59 * ht);
vertex(x + .42 * wd, y + .60 * ht);
vertex(x + .30 * wd, y + .60 * ht);
endShape();


// L
beginShape();
vertex(x + .56 * wd, y + .40 * ht);
vertex(x + .56 * wd, y + .40 * ht);
vertex(x + .56 * wd, y + .58 * ht);
vertex(x + .57 * wd, y + .59 * ht);
vertex(x + .58 * wd, y + .60 * ht);
vertex(x + .70 * wd, y + .60 * ht);
vertex(x + .70 * wd, y + .60 * ht);
endShape();

//saveFrame ("hw2.jpg");

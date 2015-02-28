
size(300, 250);
smooth();
background(255, 128, 0);
fill(118, 238, 0);

//Body
noStroke();
arc(170, 250, 180, 190, PI, TWO_PI);

//Eyes
stroke(118, 238, 0);
strokeWeight(7);
fill(255);

ellipse(150, 167, 40, 40);
ellipse(210, 170, 36, 36);
ellipse(210, 212, 20, 20);
ellipse(180, 200, 42, 42);
ellipse(155, 222, 22, 22);
ellipse(130, 205, 30, 30);
ellipse(96, 195, 28, 28);
ellipse(115, 170, 22, 22);
ellipse(240, 196, 29, 29);
ellipse(103, 223, 28, 28);

//Pupils
int x=5;
strokeWeight(0);
fill(0);

ellipse(150, 169, x, x);
ellipse(215, 170, x, x);
ellipse(210, 215, x, x);
ellipse(178, 200, x, x);
ellipse(155, 222, x, x);
ellipse(130, 200, x, x);
ellipse(96, 190, x, x);
ellipse(117, 170, x, x);
ellipse(238, 198, x, x);
ellipse(105, 224, x, x);

//Mouth
stroke(255);
strokeWeight(4);
noFill();
arc(180, 215, 50, 50, PI/4, TWO_PI/4);


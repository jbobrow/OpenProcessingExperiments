

size(500, 500);
smooth();

int x = 250;
int y = 250;

int eyeSpacing = 20;
int eyeHeight = 20;

background(#d0fb06);

//bloated
fill(#fb067f);
noStroke();
ellipse(x, y, 400, 350);

//need the loo eyes
fill(0);
noStroke();
ellipse(x-eyeSpacing, y-eyeHeight, 20, 20);
ellipse(x+eyeSpacing, y-eyeHeight, 40, 40);

noFill();
stroke(20);
arc(x,y, 75, 75, 0.75, 2.6);




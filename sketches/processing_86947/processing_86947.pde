
size(500, 500);
smooth();

int x = 250;
int y = 250;

int eyeSpacing = 60;
int eyeHeight = 60;

background(#d0fb06);

fill(#fb067f);
noStroke();
ellipse(x, y, 400, 350);

fill(0);
noStroke();
ellipse(x-eyeSpacing, y-eyeHeight, 40, 40);
ellipse(x+eyeSpacing, y-eyeHeight, 40, 40);

//week 14 undereyes
noFill();
stroke(20);
arc(195,195, 75, 75, 0.75, 2.6);

noFill();
stroke(20);
arc(193,202, 75, 75, 0.75, 2.6);

noFill();
stroke(20);
arc(310,202, 75, 75, 0.75, 2.6);

noFill();
stroke(20);
fill(0);
noStroke();
beginShape();
vertex(200, 280);
vertex(280, 300);
vertex(295, 320);
vertex(230, 300);
endShape(CLOSE);




size (400, 200);

// background
noStroke ();
background(0);
for (int a=900; a>100; a=a-50)
{for (int b=255; b>16; b=b-16) 
{fill(255,b);}
ellipse(200,100,3*a/2,a);}

// bat logo
fill(0);
stroke (0);
strokeWeight(4);
beginShape();
vertex(4, 25);
quadraticVertex(50, 25, 100, 25);
quadraticVertex(170, 85, 180, 25);
quadraticVertex(200, 50, 220, 25);
quadraticVertex(230, 85, 300, 25);
quadraticVertex(350, 25, 396, 25);
quadraticVertex(350, 40, 325, 100);
quadraticVertex(220, 140, 200, 170);
quadraticVertex(180, 140, 75, 100);
quadraticVertex(50, 40, 4, 25);
vertex(4, 25);
endShape();



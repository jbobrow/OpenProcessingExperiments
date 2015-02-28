
size(600,250);
background(255,255,255);
smooth();

//Jaws and Eyes
line(50,50,550,50);
bezier(50,50,125,150,200,150,275,50);
bezier(275,50,375,150,450,150,550,50);
line(50,50,550,50);
line(50,200,290,150);
line(50,200,550,200);

//Iris
fill(255,3,3);
ellipse(215,75,50,50);
fill(255,3,3);
ellipse(480,75,50,50);
fill(0,0,0);
ellipse(215,75,30,30);
fill(0,0,0);
ellipse(480,75,30,30);
fill(255,255,255);
noStroke();
ellipse(230,70,30,30);
fill(255,255,255);
noStroke();
ellipse(495,70,30,30);

//Coded by Robin E.  Hello dear CCA Friends!


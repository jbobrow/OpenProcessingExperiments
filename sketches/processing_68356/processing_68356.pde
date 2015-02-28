
size(800,600);
background(150,200,255);
smooth();

fill(150,0,10);
beginShape();
vertex(240,250);
vertex(350,300);
vertex(250,450);
vertex(150,350);
endShape(CLOSE);

beginShape();
vertex(540,250);
vertex(650,300);
vertex(550,450);
vertex(450,350);
endShape(CLOSE);

fill(0,0,0);
ellipse(240,310,15,15);
ellipse(285,310,15,15);
ellipse(520,310,15,15);
ellipse(570,310,15,15);

line(280,340,240,360);
line(530,345,570,345);

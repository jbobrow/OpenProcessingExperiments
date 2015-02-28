
//Jason Xu
//6/8/13
//Creature: A simple living thing

size(200, 200);
smooth();
background(100);

ellipse(100, 100, 150, 100);
fill(230);
beginShape();
vertex(40, 70);
vertex(100, 70);
vertex(80, 100);
vertex(70, 90);
vertex(60, 100);
endShape(CLOSE);

beginShape();
vertex(100, 70);
vertex(160, 70);
vertex(140, 100);
vertex(130, 90);
vertex(120, 100);
endShape(CLOSE);

fill(0, 255, 0);
noStroke();
ellipse(70, 98, 6, 6);
ellipse(130, 98, 6, 6);

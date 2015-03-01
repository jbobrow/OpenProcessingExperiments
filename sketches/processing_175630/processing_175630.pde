
size(480,120);  //smooth lines
smooth();  //turns on smoothing
ellipse(140,60,90,90);
noSmooth();  //turns off smoothing 
ellipse(240,60,90,90);

size(480,120);  //stroke weight
smooth();
ellipse(75,60,90,90);
strokeWeight(8); 
ellipse(175,60,90,90);
ellipse(279,60,90,90);
strokeWeight(20);
ellipse(389,60,90,90);

size(480,120);  //stroke attributes 
smooth();
strokeWeight(12);
strokeJoin(ROUND);
rect(40,25,70,70);
strokeJoin(BEVEL);
rect(140,25,70,70);
strokeCap(SQUARE);
line(270,25,340,95);
strokeCap(ROUND);
line(350,25,420,95);

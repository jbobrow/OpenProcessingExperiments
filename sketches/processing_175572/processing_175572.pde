
size(800,600);  //window    

size(480,120);  //point
point(240,60);

size(480,120);  //line 
line(20,50,420,110);

size(480,120);  //basic shape 
quad(158,55,199,14,392,66,351,107);
triangle(347,54,392,9,392,66);
triangle(158,55,290,91,290,112);

size(480,120);  //rectangle 
rect(180,60,220,40);

size(480,120);  //ellipse 
ellipse(278,-100,400,400);
ellipse(120,100,110,110);
ellipse(412,60,18,18);

size(480,120);  //part of an ellipse 
arc(90,60,80,80,0,HALF_PI);
arc(190,60,80,0,PI+HALF_PI);
arc(290,60,80,80,PI,TWO_PI+HALF_PI);
arc(390,60,80,80,QUARTER_PI,PI+QUARTER_PI);

size(480,120);  //draw with degrees 
arc(90,60,80,80,0,radians(90));
arc(190,60,80,0,radians(270));
arc(290,60,80,80,radians(180),radians(450));
arc(390,60,80,80,radians(45),radians(225));

size(480,120);  //control your drawing order 
ellipse(140,0,190,190);
rect(160,30,260,20);

size(480,120);  //put it in reverse
rect(160,30,260,20);
ellipse(140,0,190,190);

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

size(480,120);  //paint with grays
smooth();
background(0);
fill(204);
ellipse(132,82,200,200);  //light gray circle 
fill(153);
ellipse(228,-16,200,200);  //medium gray circle
fiil(102);
ellipse(268,118,200,200);  //dark gray circle 

size(480,120);  //fill and stroke 
smooth();
fill(153);
ellipse(132,82,200,200);  //gray circle
noFill();
ellipse(228,-16,200,200);  //outline circle 
noStroke();
ellipse(268,118,200,200);   







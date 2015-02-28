
size (300, 300);
background (50);


noStroke();
smooth();

//head and body
fill(255);
stroke(255,255,255,30);
ellipse (150,150,81,100);
rect (110,153,81,80);
arc (190, 232, 161, 161, radians(45), radians(180));
stroke(0);
strokeWeight(3);
ellipse (301, 232, 220, 220);
strokeWeight(2);
ellipse (301, 232, 190, 190);
ellipse (301, 232, 150, 150);
ellipse (301, 232, 100, 100);
ellipse (301, 232, 50, 50);

//eyes
stroke(20);
strokeWeight(2);
fill(255);
ellipse (132, 140, 20, 20);
ellipse (165, 142, 30, 30);
ellipse (134, 140, 10,10);
ellipse (161, 142, 15,15);

//mouth
stroke(0);
strokeWeight(2);
ellipse (150,180, 50, 40);
ellipse (150, 180, 40, 30);


//horn(left)
beginShape();
vertex(113, 135);
vertex(60,90);
vertex(82,40);
vertex(85,45);
vertex(68,89);
vertex(116,127);
endShape(CLOSE);

quad (80,99,92,80,97,83,86,103);
quad (68,73,50,60,55,55,70,66);
quad (103,125,50,100,55,96,100,121);
quad (90,119,71,137,68,128,85,116);

//horn(right)
beginShape();
vertex(187, 135);
vertex(240,110);
vertex(228,55);
vertex(224,60);
vertex(232,107);
vertex(183,127);
endShape(CLOSE);

quad (232,73,250,60,245,55,230,66);
quad (236,96,260,84,257,79,235,88);
quad (232,107,214,90,209,96,226,110);
quad (215,122,229,134,232,128,219,119);




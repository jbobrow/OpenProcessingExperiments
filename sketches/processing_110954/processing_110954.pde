
size (500,500);

background (0);

//body
beginShape();
smooth();
noStroke();
fill(255,255,255);
vertex(101, 451);
vertex(169, 427);
vertex(254, 476);
vertex(337, 428);
vertex(404, 454);
vertex(404, 200);
bezierVertex (403,162, 380,100, 304,80);
bezierVertex (204,52, 110,93, 103,200);
endShape();

//eyebrow
stroke(0);
strokeWeight(22);
strokeCap (SQUARE);
line (161,180,  210,180);

//lefteye
strokeWeight(10);
ellipse (185,225, 31,31);

//righteye
strokeWeight(10);
ellipse (310,225, 31,31);

//mouth
stroke(211,26,48);
strokeWeight(15);
beginShape();
vertex(244,260);
vertex(274,267);
vertex(257,287);
vertex(274,304);
vertex(243,322);

endShape();





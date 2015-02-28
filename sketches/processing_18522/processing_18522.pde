
size(600, 600);

smooth();
background(132, 161, 135);
noStroke();
fill(255);
ellipseMode(CENTER);

//HAir
fill(113, 68, 56);
ellipse(245, 195, 320, 290);

//Face Shape
fill(#F3D4B6);
beginShape();
vertex(203, 118);
vertex(306, 143);
vertex(376, 226);
vertex(373, 255);
vertex(371, 346);
vertex(342, 402);
vertex(279, 461);
vertex(210, 478);
vertex(157, 461);
vertex(133, 390);
vertex(110, 291);
vertex(110, 227);
vertex(134, 152);
endShape(CLOSE);

//Beard
fill(#834F40, 50);
beginShape();
vertex(376, 226);
vertex(373, 255);
vertex(371, 346);
vertex(342, 402);
vertex(279, 461);
vertex(210, 478);
vertex(157, 461);
vertex(133, 390);
vertex(110, 291);

vertex(140, 370);
vertex(180, 350);
vertex(190, 340);
vertex(200, 345);
vertex(210, 340);
vertex(240, 350);
vertex(255, 360);
vertex(310, 340);




endShape();

//Ear
beginShape();
fill(#F3D4B6);
vertex(370, 250);
bezierVertex(380, 235, 390, 230, 395, 230);
bezierVertex(410, 250, 400, 270, 390, 290);
bezierVertex(390, 320, 370, 320, 385, 320);
bezierVertex(370, 320, 370, 300, 365, 305);
endShape();

//Nose
stroke(#736558);
noFill();
strokeWeight(2);
line(205, 250, 185, 330);
bezier(185, 330, 200, 335, 215, 335, 225, 330);


//Mouth
fill(#DD6B6C);
noStroke();
beginShape();
vertex(160, 392);
bezierVertex(181, 378, 192, 378, 186, 378);
bezierVertex(202, 385, 202, 385, 202, 385);
bezierVertex(219, 378, 228, 378, 224, 378);
bezierVertex(249, 389, 265, 386, 265, 386);
bezierVertex(240, 410, 195, 405, 195, 405);
endShape();

strokeWeight(2);
stroke(#3E1E1E, 20);
bezier(160, 392, 193, 395, 230, 395, 263, 386);



//bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);

//Whites of the eyes L
noStroke();
fill(255);
beginShape();
bezier(130, 257, 144, 270, 165, 270, 180, 257);
bezier(130, 257, 144, 230, 165, 230, 180, 257);

//blue of the eyes L
fill(82, 159, 199);
ellipse(148,251, 22, 22);
//Black of the eyes L
fill(0);
ellipse(148, 251, 12, 12);


//Whites of the eyes R
fill(255);
bezier(130 + 100, 256, 144 + 100, 270, 165 + 100, 270, 180 + 100, 256);
bezier(130 + 100, 256, 144 + 100, 230, 165 + 100, 230, 180 + 100, 256);
//blue of the eyes R
fill(82, 159, 199);
ellipse(148 + 100,251, 22, 22);
//Black of the eyes R
fill(0);
ellipse(148 + 100, 251, 12, 12);


//Glasses L
fill(#8DB3C2, 85);
stroke(51, 65, 71, 85);
ellipse(155, 250, 97, 57);
//Glasses R
ellipse(155 + 115, 250, 97, 57);

stroke(0, 70);
line(320, 250, 375, 237);
noFill();
bezier(205, 247, 210, 239, 215, 239, 222, 247);
















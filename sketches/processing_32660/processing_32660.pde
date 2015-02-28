
size(294,105);
background(9,85,137);
smooth();

fill(230,94,54);
beginShape();
vertex(233,48);
vertex(294,48);
vertex(294,67);
vertex(219,67);
curveVertex(265,0);
curveVertex(219,67);
curveVertex(233,48);
curveVertex(170,105);
endShape();

fill(246,243,236);
beginShape();
vertex(294,70);
vertex(294,105);
vertex(260,105);
curveVertex(325,0);
curveVertex(260,105);
curveVertex(294,70);
curveVertex(325,90);
endShape();


//FILL SHOULD BE: fill(88,136,78); 
//But it appears intersecting shapes negate fill or one shape dominates another
//even if shapes are arraged in from foreground to background..oy
noFill();
strokeWeight(4);
ellipse(277,98,130,130);

//FILL SHOULD BE: fill(0); 
noFill();
strokeWeight(4);
beginShape();
vertex(219,67);
vertex(294,67);
vertex(294,105);
vertex(125,105);
curveVertex(400,0);
curveVertex(125,105);
curveVertex(219,67);
curveVertex(500,105);
endShape();






background(255);
size(645,810);
smooth();

stroke(0);
strokeWeight(4);
line(199,13,180,130);
line(125,124,238,44);
line(160,25,238,146);
line(145,76,245,72);

line(540,415,540,810);
line(70,300,70,810);
line(0,520,650,520);
line(0,685,650,685);



fill(0);
ellipse(300,356,27,27);
ellipse(408,145,50,50);
ellipse(408,250,50,50);
line(408,145,408,250);
ellipse(540,410,110,110);
ellipse(640,320,50,50);
ellipse(640,520,75,75);
ellipse(68,240,160,120);
ellipse(640,695,88,88);
rect(70,520,470,170);
ellipse(540,760,50,50);
fill(227,52,3);
ellipse(540,760,25,25);


//right curve
beginShape();
fill(0);
curveVertex(520,0); //c1
curveVertex(530,0); 
curveVertex(535,130); 
curveVertex(570,177); 
curveVertex(620,245); 
curveVertex(650,260); //c2
curveVertex(650,260); //c2
vertex(width,0); 
endShape(CLOSE);


//top red shape
beginShape();
noStroke();
fill(227,52,3);
vertex(520,0); //c1
vertex(530,0); 
vertex(530,55); 
vertex(580,0); 
vertex(590,0); //c2
endShape(CLOSE);


//top curve
beginShape();
noFill();
stroke(0);
strokeWeight(4);
curveVertex(260,0); //V6
curveVertex(280,0); //C2
curveVertex(300,50); //V1
curveVertex(350,100); 
curveVertex(425,110); 
curveVertex(480,100); 
curveVertex(510,75); 
curveVertex(580,0); 
curveVertex(590,0); //c2
endShape();


//8 line 1
beginShape();
noStroke();
fill(227,52,3);
vertex(225, 390);
bezierVertex(145, 340, 260, 250 ,225, 390);
//bezierVertex(50, 80, 60, 25, 30, 20);
endShape(CLOSE);

//8 line 1
beginShape();
noStroke();
fill(0);
vertex(225, 390);
bezierVertex(145, 450, 280, 500 ,225, 390);
//bezierVertex(50, 80, 60, 25, 30, 20);
endShape(CLOSE);


//spiral
beginShape();
noFill();
stroke(0);
strokeWeight(4);
curveVertex(330,400); //C1
curveVertex(300,365); //V2
curveVertex(363,334); //V3
curveVertex(370,390); //V4
curveVertex(320,424); //V5
curveVertex(265,400); //V6
curveVertex(250,350); //V6
curveVertex(280,280); //V6
curveVertex(337,270); //V7
curveVertex(414,285); //C2
endShape();






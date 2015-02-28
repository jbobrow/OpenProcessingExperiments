
size(700,500);
fill(50);

//top of helmet
noStroke();
fill(255);
ellipseMode(CORNER);
ellipse(240,100,150,150); //left edge
ellipse(340,100,150,150); //right edge
rectMode(CORNER);
rect(315,100,100,150);     //top connector
rect(240,175,25,25);     //side connector left
rect(465,175,25,25);     //side connector right
fill(1);
rect(240,200,250,19);     //black crosspiece 

//face
noStroke();
fill(255);
rect(240,219,250,160);

//sides
stroke(0);
strokeWeight(4);
fill(0);             //left knob
rect(225,245,5,12);  
fill(0);               //right knob
rect(497,245,5,12);   
stroke(230);
strokeWeight(2);
fill(255);
rect(230,225,12,55);   //left earpiece
fill(255); 
rect(486,225,12,55);   //right earpiece

//eyes
noStroke();
strokeWeight(0);
fill(0);
triangle(265,225,350,225,285,260);     //left eye from corner left, right, bottom
triangle(380,225,465,225,445,260);     //right eye from corner left, right, bottom
stroke(0);
curve(350,260,265,225,285,258,285,150); //left eye edge
curve(380,190,465,225,445,258,445,152); //right eye edge

//left jaw
noStroke();
fill(255);
beginShape();
curveVertex(240,285);
curveVertex(240,285);
curveVertex(210,350);
curveVertex(265,400);
curveVertex(285,350);
curveVertex(285,350);
endShape();

//right jaw
noStroke();
fill(255);
beginShape();
curveVertex(490,285);
curveVertex(490,285);
curveVertex(520,350);
curveVertex(465,400);
curveVertex(445,350);
curveVertex(445,350);
endShape();

//mouth
stroke(0);
strokeWeight(2);
fill(0);
beginShape();
vertex(300,330);
bezierVertex(400,275,330,275,430,330);
endShape();

//chin
stroke(230);
strokeWeight(2);
fill(255);
beginShape();       // vertex of center point (365,320) 
vertex(315,330);
bezierVertex(330,300,405,300,415,330);
endShape();

//left chin
stroke(230);
strokeWeight(2);
beginShape();
vertex(315,330);
bezierVertex(200,300,250,500,345,390);
endShape();

//right chin
stroke(230);
strokeWeight(2);
beginShape();
vertex(415,330);
bezierVertex(530,300,480,500,385,390);
endShape();

//bottom of chin in 3 pieces
stroke(230);
strokeWeight(2);
fill(255);
ellipse(270,365,60,40);
ellipse(400,365,60,40);

noStroke();
fill(0);
ellipse(295,370,25,25);
ellipse(410,370,25,25);

noStroke();
fill(0);
rect(360,350,10,50);
rect(350,360,30,60);
rect(340,375,50,40);
rect(335,385,60,30);










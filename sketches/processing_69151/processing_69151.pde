
size(500,500);
background(255);

noStroke();

fill(255, 239, 196);
ellipse(240, 290, 15, 60);
ellipse(260, 290, 15, 60);
ellipse(240, 265, 60, 15);
ellipse(260, 265, 60, 15);

fill(0);
triangle(250, 150, 275, 300, 225, 300);

fill(255, 239, 196);
ellipse(250, 200, 100, 100);

fill(0);
beginShape();
curveVertex(200,200);
curveVertex(200,200);
curveVertex(250,150);
curveVertex(300,200);
curveVertex(300,200);
endShape(CLOSE);

beginShape();
curveVertex(250,150);
curveVertex(250,150);
curveVertex(287,160);
curveVertex(300,200);
curveVertex(300,200);
endShape(CLOSE);

beginShape();
curveVertex(250,150);
curveVertex(250,150);
curveVertex(215,160);
curveVertex(200,200);
curveVertex(200,200);
endShape(CLOSE);

fill(255, 239, 196);
triangle(240, 200, 250, 190, 260, 200);

fill(0, 255, 0);
ellipse(225, 210, 20, 20);
ellipse(275, 210, 20, 20);

fill(255);
ellipse(275, 210, 10, 10);
ellipse(225, 210, 10, 10);

noFill();
stroke(0);
strokeWeight(1);
beginShape();
curveVertex(240,230);
curveVertex(240,230);
curveVertex(250,235);
curveVertex(260,230);
curveVertex(260,230);
endShape();



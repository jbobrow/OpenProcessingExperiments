
size(400,400);
background(255);
smooth();

fill(255,0,127);
strokeWeight(4);
stroke(200,100,0);

beginShape();
curveVertex(0,0);
curveVertex(0,0);
curveVertex(200,200);
curveVertex(300,20);
curveVertex(500,400);
curveVertex(500,500);
vertex(500, 500);
vertex(500,0);
endShape(CLOSE);



size(500, 500);

background(156,237,204);

noStroke();
fill(174,193,237);
rect(59, 20, 30, 100);

fill(189,156,237);
rect(30, 30, 100, 100);

fill(255);
ellipse(80,80,100,100);

//stroke is color, do strokeWeight for stroke size
stroke(0,0,255);
strokeWeight(4);
fill(255,0,0);
triangle(80, 30, 30, 130, 130, 130);

stroke(0);
strokeWeight(1);

fill(0);
beginShape();
vertex(100,100);
vertex(100,130);
vertex(180,130);
vertex(20,100);
endShape(CLOSE);

noFill();
beginShape();
curveVertex(0, 400);
curveVertex(0, 400);
curveVertex(250, 20);
curveVertex(500, 400);
curveVertex(500, 400);
endShape(CLOSE);

//first two curveVertex numbers should be the same on first and last point
beginShape();
curveVertex(200,200);
curveVertex(200,200);
endShape();


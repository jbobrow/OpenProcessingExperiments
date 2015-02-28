
// Companion Cube
size(1000, 1000, P2D);
background(255, 255, 255);


// Dark Interior
fill(200, 200, 200);
noStroke();
rect(200, 200, 600, 600);


// Pink Lines (rendered as rectangles)
fill(245, 184, 204);
noStroke();
rect(200, 490, 600, 20);
rect(490, 200, 20, 600);

// Corners (dark)
beginShape();
noStroke();
fill(230, 230, 230);
vertex(180, 200);
vertex(200, 180);
vertex(350, 180);
vertex(370, 200);
vertex(370, 220);
vertex(220, 370);
vertex(200, 370);
vertex(180, 350);
vertex(180, 200);
endShape();

beginShape();
noStroke();
fill(230, 230, 230);
vertex(820, 200);
vertex(800, 180);
vertex(650, 180);
vertex(630, 200);
vertex(630, 220);
vertex(780, 370);
vertex(800, 370);
vertex(820, 350);
vertex(820, 200);
endShape();

beginShape();
noStroke();
fill(230, 230, 230);
vertex(820, 800);
vertex(800, 820);
vertex(650, 820);
vertex(630, 800);
vertex(630, 780);
vertex(780, 650);
vertex(800, 650);
vertex(820, 670);
vertex(820, 800);
endShape();

beginShape();
noStroke();
fill(230, 230, 230);
vertex(180, 800);
vertex(200, 820);
vertex(350, 820);
vertex(370, 800);
vertex(370, 780);
vertex(220, 650);
vertex(200, 650);
vertex(180, 670);
vertex(180, 800);
endShape();

// Side Pieces

fill(230, 230, 230);
noStroke();
rect(190, 430, 35, 140);
rect(775, 430, 35, 140);
rect(430, 190, 140, 35);
rect(430, 775, 140, 35);

// Circle
fill(230, 230, 230);
noStroke();
ellipse(500, 500, 300, 300);

// Heart

pushMatrix();
translate(0, -50);
noStroke();
fill(245, 184, 204);
beginShape();
vertex(498.03592, 658.0);
bezierVertex(686.5372, 564.6473, 586.0, 378.0, 498.0, 501.0);
endShape();
popMatrix();

pushMatrix();
translate(1000, -50);
scale(-1, 1);
noStroke();
fill(245, 184, 204);
beginShape();
vertex(498.03592, 658.0);
bezierVertex(686.5372, 564.6473, 586.0, 378.0, 498.0, 501.0);
endShape();
pushMatrix();



